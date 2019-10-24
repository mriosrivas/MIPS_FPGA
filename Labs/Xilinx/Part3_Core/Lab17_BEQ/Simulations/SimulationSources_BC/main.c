#include "mfp_io.h"


int main() {

    int x,y,z=0;

    asm volatile
    ( 
        ".set noreorder;"

        "   start: li $t1, 1;"
        "   li $t2, 1;"
        "   li $t3, 1;"
        "   li $t4, 2;"

        "   beql $t4, $t3, a;"
        "   add $t1, $t1, $t1;"
        "   add $t2, $t2, $t2;"

        "   a: beql $t4, $t4, b;"
        "   add $t2, $t2, $t2;"
        "   add $t1, $t1, $t1;"

        "   b:"
        "   b start;"
        "   nop;"

        ".set reorder;"
    );

    asm volatile
    ( 
        "   add %0, $t1, $zero;"
        : "=r" (x)
    );
    asm volatile
    ( 
        "   add %0, $t2, $zero;"
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