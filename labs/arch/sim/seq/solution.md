# Steps
**iaddq**
```
Fetch       icode:ifun  ← M1[PC]
            rA:rB       ← M1[PC+1]
            valC        ← M8[PC+2]
            valP        ← PC + 10

Decode      valB        ← R[rB]
     
Execute     valE        ← valB + valC

Memory      valM        ← M8 [valE]

Write back  R[rB]       ← valM

PC update   PC          ← valP
```

diff seq-full.hcl
```
bool instr_valid = icode in 
	{ INOP, IHALT, IRRMOVQ, IIRMOVQ, IRMMOVQ, IMRMOVQ,
	       IOPQ, IJXX, ICALL, IRET, IPUSHQ, IPOPQ, IIADDQ };

bool need_regids =
	icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ, 
		     IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ };

bool need_valC =
	icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL, IIADDQ };

word srcB = [
	icode in { IOPQ, IRMMOVQ, IMRMOVQ, IIADDQ  } : rB;
	icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
	1 : RNONE;  # Don't need register
];

word dstE = [
	icode in { IRRMOVQ } && Cnd : rB;
	icode in { IIRMOVQ, IOPQ, IIADDQ } : rB;
	icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
	1 : RNONE;  # Don't write any register
];

word aluA = [
	icode in { IRRMOVQ, IOPQ } : valA;
	icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ } : valC;
	icode in { ICALL, IPUSHQ } : -8;
	icode in { IRET, IPOPQ } : 8;
	# Other instructions don't need ALU
];

word aluB = [
	icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL, 
		      IPUSHQ, IRET, IPOPQ, IIADDQ } : valB;
	icode in { IRRMOVQ, IIRMOVQ } : 0;
	# Other instructions don't need ALU
];
```

# Compiling issues
1. add `#define USE_INTERP_RESULT` at the beginning of `sim.h`. [error: ‘Tcl_Interp’ has no member named ‘result’](https://askubuntu.com/questions/372480/tcl-error-while-installing-wordnet)
2. comment `line[844-845]` in `ssim.c`. [undefined reference for 'matherr'](https://stackoverflow.com/questions/52903488/fail-to-build-y86-64-simulator-from-sources)