/*
 * main.c for the MIPSfpga core running on the Nexys4 DDR
 * FPGA target board.
 *
 * Lab 04: Pocket-hypnotizer.
 */

#include "mfp_io.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile unsigned int val = 1;

  while (1) {  
    while (val < 0x10000) {
      MFP_LEDS = val;
      val = val << 1;
      delay();
    }
    while (val > 0) {
      val = val >> 1;
      MFP_LEDS = val;
      delay();
    }
    val = 1;
  }
  return 0;
}

void delay() {
  volatile unsigned int j;

  for (j = 0; j < 200000; j++) ;	// delay 
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

