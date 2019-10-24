#include "mfp_io.h"


int main() {

    int x=0;

    MFP_7SEGEN = 0x00;
    MFP_7SEGDIGITS = x;

    asm volatile
    ( 
        // Initialize a, b and other constants used in the algorith
        "   lui $t3, 0x3fa0;"           // $t3=1.25
        "   lui $t4, 0x4020;"           // $t4=2.5

        "loop:"

        // Compute: c=(a+b)/2
        "   nop;"
        "   UDI3 $t4, $t3, $t6, 0;"     // a+b
        "   nop;"
        "   lui $t5, 0x4000;"           // $t5=2.0
        "   UDI5 $t6, $t5, $t6, 0;"     // (a+b)/2


        // Evaluate function: F(c) = c^2 - 2
        "   nop;"
        "   UDI4 $t6, $t6, $t2, 0;"     // c*c
        "   nop;"
        "   lui $t8, 0xc000;"           // $t8=-2.0
        "   UDI3 $t2, $t8, $t2, 0;"     // (c*c)-2
        "   nop;"


        // Check if |f(c)|-tol <= 0, for a tolerance of 0.01 (0xbc23d70a). If the condition is met, go out of the loop by jumping to the tag Out_Bisection.
        "   lui $t8, 0x7fff;"
        "   ori $t1, $zero, 0xffff;"
        "   add $t8, $t8, $t1;"         // mask for computing the absolute value of f(c)
        "   and $t1, $t2, $t8;"         // computation of |f(c)|
        "   lui $t9, 0xbc23;"
        "   ori $t0, $zero, 0xd70a;"
        "   add $t9, $t9, $t0;"         // $t9=-0.01 (Tolerance)
        "   nop;"
        "   UDI3 $t1, $t9, $t1, 0;"     // computation of (|f(c)|-tol)
        "   nop;"
        "   lui $t9, 0x8000;"           // Mask used for evaluating the sign of a floating-point value
        "   and $t1, $t1, $t9;"         // Mask everyting but the sign of f(c)
        "   bne $t1, $zero, Out_Bisection;"


        // Evaluate function: F(b) = b^2 - 2
        "   nop;"
        "   UDI4 $t4, $t4, $t7, 0;"
        "   nop;"
        "   lui $t8, 0xc000;"           // $t8=-2.0
        "   UDI3 $t7, $t8, $t7, 0;"
        "   nop;"

        // Compute new a or b
        "   and $t2, $t2, $t9;"         // Mask everyting but the sign of f(c)
        "   and $t7, $t7, $t9;"         // Mask everyting but the sign of f(b)
        "   beq $t2, $t7, bc;"
        "   add $t3, $t6, $zero;"        // If sign(c)!=sign(b): a=c
        "   j loop2;"
        "bc:"
        "   add $t4, $t6, $zero;"         // If sign(c)==sign(b): b=c
        "   loop2: nop;"

        // Perform another iteration
        "j loop;"

        // Go out of the loop
        "Out_Bisection: nop;"

        // Output final result
        "   add %0, $t6, $zero;"
        : "=r" (x)
    );


    while (1) {
        MFP_7SEGEN = 0x00;
        MFP_7SEGDIGITS = x;
    }

    return 0;
}