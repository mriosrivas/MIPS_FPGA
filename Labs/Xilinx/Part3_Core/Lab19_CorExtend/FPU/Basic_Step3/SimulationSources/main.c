#include "mfp_io.h"


int main() {

    int x,y,k,z=0;

    asm volatile
    ( 
        "   lui $t4, 0x4080;"   // = 4
        "   lui $t3, 0x4000;"   // = 2
        "   lui $t5, 0x0000;"
        "   lui $t6, 0x0000;"
        "   lui $t7, 0x0000;"
        "   nop;"
        "   UDI3 $t4, $t3, $t5, 0;" // 4 + 2 = 6 (0x40c00000)
        "   nop;"
        "   UDI4 $t4, $t3, $t6, 0;" // 4 * 2 = 8 (0x41000000)
        "   nop;"
        "   UDI5 $t4, $t3, $t7, 0;" // 4 / 2 = 2 (0x40000000)
        "   nop;"
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

    asm volatile
    ( 
        "   add %0, $t7, $zero;"
        : "=r" (k)
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
            case 2:
                MFP_7SEGDIGITS = k;
                break;
            default:
                MFP_7SEGDIGITS = z;
        }
    }

    return 0;
}