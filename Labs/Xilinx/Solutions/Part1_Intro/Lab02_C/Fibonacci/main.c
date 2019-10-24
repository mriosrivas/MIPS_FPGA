/*
 * main.c for the MIPSfpga core running on the Nexys4 DDR 
 * FPGA target boards
 *
 * Lab 2:
 * This program repeatedly calculates the Fibonacci numbers from 1-11 and
 * displays them on the Nexys4-DDR LEDs in binary.
 */

#include "mfp_io.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile int old, cur, temp, n; 

  while (1) {   // repeatedly execute calculation of Fibonacci numbers 1-11
    old = 1; cur = 0; n = 1;
    while (n < 12) {
      n = n + 1;
      temp = old + cur;
      old = cur;
      cur = temp;
      MFP_LEDS = cur; // write fib(n) to LEDs 
      delay();
    }
  }
  return 0;
}

void delay() {
  volatile unsigned int j;

  for (j = 0; j < (10000000); j++) ;	// delay 
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

