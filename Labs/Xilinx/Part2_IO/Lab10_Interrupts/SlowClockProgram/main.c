/*
 * main.c for MIPSfpga running on the Nexys4 DDR FPGA target board.
 * 
 * The program implements a counter that displays its value to the LEDs
 */

#include "mfp_io.h"

int main() {
  unsigned volatile int cnt = 0;

  while(1) {
	  MFP_LEDS = cnt;
	  if (cnt == 0xFFFF) cnt = 0;
	  else
		  cnt++;
  }
  return 0;
}


void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
