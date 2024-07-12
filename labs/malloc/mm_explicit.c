/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 * 
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
    /* Team name */
    "better call sole",
    /* First member's full name */
    "humbornjo",
    /* First member's email address */
    "humbornjo@seu.edu.cn",
    /* Second member's full name (leave blank if none) */
    "",
    /* Second member's email address (leave blank if none) */
    ""
};

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)

#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

// some macro by humbornjo
#define WSIZE 4
#define DSIZE 8
#define CHUNKSIZE (1<<13)
#define MAX(x, y) ((x) > (y)? (x) : (y))
#define PACK(size, alloc) ((size) | (alloc))
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val))
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)
#define HDRP(bp) ((char *)(bp) - WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))
#define NEXT_FREE_BLKP(bp) ((char *)(*(unsigned int *)((char *)(bp) + WSIZE)))
#define PREV_FREE_BLKP(bp) ((char *)(*(unsigned int *)(bp)))
#define REMOVE_FREE(bp) do { \
        PUT(PREV_FREE_BLKP(bp) + (1*WSIZE), (unsigned int)NEXT_FREE_BLKP(bp)); \
        PUT(NEXT_FREE_BLKP(bp), (unsigned int)PREV_FREE_BLKP(bp)); \
    } while (NULL)
#define INSERT_FREE(bp) do { \
        PUT((char *)bp, (unsigned int)heap_freep); \
        PUT((char *)bp + (1*WSIZE), (unsigned int)NEXT_FREE_BLKP(heap_freep)); \
        PUT(NEXT_FREE_BLKP(heap_freep), (unsigned int)bp); \
        PUT(heap_freep + (1*WSIZE), (unsigned int)bp); \
    } while (NULL)

static char *heap_listp;
static char *heap_freep;

static void *coalesce(void *bp);
static void *extend_heap(size_t words);
static void *find_fit(size_t asize);
static void place(void *bp, size_t asize);

/* 
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
    // SAFETY: 
    //   heap layout:   
    //                  | isolated free blk | prologue blk | ... | epilogue blk |
    //   free list layout: 
    //                  | isolated free blk | -> ... -> | isolated free blk | 
    //   isolated free blk layout: (initially)
    //                  | header        | <- size=0, alloc=0, *bottom of heap*
    //                  | &header+WSIZE | 
    //                  | &header+WSIZE | 
    //   free block layout:
    //                  | header        |
    //                  | prev blk      |
    //                  | next blk      |
    //                  | payload       |
    //                  | padding (opt) |
    //                  | footer        |
    //   consider push a free block bp into the free list:
    //      1. PUT((char *)bp, (unsigned int)heap_freep); 
    //      2. PUT((char *)bp + (1*WSIZE), (unsigned int)NEXT_FREE_BLKP(heap_freep)); 
    //      3. PUT(NEXT_FREE_BLKP(heap_freep), (unsigned int)bp); 
    //      4. PUT(heap_freep + (1*WSIZE), (unsigned int)bp); 
    //   * Notice that only the allocated blk require the 8 byte alignment.
    //   so since isolated free block can be only 3*WSIZE long, with
    //   its ptr not 8 byte aligned.
    //   * Initially, the isolated free blk point to itself - a recurrent list.
    //   * There is no chance that the footer of isolated free block is reached
    //   because we only use the HDRP to get the size in free blk. func find_fit
    //   will always check the HDRP start from NEXT_FREE_BLKP(heap_freep), until
    //   finding size 0.
    //   * The isolated free blk will never be adjacent to any free blk - the
    //   position of free blk is restricted in between prologue blk and epilogue
    //   blk. which cut off the corner cases.

    if ((heap_listp = mem_sbrk(6*WSIZE)) == (void *)-1)
        return -1;

    // introduce free block to maintain consistency
    heap_freep = heap_listp + (1*WSIZE); 

    PUT(heap_listp, 0);
    PUT(heap_listp + (1*WSIZE), (unsigned int)heap_freep);
    PUT(heap_listp + (2*WSIZE), (unsigned int)heap_freep);
    PUT(heap_listp + (3*WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (4*WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (5*WSIZE), PACK(0, 1));
    
    heap_listp += (4*WSIZE);

    if (extend_heap(CHUNKSIZE/WSIZE) == NULL)
        return -1;

    return 0;
}

/* 
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size)
{
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    char *bp;

    /* Ignore spurious requests */
    if (size == 0)
        return NULL;

    /* Adjust block size to include overhead and alignment reqs. */
    if (size <= DSIZE)
        asize = 2*DSIZE;
    else
        asize = DSIZE * ((size + (DSIZE) + (DSIZE-1)) / DSIZE);

    #ifdef DEBUG
        printf("[INFO] mm_malloc: asize -> %d\n", asize);
        fflush(stdout);
    #endif

    /* Search the free list for a fit */
    if ((bp = find_fit(asize)) != NULL) {
        place(bp, asize);
        return bp;
    }

    /* No fit found. Get more memory and place the block */
    extendsize = MAX(asize,CHUNKSIZE);
    if ((bp = extend_heap(extendsize/WSIZE)) == NULL)
        return NULL;
    place(bp, asize);
    return bp;
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr)
{
    size_t size = GET_SIZE(HDRP(ptr));

    PUT(HDRP(ptr), PACK(size, 0));
    PUT(FTRP(ptr), PACK(size, 0));
    coalesce(ptr);
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size)
{
    void *oldptr = ptr;
    void *newptr;
    size_t copySize;
    
    newptr = mm_malloc(size);
    if (newptr == NULL)
      return NULL;
    copySize = GET_SIZE(HDRP(ptr)) - DSIZE;
    if (size < copySize)
      copySize = size;
    memcpy(newptr, oldptr, copySize);
    mm_free(oldptr);
    return newptr;
}

// mm_check - check any invariants or consistency condition
static int mm_check(void) 
{
    void *bp = heap_freep;
    printf("[INFO] traverse free list: heap_freep -> %p, prev -> %p, next -> %p\n", heap_freep, (void *)(*(unsigned int *)bp), (void *)(*(unsigned int *)((char *)bp+1*WSIZE)));
    for (bp = NEXT_FREE_BLKP(heap_freep); GET_SIZE(HDRP(bp)) > 0; bp = NEXT_FREE_BLKP(bp)) {
        printf("       ptr -> %p, size -> %d, prev -> %p, next -> %p\n", bp, GET_SIZE(HDRP(bp)), (void *)(*(unsigned int *)bp), (void *)(*(unsigned int *)((char *)bp+1*WSIZE)));
        fflush(stdout);
    }
    printf("       ptr -> %p, size -> %d, prev -> %p, next -> %p\n", bp, GET_SIZE(HDRP(bp)), (void *)(*(unsigned int *)bp), (void *)(*(unsigned int *)((char *)bp+1*WSIZE)));
    return 1;
}

// coalesce - coalesce any adjacent freed memory block
//          * dirty work concerned with free list is handled by coalesce
static void *coalesce(void *bp)
{
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size       = GET_SIZE(HDRP(bp));

    if (prev_alloc && next_alloc) { /* Case 1 */
        ;
    } else if (prev_alloc && !next_alloc) { /* Case 2 */
        REMOVE_FREE(NEXT_BLKP(bp)); // remove next blk
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size,0));
    } else if (!prev_alloc && next_alloc) { /* Case 3 */
        REMOVE_FREE(PREV_BLKP(bp)); // remove prev blk
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    } else { /* Case 4 */
        REMOVE_FREE(NEXT_BLKP(bp)); // remove next blk
        REMOVE_FREE(PREV_BLKP(bp)); // remove prev blk
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) +
        GET_SIZE(FTRP(NEXT_BLKP(bp)));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    INSERT_FREE(bp);                // insert into free list
    
    return bp;
}


// extend_heap - extend heap for words*WSIZE size 
static void *extend_heap(size_t words)
{
    char *bp;
    size_t size;

    /* Allocate an even number of words to maintain alignment */
    size = (words % 2) ? (words+1) * WSIZE : words * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1)
        return NULL;

    /* Initialize free block header/footer and the epilogue header */
    PUT(HDRP(bp), PACK(size, 0)); /* Free block header */
    PUT(FTRP(bp), PACK(size, 0)); /* Free block footer */
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */

    /* Coalesce if the previous block was free */
    return coalesce(bp);
}

static void *find_fit(size_t asize)
{
    /* First-fit search */
    void *bp = NEXT_FREE_BLKP(heap_freep);

    for (; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_FREE_BLKP(bp)) {
        if (asize <= GET_SIZE(HDRP(bp))) 
            return bp;
    }

    return NULL; /* No fit */
}

static void place(void *bp, size_t asize)
{
    REMOVE_FREE(bp);
    size_t csize = GET_SIZE(HDRP(bp));

    if ((csize - asize) >= (2*DSIZE)) {
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(csize-asize, 0));
        PUT(FTRP(bp), PACK(csize-asize, 0));
        coalesce(bp);
    }
    else {
        PUT(HDRP(bp), PACK(csize, 1));
        PUT(FTRP(bp), PACK(csize, 1));
    }
}







