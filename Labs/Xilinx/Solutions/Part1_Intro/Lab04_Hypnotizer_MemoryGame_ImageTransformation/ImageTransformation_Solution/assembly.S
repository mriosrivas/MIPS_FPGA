.globl rgb2grayAssembly


.text

rgb2grayAssembly:

		addi $sp,$sp,-8
		sw $s0,4($sp)
		sw $ra,0($sp)

		lbu $t0,0($a0)
		addi $t1, $0, 3483
		mul $s0,$t1,$t0

		lbu $t0,1($a0)
		addi $t1, $0, 11718
		mul $t3,$t1,$t0
		add $s0,$s0,$t3

		lbu $t0,2($a0)
		addi $t1, $0, 1183
		mul $t3,$t1,$t0
		add $s0,$s0,$t3

		add $a0,$s0,$0

		jal div16K

		lw $ra,0($sp)
		lw $s0,4($sp)
		addi $sp,$sp,8

		jr $ra



div16K:

		srl $v0,$a0,14

		jr $ra