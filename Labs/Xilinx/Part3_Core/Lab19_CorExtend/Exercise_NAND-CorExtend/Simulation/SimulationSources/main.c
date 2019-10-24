#include "mfp_io.h"


int main() {

    int x;

    asm volatile
    ( 
        "   li $t3, 2;"         // Initialize first source operand
        "   li $t4, 3;"         // Initialize second source operand
        "   li $t5, 0;"         // Initialize destination operand
        "   nop;"               // Avoid RAW dependencies
        "   UDI1 $t4, $t3, $t5, 0;"
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