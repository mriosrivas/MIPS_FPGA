#include <mips/m32c0.h>
#include "mfp_io.h"
#include <math.h>

// Configure performance counters
#define INIT_PERF_COUNTS() ({\
        _m32c0_mtc0(C0_PERFCNT, 0, (0 << 5) | (1 << 1)); \
        _m32c0_mtc0(C0_PERFCNT, 2, (1 << 5) | (1 << 1)); \
        _m32c0_mtc0(C0_PERFCNT, 1, 0); \
        _m32c0_mtc0(C0_PERFCNT, 3, 0); \
    })

#define READ_PERF_COUNTS(num_cycles, completed_instrs) ({\
        num_cycles = _m32c0_mfc0(C0_PERFCNT, 1); \
        completed_instrs = _m32c0_mfc0(C0_PERFCNT, 3); \
        _m32c0_mtc0(C0_PERFCNT, 0, 0); \
        _m32c0_mtc0(C0_PERFCNT, 2, 0); \
        _m32c0_mtc0(C0_PERFCNT, 1, 0); \
        _m32c0_mtc0(C0_PERFCNT, 3, 0); \
    }) 


typedef union {
    float _f;
    int _i;
} _float;


#define F(x) ((x)*(x) - 2)


float bisection_soft();
int bisection_fpu();

// Function for writting a value in decimal format to the 7-seg displays.
void writeValTo7Segs(unsigned int val);


int main() {

    _float res_soft;
    int res_fpu;
    int num_cycles_soft, num_instr_soft;
    int num_cycles_fpu, num_instr_fpu;

    INIT_PERF_COUNTS();
    res_soft._f = bisection_soft();
    READ_PERF_COUNTS(num_cycles_soft, num_instr_soft);

    INIT_PERF_COUNTS();
    res_fpu = bisection_fpu();
    READ_PERF_COUNTS(num_cycles_fpu, num_instr_fpu);

    /* Display Results*/
    while (1) {
        // Check the switches state and show the corresponding value.
        switch( MFP_SWITCHES ) {

            /* fpu results */
            case 0:
		        MFP_7SEGEN = 0x00;
		        MFP_7SEGDIGITS = res_fpu;
                break;
            case 1:
                writeValTo7Segs(num_cycles_fpu);
                break;
            case 2:
                writeValTo7Segs(num_instr_fpu);
                break;

            /* software results */
            case 3:
		        MFP_7SEGEN = 0x00;
		        MFP_7SEGDIGITS = res_soft._i;
                break;
            case 4:
                writeValTo7Segs(num_cycles_soft);
                break;
            case 5:
                writeValTo7Segs(num_instr_soft);
                break;

            default:
                writeValTo7Segs(0);
        }
    }

    return 0;
}


/*
 * Software based bisection algorithm (NUM_ITERATIONS steps)
 */
float bisection_soft() {
    
    float a=1.25, b=2.5, tol=0.01, c, fc, fc_abs, fb;
    int led = 0;

    while(1){

        ////////////////////////
        // Compute: c=(a+b)/2
        ////////////////////////

        //////////////////////////////////////////////
        // Evaluate function in c: F(c) = c^2 - 2
        //////////////////////////////////////////////

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Check if |f(c)|-tol <= 0. If the condition is met, break. You can compute the absolute value using function fabsf()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //////////////////////////////////////////////
        // Evaluate function in b: F(b) = b^2 - 2
        //////////////////////////////////////////////

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Determine if the sign of f(b) is equal to the sign of f(c). If they are equal, make b=c, otherwise, make a=c.
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    }

    return c;
}


/*
 * FPU based bisection algorithm (NUM_ITERATIONS steps)
 * To avoid conversions and possible casts, this function works with int types
 * instead of floats
 */
int bisection_fpu() {
    int led = 0;
    int x;
    
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
    
    return x;
}



// Function for writting a value in decimal format to the 7-seg displays
void writeValTo7Segs(unsigned int val) {

  volatile int digit, i=0;
  volatile unsigned int allDigits=0, enDigits;


  for (i=0; ((val>0) && (i<8)); i++) {
    digit = val % 10;
    allDigits |= (digit<<(i*4));
    val = val / 10;
    enDigits |= 1 << i;
  }

  MFP_7SEGDIGITS = allDigits; // write value to 7-segment display
  MFP_7SEGEN = ~enDigits;     // enable subset of 7-segment displays
  
  return;
}
