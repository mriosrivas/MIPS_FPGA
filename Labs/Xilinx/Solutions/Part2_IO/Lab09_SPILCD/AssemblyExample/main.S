/*
 * main.S for MIPSfpga core running on Nexys4-DDR
 * Used to test LCD functionality in simulation
 *
 * Note: you can also increase clock speed of LCD transmission
 * to decrease simulation time.
 */

# $12 = address of LCD (SPI), $11 = address of done bit 
# $10 = temp value to write to LCD
.globl main
  
main:
   addi  $10, $0, 1      # temp val 
   lui   $12, 0xbf80     # $12 = start address of I/Os
   addiu $11, $12, 0x40  # $11 = address of SPI done bit
   addiu $12, $12, 0x3c  # $12 = address of LCD data (SPI)

test1: 	
   lw    $9,  0($11)     # read done bit
   beq   $9, $0, test1   # if not done, repeat until done
   sw    $10, 0($12)     # write val to LCD 
spin1:
   lw    $9,  0($11)     # read done bit
   beq   $9, $0, spin1   # if not done, repeat until done
   ori   $13, $10, 0x100 # prepend rs bit
   sw    $13, 0($12)     # write val with set rs bit to LCD 
   addi  $10, $10, 1     # increment temp val
   beq   $0, $0, test1   # repeat

