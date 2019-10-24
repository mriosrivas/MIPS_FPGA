	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame

	.comm	x,4096,4

	.comm	y,4096,4

	.comm	z,4096,4
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 49 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,56,$31		# vars= 32, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-56
	.cfi_def_cfa_offset 56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	.cfi_offset 31, -4
	.cfi_offset 30, -8
	move	$fp,$sp
	.cfi_def_cfa_register 30
	.loc 1 55 0
	sw	$0,16($fp)
	b	.L2
.L5:
	.loc 1 56 0
	sw	$0,20($fp)
	b	.L3
.L4:
	.loc 1 57 0 discriminator 3
	lui	$2,%hi(x)
	lw	$3,16($fp)
	sll	$4,$3,5
	lw	$3,20($fp)
	addu	$3,$4,$3
	sll	$3,$3,2
	addiu	$2,$2,%lo(x)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sw	$3,0($2)
	.loc 1 58 0 discriminator 3
	lui	$2,%hi(y)
	lw	$3,16($fp)
	sll	$4,$3,5
	lw	$3,20($fp)
	addu	$3,$4,$3
	sll	$3,$3,2
	addiu	$2,$2,%lo(y)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sw	$3,0($2)
	.loc 1 59 0 discriminator 3
	lui	$2,%hi(z)
	lw	$3,16($fp)
	sll	$4,$3,5
	lw	$3,20($fp)
	addu	$3,$4,$3
	sll	$3,$3,2
	addiu	$2,$2,%lo(z)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	sw	$3,0($2)
	.loc 1 56 0 discriminator 3
	lw	$2,20($fp)
	addiu	$2,$2,1
	sw	$2,20($fp)
.L3:
	.loc 1 56 0 is_stmt 0 discriminator 1
	lw	$2,20($fp)
	slt	$2,$2,32
	bne	$2,$0,.L4
	.loc 1 55 0 is_stmt 1 discriminator 2
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L2:
	.loc 1 55 0 is_stmt 0 discriminator 1
	lw	$2,16($fp)
	slt	$2,$2,32
	bne	$2,$0,.L5
	.loc 1 65 0 is_stmt 1
 #APP
 # 65 "main.c" 1
	   li $t1, 4096;   li $t2, 0;   lui $t3, 0x0;loop1:   cache 0x01, 0($t3);   addiu $t3, $t3, 16;   addiu $t2, $t2, 1;   blt $t2, $t1, loop1;
 # 0 "" 2
 #NO_APP
.LBB2 = .
	.loc 1 79 0
	li	$2,322			# 0x142
 #APP
 # 79 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,354			# 0x162
 #APP
 # 79 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 79 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 79 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 81 0
	sw	$0,32($fp)
	b	.L6
.L15:
	.loc 1 82 0
	sw	$0,36($fp)
	b	.L7
.L14:
	.loc 1 83 0
	sw	$0,16($fp)
	b	.L8
.L13:
	.loc 1 84 0
	lw	$2,32($fp)
	sw	$2,20($fp)
	b	.L9
.L12:
	.loc 1 85 0
	sw	$0,28($fp)
	.loc 1 86 0
	lw	$2,36($fp)
	sw	$2,24($fp)
	b	.L10
.L11:
	.loc 1 87 0 discriminator 3
	lui	$2,%hi(y)
	lw	$3,16($fp)
	sll	$4,$3,5
	lw	$3,24($fp)
	addu	$3,$4,$3
	sll	$3,$3,2
	addiu	$2,$2,%lo(y)
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(z)
	lw	$4,24($fp)
	sll	$5,$4,5
	lw	$4,20($fp)
	addu	$4,$5,$4
	sll	$4,$4,2
	addiu	$2,$2,%lo(z)
	addu	$2,$4,$2
	lw	$2,0($2)
	mult	$3,$2
	lw	$2,28($fp)
	mflo	$3
	addu	$2,$2,$3
	sw	$2,28($fp)
	.loc 1 86 0 discriminator 3
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
.L10:
	.loc 1 86 0 is_stmt 0 discriminator 1
	lw	$2,36($fp)
	addiu	$2,$2,16
	li	$3,32			# 0x20
	slt	$4,$2,33
	movn	$3,$2,$4
	lw	$2,24($fp)
	slt	$2,$2,$3
	bne	$2,$0,.L11
	.loc 1 89 0 is_stmt 1 discriminator 2
	lui	$2,%hi(x)
	lw	$3,16($fp)
	sll	$4,$3,5
	lw	$3,20($fp)
	addu	$3,$4,$3
	sll	$3,$3,2
	addiu	$2,$2,%lo(x)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,28($fp)
	addu	$3,$3,$2
	lui	$2,%hi(x)
	lw	$4,16($fp)
	sll	$5,$4,5
	lw	$4,20($fp)
	addu	$4,$5,$4
	sll	$4,$4,2
	addiu	$2,$2,%lo(x)
	addu	$2,$4,$2
	sw	$3,0($2)
	.loc 1 84 0 discriminator 2
	lw	$2,20($fp)
	addiu	$2,$2,1
	sw	$2,20($fp)
.L9:
	.loc 1 84 0 is_stmt 0 discriminator 1
	lw	$2,32($fp)
	addiu	$2,$2,16
	li	$3,32			# 0x20
	slt	$4,$2,33
	movn	$3,$2,$4
	lw	$2,20($fp)
	slt	$2,$2,$3
	bne	$2,$0,.L12
	.loc 1 83 0 is_stmt 1 discriminator 2
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L8:
	.loc 1 83 0 is_stmt 0 discriminator 1
	lw	$2,16($fp)
	slt	$2,$2,32
	bne	$2,$0,.L13
	.loc 1 82 0 is_stmt 1 discriminator 2
	lw	$2,36($fp)
	addiu	$2,$2,16
	sw	$2,36($fp)
.L7:
	.loc 1 82 0 is_stmt 0 discriminator 1
	lw	$2,36($fp)
	slt	$2,$2,32
	bne	$2,$0,.L14
	.loc 1 81 0 is_stmt 1 discriminator 2
	lw	$2,32($fp)
	addiu	$2,$2,16
	sw	$2,32($fp)
.L6:
	.loc 1 81 0 is_stmt 0 discriminator 1
	lw	$2,32($fp)
	slt	$2,$2,32
	bne	$2,$0,.L15
.LBB3 = .
.LBB4 = .
	.loc 1 96 0 is_stmt 1
 #APP
 # 96 "main.c" 1
	mfc0 $2,$25,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE4 = .
	sw	$2,40($fp)
.LBB5 = .
 #APP
 # 96 "main.c" 1
	mfc0 $2,$25,3
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE5 = .
	sw	$2,44($fp)
 #APP
 # 96 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 96 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 96 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 96 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.L29:
.LBE3 = .
	.loc 1 102 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x4
	lw	$2,0($2)
	sltu	$3,$2,6
	beq	$3,$0,.L16
	sll	$3,$2,2
	lui	$2,%hi(.L18)
	addiu	$2,$2,%lo(.L18)
	addu	$2,$3,$2
	lw	$2,0($2)
	jr	$2
	.rdata
	.align	2
	.align	2
.L18:
	.word	.L17
	.word	.L19
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.text
.L17:
	.loc 1 104 0
	lw	$2,40($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 105 0
	b	.L24
.L19:
	.loc 1 107 0
	lw	$2,44($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 108 0
	b	.L24
.L20:
.LBB6 = .
	.loc 1 111 0
 #APP
 # 111 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE6 = .
	andi	$2,$2,0x380
	srl	$2,$2,7
	addiu	$2,$2,1
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 112 0
	b	.L24
.L21:
.LBB7 = .
	.loc 1 115 0
 #APP
 # 115 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE7 = .
	andi	$2,$2,0xe000
	srl	$3,$2,13
	li	$2,7			# 0x7
	beq	$3,$2,.L25
.LBB8 = .
	.loc 1 115 0 is_stmt 0 discriminator 1
 #APP
 # 115 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE8 = .
	andi	$2,$2,0xe000
	srl	$2,$2,13
	addiu	$2,$2,6
	move	$3,$2
	li	$2,1			# 0x1
	sll	$2,$2,$3
	b	.L26
.L25:
	.loc 1 115 0 discriminator 2
	li	$2,32			# 0x20
.L26:
	.loc 1 115 0 discriminator 4
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 116 0 is_stmt 1 discriminator 4
	b	.L24
.L22:
.LBB9 = .
	.loc 1 119 0
 #APP
 # 119 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE9 = .
	andi	$2,$2,0x1c00
	srl	$2,$2,10
	beq	$2,$0,.L27
.LBB10 = .
	.loc 1 119 0 is_stmt 0 discriminator 1
 #APP
 # 119 "main.c" 1
	mfc0 $2,$16,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE10 = .
	andi	$2,$2,0x1c00
	srl	$2,$2,10
	addiu	$2,$2,1
	move	$3,$2
	li	$2,1			# 0x1
	sll	$2,$2,$3
	b	.L28
.L27:
	.loc 1 119 0 discriminator 2
	move	$2,$0
.L28:
	.loc 1 119 0 discriminator 4
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 120 0 is_stmt 1 discriminator 4
	b	.L24
.L23:
.LBB11 = .
	.loc 1 123 0
 #APP
 # 123 "main.c" 1
	mfc0 $2,$16,0
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE11 = .
	andi	$2,$2,0x7
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 124 0
	b	.L24
.L16:
	.loc 1 126 0
	move	$4,$0
	jal	writeValTo7Segs
.L24:
	.loc 1 128 0
	b	.L29
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.loc 1 135 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7Segs
	.type	writeValTo7Segs, @function
writeValTo7Segs:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$fp,20($sp)
	.cfi_offset 30, -4
	move	$fp,$sp
	.cfi_def_cfa_register 30
	sw	$4,24($fp)
	.loc 1 137 0
	sw	$0,4($fp)
	.loc 1 138 0
	sw	$0,8($fp)
	.loc 1 141 0
	sw	$0,4($fp)
	b	.L31
	nop

.L33:
	.loc 1 142 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sll	$2,$2,1
	sll	$4,$2,2
	addu	$2,$2,$4
	subu	$2,$3,$2
	sw	$2,0($fp)
	.loc 1 143 0 discriminator 4
	lw	$3,0($fp)
	lw	$2,4($fp)
	sll	$2,$2,2
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,8($fp)
	.loc 1 144 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sw	$2,24($fp)
	.loc 1 145 0 discriminator 4
	lw	$2,4($fp)
	li	$3,1			# 0x1
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,12($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	.loc 1 141 0 discriminator 4
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
.L31:
	.loc 1 141 0 is_stmt 0 discriminator 1
	lw	$2,24($fp)
	beq	$2,$0,.L32
	nop

	.loc 1 141 0 discriminator 3
	lw	$2,4($fp)
	slt	$2,$2,8
	bne	$2,$0,.L33
	nop

.L32:
	.loc 1 148 0 is_stmt 1
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,8($fp)
	sw	$3,0($2)
	.loc 1 149 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	lw	$3,12($fp)
	nor	$3,$0,$3
	sw	$3,0($2)
	.loc 1 151 0
	nop
	.loc 1 152 0
	move	$sp,$fp
	.cfi_def_cfa_register 29
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE1:
	.size	writeValTo7Segs, .-writeValTo7Segs
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 156 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
	sw	$fp,4($sp)
	.cfi_offset 30, -4
	move	$fp,$sp
	.cfi_def_cfa_register 30
	sw	$4,8($fp)
	sw	$5,12($fp)
	.loc 1 157 0
	li	$2,-1082130432			# 0xffffffffbf800000
	li	$3,32769			# 0x8001
	sw	$3,0($2)
.L36:
	.loc 1 158 0 discriminator 1
	b	.L36
	nop

	.set	macro
	.set	reorder
	.end	_mips_handle_exception
	.cfi_endproc
.LFE2:
	.size	_mips_handle_exception, .-_mips_handle_exception
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x29e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x1
	.4byte	.LASF17
	.4byte	.LASF18
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.2byte	0x393
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x8
	.byte	0x1
	.byte	0x1c
	.4byte	0x6e
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1e
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x21
	.4byte	0x4d
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x31
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bf
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.ascii	"j\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.ascii	"k\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.ascii	"r\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.ascii	"jj\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"kk\000"
	.byte	0x1
	.byte	0x33
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.byte	0x34
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x105
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x120
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x13b
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x6f
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x156
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x171
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x18c
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xb
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0x1a7
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xc
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x9
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0x87
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x219
	.uleb128 0xe
	.ascii	"val\000"
	.byte	0x1
	.byte	0x87
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0x89
	.4byte	0x219
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x89
	.4byte	0x219
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x1
	.byte	0x8a
	.4byte	0x21e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8a
	.4byte	0x21e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	0x46
	.uleb128 0xf
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x255
	.uleb128 0xe
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x255
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x9c
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.uleb128 0x12
	.4byte	0x46
	.4byte	0x26d
	.uleb128 0x13
	.4byte	0x26d
	.byte	0x1f
	.uleb128 0x13
	.4byte	0x26d
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x14
	.ascii	"x\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	x
	.uleb128 0x14
	.ascii	"y\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	y
	.uleb128 0x14
	.ascii	"z\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	z
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.ascii	"digit\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF16:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g\000"
.LASF5:
	.ascii	"reg32_t\000"
.LASF17:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"test_result_t\000"
.LASF3:
	.ascii	"event1\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF18:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_Blocking\000"
.LASF12:
	.ascii	"enDigits\000"
.LASF8:
	.ascii	"main\000"
.LASF11:
	.ascii	"allDigits\000"
.LASF13:
	.ascii	"_mips_handle_exception\000"
.LASF14:
	.ascii	"reason\000"
.LASF9:
	.ascii	"writeValTo7Segs\000"
.LASF7:
	.ascii	"test_result\000"
.LASF4:
	.ascii	"event2\000"
.LASF15:
	.ascii	"sizetype\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
