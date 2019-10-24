/*
 * main.c for the MIPSfpga system running on Nexys4 DDR 
 * FPGA target board.
 *
 * Lab 5: SwTo7segHex 
 * This program displays the value of the switches in hexadecimal on the 
 * 7-segment displays.
 */


#include "mfp_io.h"
#include "fdc.h"

#define NUMHEXDIGITS 4   // 16 switches corresponds to 4 hex digits

//------------------
// main()
//------------------
int main() {
  fdc_init();
  fdc_printf("Starting program.");
  
  MFP_7SEGEN = 0xf0;        // enable lower 4 digits of 7-segment displays
  while (1) {               // send value of switches to lower 4 digits of 7-segment displays
    MFP_7SEGDIGITS = MFP_SWITCHES;
    fdc_printf("Value of digits: 0x%x\n", MFP_SWITCHES);
  }
  return 0;
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}

