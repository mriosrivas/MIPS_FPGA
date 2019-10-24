#include "mfp_io.h"


int main() {

    int x;

    asm volatile
    ( 
        "   nop;"
        "   li $t4, 0;"
        "   .word 0x61800004;" // addiupc $t4, 0x00004
        "   b .;"               // Stay here
        "   add %0, $t4, $zero;"
        : "=r" (x)
    );

    while (1) {
	    MFP_7SEGEN = 0x00;
	    MFP_7SEGDIGITS = x;
    }

    return 0;
}