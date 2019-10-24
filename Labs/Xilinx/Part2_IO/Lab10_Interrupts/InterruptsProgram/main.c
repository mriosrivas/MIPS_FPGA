//
// This program exercises MIPSfpga's interrupts
//

#include <mips/cpu.h>
#include "mfp_io.h"

volatile int n;

void __attribute__ ((interrupt, keep_interrupts_masked)) _mips_general_exception ()
{
    unsigned cause = mips32_getcr ();  // Coprocessor 0 Cause register

    // check cause of interrupt
    if ((cause & 0x7c) != 0) {
        MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate exception state
        while (1);  // Loop forever non-interrupt exception detected
    }
    if (cause & CR_HINT0)  // Checking whether interrupt 0 is pending
        n = 0xffff;
    else if (cause & CR_HINT1)  // Checking whether interrupt 1 is pending
        n = 0x0;
    else if (cause & CR_HINT2)  // Checking whether interrupt 2 is pending
        n = 0xf0f;
    else if (cause & CR_HINT3)  // Checking whether interrupt 3 is pending
        n = 0x1111;
	MFP_LEDS = n;
}

int main () {
    MFP_LEDS = 0x5555;

    // set up interrupts
    // Clear boot interrupt vector bit in Coprocessor 0 Status register
    mips32_bicsr (SR_BEV);
        
    // Set master interrupt enable bit, as well as individual interrupt 
    // enable bits in Coprocessor 0 Status register
    mips32_bissr (SR_IE | SR_HINT0 | SR_HINT1 | SR_HINT2 | SR_HINT3 | SR_HINT4);

    while (1) {  // loop forever
      asm ("di");  // Disable interrupts
      n++;
      asm ("ei");  // Enable interrupts
	  MFP_LEDS = n;
    }
       
	
    return 0;
}
