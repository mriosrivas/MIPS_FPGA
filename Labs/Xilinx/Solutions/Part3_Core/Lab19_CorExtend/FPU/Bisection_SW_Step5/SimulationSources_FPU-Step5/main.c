#include "mfp_io.h"
#include <math.h>


typedef union {
    float _f;
    int _i;
} _float;


#define F(x) ((x)*(x) - 2)


int main() {

    _float res_soft;
    float a=1.25, b=2.5, tol=0.01, c, fc, fc_abs, fb;

    MFP_7SEGEN = 0x00;
    MFP_7SEGDIGITS = 0;

    while(1){

        //Compute new c
        c=(a+b)/2;

        // Evaluate function: F(c) = c^2 - 2
        fc=F(c);

        // Check if |f(c)|-tol <= 0. If the condition is met, go out of the loop by jumping to the tag Out_Bisection.
        if((fabsf(fc)-tol) <= 0) break;
        
        // Evaluate function in a, b and c
        fb=F(b);

        // Determine new value for a or b
        if(fb*fc<0)
        {
            a=c;
        }
        else
        {
            b=c;
        }

    }

    res_soft._f = c;

    while (1) {
        MFP_7SEGEN = 0x00;
        MFP_7SEGDIGITS = res_soft._i;
    }

    return 0;
}