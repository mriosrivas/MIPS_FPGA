/*
 * main.c for MIPSfpga running on the Nexys4 DDR board.
 *
 * This code writes a string to the LCD repeatedly.
 */

#include <stdlib.h>
#include "fdc.h"
#include "mfp_io.h"

void initLCD();
void clearLCD();
void waitTillLCDDone();
void writeValToLCD(unsigned int val);
void writeStringToLCD(char *str);
void delay_ms(unsigned int num);
void writeHexValTo7Segs(unsigned int val);

//------------------
// main()
//------------------
int main() {

  fdc_init();
  fdc_printf("Starting program.\n");

  initLCD();
  
  while (1) {
    writeStringToLCD("Hello!");
    writeStringToLCD("MIPSfpga");
    writeStringToLCD("is fun!");
  }
  return 0;
}

void initLCD() {
  unsigned int initCmds[9] = {0x31, 0x14, 0x55, 0x6d, 0x7c, 0x30, 0x0f,
                              0x06, 0x01};
  unsigned int i;
  for (i=0; i<9; i++) {
    writeValToLCD(initCmds[i]);
    writeHexValTo7Segs(initCmds[i]);
    delay_ms(2);
  }
}

void clearLCD() {
  writeValToLCD(0x01);
  delay_ms(2);
}

void waitTillLCDDone() {
  unsigned int done;
  
  do {
    done = MFP_SPI_DONE;
  } while (!done);
}

void writeValToLCD(unsigned int val) {    
  MFP_SPI_DATA = val; 
  waitTillLCDDone();
}

void writeStringToLCD(char *str) {
  volatile unsigned int i=0;
  volatile unsigned int val;

  fdc_printf("Writing the following string to the LCD: %s.\n", str);

  clearLCD();
  while (str[i] != '\0') {
    val = str[i];
    val = val | 0x100;     // prepend bit indicating that sending data
    writeHexValTo7Segs(val); 
    writeValToLCD(val);
    i++;
  }
  delay_ms(500);
}

                    
void delay_ms(unsigned int num) {
  volatile unsigned int start_ms=0, curr_ms=0, diff = 0;

  start_ms = MFP_MILLIS;
  while ( diff < num) {
    curr_ms = MFP_MILLIS;
    diff = curr_ms - start_ms;
  }
}

void writeHexValTo7Segs(unsigned int val) {
  volatile unsigned int alldigits = 0;

  MFP_7SEGEN = 0xF0;    // enable lower 4 7-segment displays
  MFP_7SEGDIGITS = val; // write hex digits to 7-segment displays
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;    // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
