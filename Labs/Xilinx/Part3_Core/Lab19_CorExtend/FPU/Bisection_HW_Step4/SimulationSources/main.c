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

        ////////////////////////
        // Compute: c=(a+b)/2
        ////////////////////////

        //////////////////////////////////////////////
        // Evaluate function in c: F(c) = c^2 - 2
        //////////////////////////////////////////////

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Check if |f(c)|-tol <= 0. If the condition is met, go out of the loop by branching to the tag Out_Bisection.
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        //////////////////////////////////////////////
        // Evaluate function in b: F(b) = b^2 - 2
        //////////////////////////////////////////////

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Determine if the sign of f(b) is equal to the sign of f(c). If they are equal, jump to the tag bc, otherwise, continue sequentially.
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        ///////////////
        // Set a=c
        ///////////////

        "   j loop2;"
        "   nop;"

        "bc:"
        ///////////////
        // Set b=c
        ///////////////

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