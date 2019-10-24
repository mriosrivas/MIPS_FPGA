#include "mfp_io.h"


int main() {

    int x,y,z=0;

    asm volatile
    ( 
        "   li $t3, 4;"
        "   li $t4, 7;"
        "   li $t5, 0;"
        "   li $t6, 0;"
        "   nop;"
        "   .word 0x016c6828;"  // seq $t5, $t3, $t4
        "   .word 0x016b7028;"  // seq $t6, $t3, $t3
        "   b .;"               // Stay here
    );

    asm volatile
    ( 
        "   add %0, $t5, $zero;"
        : "=r" (x)
    );
    asm volatile
    ( 
        "   add %0, $t6, $zero;"
        : "=r" (y)
    );

    MFP_7SEGEN = 0x00;
    while (1) {
        // Check the switches state and show the corresponding value.
        switch( MFP_SWITCHES ) {
            case 0:
                MFP_7SEGDIGITS = x;
                break;
            case 1:
                MFP_7SEGDIGITS = y;
                break;
            default:
                MFP_7SEGDIGITS = z;
        }
    }

    return 0;
}