#include "mfp_io.h"


int main() {

    int x,y,z=0;

    asm volatile
    ( 
        "   li  $t3, 0;"
        "   li  $t4, 6;"
        "   li  $t5, 0;"
        "   li  $t6, 0;"
        "   UDI0 $t4, $t3, $t5, 0;"
        "   UDI0 $t4, $t4, $t6, 0;"
        "   b .;"
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