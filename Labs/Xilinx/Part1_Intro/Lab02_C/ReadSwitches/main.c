/*
 * main.c for the MIPSfpga core running on Nexys4 DDR board.
 *
 * This program:
 *   (1) reads the switches on the Nexys4 DDR board and 
 *   (2) flashes the value of the switches on the LEDs
 */
#include "mfp_io.h"

void delay();

//------------------
// main()
//------------------
int main() {
  volatile unsigned int switches;

  while (1) {
    switches = MFP_SWITCHES;
    MFP_LEDS = switches;	  
    delay();
    MFP_LEDS = 0;  // turn off LEDs
    delay();
  }
  return 0;
}

void delay() {
  volatile unsigned int j;

  for (j = 0; j < (1000000); j++) ;	// delay 
}


