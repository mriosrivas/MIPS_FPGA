#include <mips/m32c0.h>
#include "mfp_io.h"

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


// Function for writting a value in decimal format to the 7-seg displays.
void writeValTo7Segs(unsigned int val);


//----------------------------------------------------------------------
// Structure for storing the measurements from the Performance Counters
//----------------------------------------------------------------------
typedef struct {
    
    int event1;
    int event2;

} test_result_t;



//------------------------------------------------------
// Main Function
//------------------------------------------------------
int main() {

    test_result_t test_result;
    int x;


    /////////////////////////////////////////
    // Execute the algorithm from the I$
    /////////////////////////////////////////

    // Init performance counters
    INIT_PERF_COUNTS();

    asm volatile
    ( 
        "lui $t7, 0x3fa0;"           // $t7=1.25 (0x3fa00000)
        "lui $t8, 0x4020;"           // $t8=2.5  (0x40200000)

        "flpadd: lui $t4,0x007f;"
            "ori $t4,$t4,0xffff;"
            "and $t0,$t7,$t4;"
            "and $t1,$t8,$t4;"          
            "lui $t4,0x0080;"          
            "or $t0,$t0,$t4;"           
            "or $t1,$t1,$t4;"           
            "lui $t4,0x7f80;"             
            "and $t2,$t7,$t4;"          
            "srl $t2,$t2,23;"           
            "and $t3,$t8,$t4;"
            "srl $t3,$t3,23;"           
        "match: beq $t2,$t3,addsig;"
            "bgeu $t2,$t3,shiftb;"      
        "shifta: sub $t4,$t3,$t2;"  
            "srav $t0,$t0,$t4;"         
            "add $t2,$t2,$t4;"          
            "b addsig;"                 
        "shiftb: sub $t4,$t2,$t3;"  
            "srav $t1,$t1,$t4;"         
            "add $t3,$t3,$t4;"          
        "addsig: add $t5,$t0,$t1;"  
        "norm: lui $t4,0x0100;"        
            "and $t4,$t5,$t4;"          
            "beq $t4,$0,done;"          
            "srl $t5,$t5,1;"            
            "addi $t2,$t2,1;"           
        "done: lui $t4,0x007f;"
            "ori $t4,$t4,0xffff;"
            "and $t5,$t5,$t4;"          
            "sll $t2,$t2,23;"           
            "lui $t4,0x7f80;"             
            "and $t2,$t2,$t4;"          
            "or $t9,$t5,$t2;"              // Result $t9=3.75  (0x40700000)        

        "   add %0, $t9, $zero;"
        : "=r" (x)
    );

    // Read performance counters
    READ_PERF_COUNTS(test_result.event1,test_result.event2);


    /* Display Results*/
    while (1) {
        // Check the switches state and show the corresponding value.
        switch( MFP_SWITCHES ) {

            case 0:
                writeValTo7Segs(test_result.event1);
                break;
            case 1:
                writeValTo7Segs(test_result.event2);
                break;
            case 2:
		        MFP_7SEGEN = 0x00;
		        MFP_7SEGDIGITS = (int)x;
                break;
            default:
                writeValTo7Segs(0);
        }
    }

    return 0;
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