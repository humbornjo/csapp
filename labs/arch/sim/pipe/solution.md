# Steps

* Implement `iaddq` in `pipe-full.hcl`.
* 8-stride loop unrolling.
* achieve CPE=7.69 using 3-way divide after unrolling.
* avoiding data hazards by re-ordering instruction could boost it to 7.49.

# Compiling issues

1. add `#define USE_INTERP_RESULT` at the beginning of `sim.h`. [error: ‘Tcl_Interp’ has no member named ‘result’](https://askubuntu.com/questions/372480/tcl-error-while-installing-wordnet)
2. comment `line[806-807]` in `ssim.c`. [undefined reference for 'matherr'](https://stackoverflow.com/questions/52903488/fail-to-build-y86-64-simulator-from-sources)