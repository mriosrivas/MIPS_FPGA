#include "mfp_io.h"


int main() {

    int x;

    asm volatile
    ( 
        "   li $t3, 2;"         // Initialize first source operand
        "   li $t4, 3;"         // Initialize second source operand
        "   li $t6, 0;"         // Initialize destination operand
        "   nop;"               // Avoid RAW dependencies
        "   .word 0x018b700e;"  // nand $t6, $t4, $t3
        "   b .;"               // Stay here
        "   add %0, $t6, $zero;"
        : "=r" (x)
    );

    while (1) {
	    MFP_7SEGEN = 0x00;
	    MFP_7SEGDIGITS = x;
    }

    return 0;
}