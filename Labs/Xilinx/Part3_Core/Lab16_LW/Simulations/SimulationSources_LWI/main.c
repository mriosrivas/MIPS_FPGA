#include "mfp_io.h"

int __attribute__((aligned(16))) test_data[10]={0xf,0xe,0xd,0xc,0xb,0xa,0x9,0x8,0x7,0x6};

int main() {

    int x;

    asm volatile
    ( 
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   addiu $t3, $zero, 4;"
        "   nop;"
        "   .word 0x01cb681c;"  // lwi $t5, $t6, $t3
        "   li $t5, 0;"
        "   nop;"
        "   .word 0x01cb681c;"  // lwi $t5, $t6, $t3
        "   b .;"               // Stay here
        "   add %0, $t5, $zero;"
        : "=r" (x)
    );

    while (1) {
	    MFP_7SEGEN = 0x00;
	    MFP_7SEGDIGITS = x;
    }

    return 0;
}