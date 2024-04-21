/*
For the following C code, the expressions val1–val4 all map to the program
values i, f, d, and l:
*/
double fcvt2(int *ip, float *fp, double *dp, long l) {
  int i = *ip;       // %eax=i=*ip
  float f = *fp;     // %xmm0=f=*fp
  double d = *dp;    // %r8d=d=*dp
  *ip = (int)d;      // val1=d
  *fp = (float)i;    // val2=i
  *dp = (double)l;   // val3=l
  return (double)f;  // val4=f
}

/*
double fcvt2(int *ip, float *fp, double *dp, long l)
ip in %rdi, fp in %rsi, dp in %rdx, l in %rcx
Result returned in %xmm0
  1 fcvt2:
  2 movl (%rdi), %eax
  3 vmovss (%rsi), %xmm0
  4 vcvttsd2si (%rdx), %r8d
  5 movl %r8d, (%rdi)
  6 vcvtsi2ss %eax, %xmm1, %xmm1
  7 vmovss %xmm1, (%rsi)
  8 vcvtsi2sdq %rcx, %xmm1, %xmm1
  9 vmovsd %xmm1, (%rdx)
  10 vunpcklps %xmm0, %xmm0, %xmm0
  11 vcvtps2pd %xmm0, %xmm0
  12 ret
*/