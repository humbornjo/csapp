/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include <assert.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    /*
    *   s = 5, E = 1, b = 5 -> 2^10 Byte per Set
    *   addr of A: 0x10c120
    *   addr of B: 0x14c120
    *   addr diff 0x40000 is the multiple of 2^10
    *   when i == j , cache miss always occurs
    *   use default method, where N = M = 32
    *   A miss 1/8 times [2^5 = 32 Byte = 8*sizeof int] + diagnose miss 32
    *   B miss 1/1 times [jump 32*4 Byte per fetch]
    *   so,
            total miss is A[32*32/8+32] + B[32*32]                        = 1184
            total evict is number of miss minus number of set -> #miss-32 = 1152
            total hits is A[32*32*7/8] - diagnose miss 32 + 5             = 869
    *   why add 5 in computing total hits?
            #******* ******** ******** ******** 
            *#****** ******** ******** ******** 
            **#***** ******** ******** ******** 
            ***#**** ******** ******** ******** 
               ...      ...      ...      ...   <- omitted lines
            ******** ******** ******** ****#*** 
            ******** ******** ******** *****#** 
            ******** ******** ******** ******#* 
            ******** ******** ******** *******# 
            hash represents diag element, when it reach the multiple of 8, namely the 
            multiple of sizeof Set, it will miss, and it is included in the 1/8 miss
            so miss on diag pos 0 8 16 24 31 are minused twice, thus need to add back                                
    */

    int i, j, k, l; 
    int a, b, c, d, e, f, g, h;

    /*  
    *   try using blocking http://csapp.cs.cmu.edu/public/waside/waside-blocking.pdf
    *   why blocking works:

            B
            *|******* <- A
            *|*******
            *|*******
            *|*******
            *|*******
            *|*******
            *|*******
            *|*******

            In a block that fully leverage a Set (32 Byte), the pleasant blocking size should be 8
            when we perform B[j][i] = A[i][j], what is under the hood is that - a tmp var (a reg)
                saves the value in A[i][j] and then store it to B[j][i].
            since A follows the order of row->col, the next 7 value in A will hit. while B doomed.
            the basic idea is, save the 8 hit values in A in 8 var, then assign them to B, that way,
                the cache flow would be:
                A miss -> A 7 hits -> 8 B miss -> [A miss -> A 7 hits -> 8 B hits ->] ...
            the content in [] just repeat (except for i = j)
            forget about the diag shit, in every blocking unit, #miss would be 8+8=16. 
            there are 16 unit                                            -> total #miss = 16*16 = 256
            consider 4 diag unit, 7 more miss on B for the cache subsitiute per unit -> 4*7     = 28      
            not pretty sure where the other four miss occurs, might be A evict B
    *   https://arthals.ink/posts/experience/cache-lab <- to solve diag miss, refer to this solution
    */
    if (M == 32 && N == 32) {
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                for (k = 0; k < 8; ++k) {
                    a = A[i+k][j];
                    b = A[i+k][j+1];
                    c = A[i+k][j+2];
                    d = A[i+k][j+3];
                    e = A[i+k][j+4];
                    f = A[i+k][j+5];
                    g = A[i+k][j+6];
                    h = A[i+k][j+7];
                    B[j+k][i]   = a;
                    B[j+k][i+1] = b;
                    B[j+k][i+2] = c;
                    B[j+k][i+3] = d;
                    B[j+k][i+4] = e;
                    B[j+k][i+5] = f;
                    B[j+k][i+6] = g;
                    B[j+k][i+7] = h;
                }

                for (k = 0; k < 8; ++k) {
                    for (l = 0; l < k; ++l) {
                        a = B[j+k][i+l];
                        B[j+k][i+l] = B[j+l][i+k];
                        B[j+l][i+k] = a;
                    }
                }
            }
        }   
    }

    if (M == 64 && N == 64) {
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                for (k = 0; k < 4; ++k) {
                    a = A[i+k][j];
                    b = A[i+k][j+1];
                    c = A[i+k][j+2];
                    d = A[i+k][j+3];
                    e = A[i+k][j+4];
                    f = A[i+k][j+5];
                    g = A[i+k][j+6];
                    h = A[i+k][j+7];

                    B[j][i+k]   = a;
                    B[j+1][i+k] = b;
                    B[j+2][i+k] = c;
                    B[j+3][i+k] = d;

                    B[j][i+k+4] = e;
                    B[j+1][i+k+4] = f;
                    B[j+2][i+k+4] = g;
                    B[j+3][i+k+4] = h;
                }
                
                for (k = 0; k<4;++k) {
                    a = A[i+4][j+k];
                    b = A[i+5][j+k];
                    c = A[i+6][j+k];
                    d = A[i+7][j+k];
                    
                    e = B[j+k][i+4];
                    f = B[j+k][i+5];
                    g = B[j+k][i+6];
                    h = B[j+k][i+7];
                    
                    B[j+k][i+4] = a;
                    B[j+k][i+5] = b;
                    B[j+k][i+6] = c;
                    B[j+k][i+7] = d;

                    B[j+4+k][i] = e;
                    B[j+4+k][i+1] = f;
                    B[j+4+k][i+2] = g;
                    B[j+4+k][i+3] = h;
                }

                for (k = 0; k<4;++k) {
                    a = A[i+4+k][j+4];
                    b = A[i+4+k][j+5];
                    c = A[i+4+k][j+6];
                    d = A[i+4+k][j+7];

                    B[j+4+k][i+4] = a;
                    B[j+4+k][i+5] = b;
                    B[j+4+k][i+6] = c;
                    B[j+4+k][i+7] = d;
                }

                for (k = 0; k<4;++k) {
                    for (l = 0; l<k; ++l){
                        a = B[j+4+k][i+4+l];
                        B[j+4+k][i+4+l] = B[j+4+l][i+4+k];
                        B[j+4+l][i+4+k] = a;
                    }
                }
            }
        }   
    }

    if (M != N) { // 61 by 67
        for (int i = 0; i < N; i += 18) {
            for (int j = 0; j < M; j += 18) {
                for(int k = i; k < i + 18 && k < N; k ++)
                    for(int l = j; l < j + 18 && l < M; l++)
                        B[l][k] = A[k][l];
            }
        }    
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

    //     for (i = 0; i + 8 <= N; i += 8) {
    //         for (j = 0; j + 8 <= M; j += 8) {
    //             for (k = 0; k < 4; ++k) {
    //                 a = A[i+k][j];
    //                 b = A[i+k][j+1];
    //                 c = A[i+k][j+2];
    //                 d = A[i+k][j+3];
    //                 e = A[i+k][j+4];
    //                 f = A[i+k][j+5];
    //                 g = A[i+k][j+6];
    //                 h = A[i+k][j+7];

    //                 B[j][i+k]   = a;
    //                 B[j+1][i+k] = b;
    //                 B[j+2][i+k] = c;
    //                 B[j+3][i+k] = d;

    //                 B[j][i+k+4] = e;
    //                 B[j+1][i+k+4] = f;
    //                 B[j+2][i+k+4] = g;
    //                 B[j+3][i+k+4] = h;
    //             }
                
    //             for (k = 0; k<4;++k) {
    //                 a = A[i+4][j+k];
    //                 b = A[i+5][j+k];
    //                 c = A[i+6][j+k];
    //                 d = A[i+7][j+k];
                    
    //                 e = B[j+k][i+4];
    //                 f = B[j+k][i+5];
    //                 g = B[j+k][i+6];
    //                 h = B[j+k][i+7];
                    
    //                 B[j+k][i+4] = a;
    //                 B[j+k][i+5] = b;
    //                 B[j+k][i+6] = c;
    //                 B[j+k][i+7] = d;

    //                 B[j+4+k][i] = e;
    //                 B[j+4+k][i+1] = f;
    //                 B[j+4+k][i+2] = g;
    //                 B[j+4+k][i+3] = h;
    //             }

    //             for (k = 0; k<4;++k) {
    //                 a = A[i+4+k][j+4];
    //                 b = A[i+4+k][j+5];
    //                 c = A[i+4+k][j+6];
    //                 d = A[i+4+k][j+7];

    //                 B[j+4+k][i+4] = a;
    //                 B[j+4+k][i+5] = b;
    //                 B[j+4+k][i+6] = c;
    //                 B[j+4+k][i+7] = d;
    //             }

    //             for (k = 0; k<4;++k) {
    //                 for (l = 0; l<k; ++l){
    //                     a = B[j+4+k][i+4+l];
    //                     B[j+4+k][i+4+l] = B[j+4+l][i+4+k];
    //                     B[j+4+l][i+4+k] = a;
    //                 }
    //             }
    //         }
    //     }   
    //     for (;i + 4 <= N; i += 4) {
    //         for (;j + 4 <= M; j += 4) {
    //             for (k = 0; k < 4; ++k) {
    //                 a = A[i+k][j];
    //                 b = A[i+k][j+1];
    //                 c = A[i+k][j+2];
    //                 d = A[i+k][j+3];
    //                 B[j+k][i]   = a;
    //                 B[j+k][i+1] = b;
    //                 B[j+k][i+2] = c;
    //                 B[j+k][i+3] = d;
    //             }

    //             for (k = 0; k < 4; ++k) {
    //                 for (l = 0; l < k; ++l) {
    //                     a = B[j+k][i+l];
    //                     B[j+k][i+l] = B[j+l][i+k];
    //                     B[j+l][i+k] = a;
    //                 }
    //             }
    //         }
    //     }   
    //     for (;i < N; ++i) {
    //         for (;j <M; ++j) {
    //             a = A[i][j];
    //             B[j][i] = a;
    //         }
    //     }

    // }
