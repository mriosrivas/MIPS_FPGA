/*
 * main.c for MIPSfpga running on the Nexys4 DDR board
 *
 * Lab 08:
 * This program plays a number guessing game with the user. 
 */

#include <stdlib.h>
#include <stdio.h>
#include "fdc.h"
#include "mfp_io.h"

#define MAXNUM 11

void initLCD();
void clearLCD();
void waitTillLCDDone();
void writeValToLCD(unsigned int val);
void writeStringToLCD(char *str);
void delay_ms(unsigned int num);
void writeHexValTo7Segs(unsigned int val);

void printQuestion();
unsigned int getAnswer();
int  getUserPress();
void printCorrect(unsigned int guess);
void printIncorrect(unsigned int guess);

//------------------
// main()
//------------------
int main() {
  volatile unsigned int val;
  volatile unsigned int guess = 99;

  fdc_init();
  fdc_printf("Starting program.\n");

  initLCD();
  
  while (1) {
    val = rand() % MAXNUM;

    writeHexValTo7Segs(val);
    while (val != guess) {
      printQuestion();
      guess = getAnswer();
      fdc_printf("User Answer = %d\n", guess);
      if (guess == val) {
        fdc_printf("Right! Your guess = %d, Correct number = %d\n", guess, val);
        printCorrect(guess);
      }
      else {
        printIncorrect(guess); 
        fdc_printf("Wrong. Your guess = %d, Correct number = %d\n", guess, val);
      }
	}
    writeStringToLCD("Play");
    writeStringToLCD("again!");
    delay_ms(500);
    guess = 99;
  }
  return 0;
}

void printQuestion() {
  // print message until user presses a pushbutton
  writeStringToLCD("Guess a");
  writeStringToLCD("number");
  writeStringToLCD("(0-10)");
  writeStringToLCD("& push");
  writeStringToLCD("a button");

  getUserPress();
}

unsigned int getAnswer() {
  volatile unsigned int answer;

  answer = MFP_SWITCHES;
  return answer;
}

void printCorrect(unsigned int guess) {
  char tmpStr[9];

  sprintf(tmpStr, "Yes! %d", guess);
  writeStringToLCD(tmpStr);
  delay_ms(500);
}

void printIncorrect(unsigned int guess) {
  char tmpStr[9];

  sprintf(tmpStr, "No. %d", guess);
  writeStringToLCD(tmpStr);
  delay_ms(500);
  writeStringToLCD("Try");
  writeStringToLCD("again...");
}

void initLCD() {
  unsigned int initCmds[9] = {0x31, 0x14, 0x55, 0x6d, 0x7c, 0x30, 0x0f,
                              0x06, 0x01};
  unsigned int i;

  fdc_printf("Initializing LCD: %d\n", val);

  for (i=0; i<9; i++) {
    writeValToLCD(initCmds[i]);
    writeHexValTo7Segs(initCmds[i]);
    delay_ms(2);
  }
  fdc_printf("Done initializing LCD: %d\n", val);

}

void clearLCD() {
  writeValToLCD(0x01);
  delay_ms(2);
}

void waitTillLCDDone() {
  volatile unsigned int done;
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

  clearLCD();
  while (str[i] != '\0') {
    val = str[i];
    val = val | 0x100;  // prepend bit indicating that sending data
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
  MFP_7SEGEN = 0xf0;        // enable lower 4 digits of 7-segment displays
  MFP_7SEGDIGITS = val;
}

int getUserPress() {
  volatile int pb;

  do {
    pb = MFP_BUTTONS;
  } while (pb == 0);
  return pb;
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
