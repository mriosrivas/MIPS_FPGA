/*
 * Exercising DES Engine.
 */

#include "fdc.h"
#include "mfp_io.h"

#define ARRAYSIZE 500

void initarray(int* arr, int mult, int size);
void displayarray(int* arr, int size);
void dma(unsigned int src, unsigned int dst, int size);
void flushCache();

int main() {
  int j;
  int src[ARRAYSIZE];
  int dst[ARRAYSIZE];
  
  fdc_init();
  fdc_printf("Starting program.\n");

  while (1) {
    for (j=1; j<10; j++) {
	  initarray(src, j, ARRAYSIZE);
	  fdc_printf("Values of SOURCE array before DMA:\n");	  
      displayarray(src, ARRAYSIZE);
	  fdc_printf("Values of DESTINATION array before DMA:\n");	  
      displayarray(dst, ARRAYSIZE);
      flushCache(); // flush the cache before DMA
	  dma((unsigned int)src, (unsigned int)dst, ARRAYSIZE*4);

	  fdc_printf("Values of DESTINATION array AFTER DMA (multiplication factor = %d):\n", j);
      displayarray(dst, ARRAYSIZE);	  
	}
  }
  return 0;
}

void initarray(int* arr, int mult, int size) {
	int i;

	for (i=0; i<size; i++)
      arr[i] = i*mult;
}

// display array data
void displayarray(int* arr, int size) {
	int i;

    fdc_printf("Displaying array at address: 0x%x, size = %d\n", arr, size);	  
	
    for (i=0; i<size; i++) {
      fdc_printf("arr[%d] = %d\t", i, arr[i]);
      while (MFP_BUTTONS)    // pause if any buttons pushed
        ;
	}
    fdc_printf("\n");
}

void dma(unsigned int src, unsigned int dst, int size) {
  MFP_DMASRC = src;
  MFP_DMADST = dst;
  MFP_DMASIZE = size;
  MFP_DMASTART = 1;
}

void flushCache() {
	// Flush the data cache with the CACHE instruction, block by block.
	asm volatile
    ( 
        // $t1 should be set to (TOTAL_CACHE_SIZE_IN_BYTES)/16.
        "   li $t1, 256;"       
        "   li $t2, 0;"
        "   lui $t3, 0x0;"
        "loop1:"
        "   cache 0x01, 0($t3);"    
        "   addiu $t3, $t3, 16;"
        "   addiu $t2, $t2, 1;"
        "   blt $t2, $t1, loop1;"
    );
}

void _mips_handle_exception(void* ctx, int reason) {
  MFP_LEDS = 0x8001;  // Display 0x8001 on LEDs to indicate error state
  while (1) ;
}
