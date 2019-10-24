#include "mfp_io.h"


int main() {

    int x;

    asm volatile
    ( 
        "   li $t5, 0;"
        "   nop;"
        "   .word 0x9da00004;" // lwpc $t5, 0x00004
        "   nop;"
        "   li $t5, 0;"
        "   nop;"
        "   .word 0x9da00000;" // lwpc $t5, 0x00000
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