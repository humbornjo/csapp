# Programming Rules
1. You should not change any of the interfaces in mm.c.
2. You should not invoke any memory-management related library calls or system calls.
3. You are not allowed to define any global or static compound data structures such as arrays, structs, trees, or lists in your mm.c program. However, you are allowed to declare global scalar variables such as integers, floats, and pointers in mm.c.
4. For consistency with the libc malloc package, which returns blocks aligned on 8-byte boundaries, your allocator must always return pointers that are aligned to 8-byte boundaries.

So basically, according to the implementation in the book, all the "struct-style" operation should be substituted with macro.

# Reverie 
* Explict list for sure. That makes the minimum block size become HEADER+FOOTER+2*WSIZE. (Here compile with flag `-m32`, which lead to point size WSIZE=4)
* First I will implement a version based on the chunk extend malloc exhibited on book, improving it by applying free list.
* Try write a version of segrated list.

# Main
## Implicit Block
just copy the code in book
refer to the code in `mm_implicit.c`
```
Results for mm malloc:
trace  valid  util     ops      secs  Kops
 0       yes   99%    5694  0.124506    46
 1       yes   99%    5848  0.122788    48
 2       yes   99%    6648  0.174749    38
 3       yes  100%    5380  0.102116    53
 4       yes   66%   14400  0.000239 60302
 5       yes   91%    4800  0.122955    39
 6       yes   92%    4800  0.123724    39
 7       yes   55%   12000  1.199929    10
 8       yes   51%   24000  4.775258     5
 9       yes   27%   14401  0.901213    16
10       yes   34%   14401  0.074309   194
Total          74%  112372  7.721784    15

Perf index = 44 (util) + 1 (thru) = 45/100
```
Fuck, performance is literally a piece of shit.

## Explicit Block
explicit blk with the blk defined in the book
refer to the code in `mm_explicit.c`, **SAFETY** claimed in this file is almost all that I come up with in this lab. Might inspire you.

```
Results for mm malloc:
trace  valid  util     ops      secs  Kops
 0       yes   89%    5694  0.000134 42524
 1       yes   92%    5848  0.000091 64405
 2       yes   94%    6648  0.000165 40242
 3       yes   96%    5380  0.000144 37491
 4       yes   66%   14400  0.000201 71820
 5       yes   87%    4800  0.000197 24328
 6       yes   85%    4800  0.000204 23541
 7       yes   55%   12000  0.001103 10876
 8       yes   51%   24000  0.002367 10142
 9       yes   26%   14401  0.039550   364
10       yes   34%   14401  0.001831  7865
Total          70%  112372  0.045986  2444

Perf index = 42 (util) + 40 (thru) = 82/100
```

## Segrated List
Other optimization like round up small block to the power of two, is too tricky. I don't think its necessery. Other solution might be using different test trace file. Anyway, I think my method is good enough XD.

refer to the code in `mm.c`

```
Results for mm malloc:
trace  valid  util     ops      secs  Kops
 0       yes   98%    5694  0.000183 31047
 1       yes   94%    5848  0.000188 31040
 2       yes   98%    6648  0.000210 31642
 3       yes   99%    5380  0.000164 32805
 4       yes   66%   14400  0.000336 42832
 5       yes   88%    4800  0.000304 15784
 6       yes   85%    4800  0.000325 14778
 7       yes   55%   12000  0.000310 38710
 8       yes   51%   24000  0.000878 27322
 9       yes   30%   14401  0.045583   316
10       yes   45%   14401  0.002127  6770
Total          73%  112372  0.050610  2220

Perf index = 44 (util) + 40 (thru) = 84/100
```