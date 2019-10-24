#include "mfp_io.h"


int main() {

    int x,y,j,k,z=0;

    asm volatile
    ( 
        "   li $t4, 6;"
        "   li $t3, 0;"
        "   li $t5, 1;"
        "   li $t6, 1;"
        "   li $t7, 1;"
        "   li $t8, 1;"
        "   nop;"
        "   movz $t5,$t4,$t3;"
        "   movz $t6,$t4,$t4;"
        "   movn $t7,$t4,$t3;"
        "   movn $t8,$t4,$t4;"
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
        : "=r" (j)
    );
    asm volatile
    ( 
        "   add %0, $t8, $zero;"
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
                MFP_7SEGDIGITS = j;
                break;
            case 3:
                MFP_7SEGDIGITS = k;
                break;
            default:
                MFP_7SEGDIGITS = z;
        }
    }

    return 0;
}