#include <stdio.h>
#include "csapp.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

/* You won't lose style points for including this long line in your code */
// static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

typedef struct {
    char *field;
    char *value;
} ReqHeader;

ReqHeader stdhdrs[] = {
    [0] = {"User-Agent", "Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3"},
    [1] = {"Host", NULL},
    [2] = {"Connection", "close"},
    [3] = {"Proxy-Connection", "close"}
};
size_t SIZE_STDHDRS = sizeof(stdhdrs)/sizeof(stdhdrs[0]);

#define INFO(msg) printf("[INFO] %s: %s\n", __FUNCTION__, msg)
#define TODO(msg) printf("[TODO] %s: %s\n", __FUNCTION__, msg)
#define PACK_HDR(line, field, value) sprintf(line, "%s: %s\r\n", field, value)

int forward(int fd_from);
int is_stdhdr(char *hdr);
int parse_url(char *url, char *host, char *port, char *uri);
void default_requesthdr(char *hdrs, char *host);
int filtered_requesthdr(char *hdrs, rio_t *rp);

int main(int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(1);
    } 

    int listenfd, connfd;
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;

    listenfd = Open_listenfd(argv[1]);
    while (1) {
        clientlen = sizeof(struct sockaddr_storage);
        if ((connfd = accept(listenfd, (struct sockaddr *)&clientaddr, &clientlen)) < 0)
            continue;
        forward(connfd);
        close(connfd);
    }
    // printf("%s", user_agent_hdr);
    return 0;
}

int forward(int fd_from) {
    int fd_to;
    rio_t rio;
    ssize_t nbyte;
    char buf[MAX_OBJECT_SIZE], reqhdrs[MAXLINE];
    char method[MAXLINE], url[MAXLINE], version[MAXLINE];
    char host[MAXLINE], port[MAXLINE], uri[MAXLINE];
    memset(buf, 0, MAX_OBJECT_SIZE);
    memset(reqhdrs, 0, MAXLINE);

    // parse req line 
    rio_readinitb(&rio, fd_from);
    if (rio_readlineb(&rio, buf, MAXLINE) < 0)  // read req line failed
        return -1;
    if (sscanf(buf, "%s %s %s", method, url, version) != 3)  // parse triplets failed
        return -1;
    if (parse_url(url, host, port, uri) < 0)  // parse url failed
        return -1;
    
    // parse req header
    default_requesthdr(reqhdrs, host);
    if (filtered_requesthdr(reqhdrs, &rio) < 0) 
        return -1;

    sprintf(buf, "%s %s HTTP/1.0\r\n%s\r\n", method, uri, reqhdrs);
    INFO(buf);
    
    if ((fd_to = open_clientfd(host, port)) < 0) 
        return -1;
    if (rio_writen(fd_to, buf, strlen(buf)) != strlen(buf)) {
        close(fd_to);
        return -1;
    }

    while ((nbyte = rio_readn(fd_to, buf, MAX_OBJECT_SIZE))) {
        if (nbyte < 0) {
            close(fd_to);
            return -1;
        }
        if (nbyte == 0) 
            break;
        if (rio_writen(fd_from, buf, nbyte) != nbyte) {
            close(fd_to);
            return -1;
        }
    }

    close(fd_to);
    return 0;
}

void default_requesthdr(char *hdrs, char *host) {
    char line[MAXLINE];
    for (size_t i = 0; i < SIZE_STDHDRS; ++i) {
        char *field = stdhdrs[i].field;
        char *value = stdhdrs[i].value;
        if (stdhdrs[i].value == NULL)
            value = host;
        PACK_HDR(line, field, value);
        strcat(hdrs, line);
    }
    INFO(hdrs);
}

int filtered_requesthdr(char *hdrs, rio_t *rp) {
    char line[MAXLINE];
    if (rio_readlineb(rp, line, MAXLINE) < 0) 
        return -1;
    while (strcmp(line, "\r\n")) {
        if (!is_stdhdr(line))
            strcat(hdrs, line);
        if (rio_readlineb(rp, line, MAXLINE) < 0) 
            return -1;
    }
    return 0;
}

int is_stdhdr(char *hdr) {
    for (size_t i = 0; i < SIZE_STDHDRS; ++i) {
        char *field = stdhdrs[i].field;
        if (strncmp(field, hdr, strlen(field)) == 0) 
            return 1;
    }
    return 0;
}

int parse_url(char *url, char *host, char *port, char *uri) {
    if (strncasecmp(url, "http://", strlen("http://")))
        return -1;

    url += strlen("http://");
    char *port_start = strchr(url, ':');
    char *uri_start = strchr(url, '/');

    if (uri_start == NULL) 
        return -1;
    strcpy(uri, uri_start);
    *uri_start = '\0';
    if (port_start == NULL) {
        strcpy(port, "80");
        strcpy(host, url);
        return 0;
    }
    *port_start = '\0';
    strcpy(port, port_start+1);
    strcpy(host, url);
    return 0;
}