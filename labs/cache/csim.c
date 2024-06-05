#include "cachelab.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <stdint.h>

#define FLAG_NUM 6

struct Cfg {
    int s;
    int E;
    int b;
    int verbose;
} config;

struct Line {
    int valid;
    int tag;
    int lru_used;
};
typedef struct Line *Set;
Set *cache;

struct Flag {
    char name;
    char *description;
    int  optional;
    char *value;
};

struct Flag flags[FLAG_NUM] = {
    [0] = {'h', "Optional help flag that prints usage info", 1, NULL},
    [1] = {'v', "Optional verbose flag that displays trace info", 1, NULL},
    [2] = {'s', "Number of set index bits (S = 2^s is the number of sets)", 0, "s"},
    [3] = {'E', "Associativity (number of lines per set)", 0, "E"},
    [4] = {'b', "Number of block bits (B = 2^b is the block size)", 0, "b"},
    [5] = {'t', "Name of the valgrind trace to replay", 0, "tracefile"},
};

int hit = 0, miss = 0, evict = 0, timestamp = 0;

void help (const char *exe); // print help Usage
void simulate(FILE *tfile); // simulate config behavior
void caching(char op, size_t addr, int size);


int main(int argc, char *argv[])
{
    int opt;
    FILE *tfile;

    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch (opt) {
        case 'v':
            config.verbose = 1;
            break;
        case 's':
            config.s = atoi(optarg);
            break;
        case 'E':
            config.E = atoi(optarg);
            break;
        case 'b':
            config.b = atoi(optarg);
            break;
        case 't':
            tfile = fopen(optarg, "r");
            if (tfile == NULL) {
                perror("Error opening the file");
                exit(1);
            }
            break;
        case 'h':
            help(argv[0]);
            exit(EXIT_FAILURE);
        }
    }
    if (config.s == 0 || config.E == 0 || config.b == 0 || tfile == NULL)  {
        help(argv[0]);
        exit(EXIT_FAILURE);
    }
    
    // could use lazy allocate
    cache = malloc(sizeof(Set) * (1<<config.s));
    for (size_t i = 0; i<(1<<config.s); ++i) {
        cache[i] = malloc(sizeof(struct Line) * config.E);
        for (size_t j = 0; j<config.E; ++j) {
            cache[i][j].valid = -1;
            cache[i][j].tag = -1;
            cache[i][j].lru_used = -1;
        }
    }

    simulate(tfile);

    printSummary(hit, miss, evict);
    return 0;
}

void help (const char *exe) {
    printf("Usage: %s <flag>\n", exe); // how to made a pattern that cover opt/non-opt flags
    printf("Flag:\n");
    for (size_t i= 0 ; i<FLAG_NUM; ++i) {
        struct Flag flag = flags[i];
        printf("   -%c ", flag.name);
        if (flag.value != NULL)
            printf("<%s> ", flag.value);
        printf(": %s\n", flag.description);
    }
    printf("Example:\n   linux> ./csim-ref -v -s 4 -E 1 -b 4 -t traces/yi.trace\n");
}

void simulate(FILE *tfile) {
    int size;
    char operation;
    size_t address;
    while (fscanf(tfile, " %c %lx,%d\n", &operation, &address, &size) == 3) {
        ++timestamp;
        switch (operation) {
        case 'M': // Modify: Load -> Store
        case 'L': // Load
        case 'S': // Store
            caching(operation, address, size);
        }
    }
    free(cache);
}

void caching(char op, size_t addr, int size) {
    int set_i = (addr>>config.b) & ((1<<config.s) - 1);
    int tag_i = addr>>(config.b+config.s);
    int ifevict = 1;

    Set selected_set = cache[set_i];
    int lru_v = selected_set[0].lru_used, lru_i = 0;

    for (size_t i = 0; i<config.E; ++i) {
        if (selected_set[i].tag == tag_i) {
            ++hit;
            selected_set[i].lru_used = timestamp;
            if(op == 'M') ++hit;
            if(config.verbose) {
                printf("%c %lx,%d hit", op, addr, size); 
                if (op == 'M') printf(" hit");
                printf("\n");
            }
            return;
        }
        if (selected_set[i].lru_used<lru_v) {
            lru_i = i;
            lru_v = selected_set[i].lru_used;
        }
    }

    selected_set[lru_i].valid = 1;
    selected_set[lru_i].tag = tag_i;
    selected_set[lru_i].lru_used = timestamp;

    ++miss;
    
    ifevict = (lru_v != -1);
    evict += ifevict;
    if (config.verbose) {
        printf("%c %lx,%d miss", op, addr, size);
        if (ifevict == 1) printf(" eviction");
    }

    if (op == 'M') {
        ++hit;
        if (config.verbose) printf(" hit");
    }
    if (config.verbose) printf("\n");
}
