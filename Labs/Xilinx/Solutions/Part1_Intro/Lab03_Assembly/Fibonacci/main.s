# 1 "main.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.S"
# 10 "main.S"
# $8 = address of LEDs
# $9 = old
# $10 = cur
# $11 = temp
# $12 = n
.globl main

delay: # loop 50,000,000x
    lui $5, 0x2fa # $5 = 50,000,000
    ori $5, $5, 0xf080
    add $6, $0, $0 # $6 = 0
L1: sub $7, $5, $6 # $7 = 50,000,000 - $6
    addi $6, $6, 1 # increment $6
    bgtz $7, L1 # finished?
    nop # branch delay slot
    jr $ra # return to point of call
    nop # branch delay slot

main:
   lui $8, 0xbf80 # $8 = address of LEDs

init: # initialize variables
   addi $9, $0, 1 # old = 1
   addi $10, $0, 0 # cur = 0
   addi $12, $0, 1 # n = 1

fib:
   slti $13, $12, 12 # n < 12?
   beq $13, $0, init # if not, start at n=1
   addi $12, $12, 1 # n = n + 1
   add $11, $9, $10 # temp = old + cur
   add $9, $10, $0 # old = cur
   add $10, $11, $0 # cur = temp
   sw $10, 0($8) # write fib(n) to LEDs
   jal delay # call delay subroutine
   nop # branch delay slot
   beq $0, $0, fib # repeat
   nop
