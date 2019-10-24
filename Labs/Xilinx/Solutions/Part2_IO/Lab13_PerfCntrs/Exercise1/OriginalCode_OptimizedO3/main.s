	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 38 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,48,$31		# vars= 48, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
.LBB12 = .
	.loc 1 43 0
	li	$2,2			# 0x2
	.loc 1 43 0
 #APP
 # 43 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 43 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 43 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 43 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE12 = .
	.loc 1 45 0
 #APP
 # 45 "main.c" 1
	   add $s0, $0, $0;   add $s1, $0, $0;   addi $t0, $0, 1000;   loop:   slt $t1, $s0, $t0;   beq $t1, $0, done;   add $s1, $s1, $s0;   addi $s0, $s0, 1;   j loop;   done:
 # 0 "" 2
 #NO_APP
.LBB13 = .
.LBB14 = .
	.loc 1 60 0
 #APP
 # 60 "main.c" 1
	mfc0 $9,$25,1
 # 0 "" 2
.LVL0 = .
 #NO_APP
.LBE14 = .
.LBB15 = .
 #APP
 # 60 "main.c" 1
	mfc0 $8,$25,3
 # 0 "" 2
.LVL1 = .
 #NO_APP
.LBE15 = .
 #APP
 # 60 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 60 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 60 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 60 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE13 = .
.LBB16 = .
.LBB17 = .
	.loc 1 90 0
	li	$6,-859045888			# 0xffffffffcccc0000
.LBE17 = .
.LBE16 = .
	.loc 1 66 0
	li	$7,-1082130432			# 0xffffffffbf800000
.LBB21 = .
.LBB18 = .
	.loc 1 90 0
	ori	$6,$6,0xcccd
	.loc 1 93 0
	li	$5,1			# 0x1
.L2:
.LBE18 = .
.LBE21 = .
	.loc 1 66 0
	lw	$2,4($7)
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L4
	addiu	$3,$7,4
	.set	macro
	.set	reorder

.L27:
	bne	$2,$5,.L25
.LVL2 = .
.LBB22 = .
.LBB23 = .
	.loc 1 85 0
	sw	$0,20($sp)
	.loc 1 86 0
	sw	$0,16($sp)
	.loc 1 89 0
	sw	$0,20($sp)
	beq	$8,$0,.L11
	lw	$2,20($sp)
	slt	$2,$2,8
	beq	$2,$0,.L11
.LBE23 = .
.LBE22 = .
	.set	noreorder
	.set	nomacro
	b	.L12
	move	$4,$8
	.set	macro
	.set	reorder

.LVL3 = .
.L26:
.LBB26 = .
.LBB24 = .
	lw	$2,20($sp)
	slt	$2,$2,8
	beq	$2,$0,.L11
.L12:
	.loc 1 90 0
	multu	$4,$6
	mfhi	$10
	srl	$2,$10,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,24($sp)
	.loc 1 91 0
	lw	$3,24($sp)
	lw	$2,20($sp)
	lw	$11,16($sp)
	.loc 1 92 0
	srl	$4,$10,3
.LVL4 = .
	.loc 1 91 0
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$11
	sw	$2,16($sp)
	.loc 1 93 0
	lw	$2,20($sp)
	lw	$3,12($sp)
	sll	$2,$5,$2
	or	$2,$2,$3
	sw	$2,12($sp)
	.loc 1 89 0
	lw	$2,20($sp)
	addiu	$2,$2,1
	sw	$2,20($sp)
	bne	$4,$0,.L26
.LVL5 = .
.L11:
	.loc 1 96 0
	lw	$2,16($sp)
.LBE24 = .
.LBE26 = .
	.loc 1 66 0
	addiu	$3,$7,4
.LBB27 = .
.LBB25 = .
	.loc 1 96 0
	sw	$2,16($7)
	.loc 1 97 0
	lw	$2,12($sp)
	nor	$2,$0,$2
	sw	$2,12($7)
.LBE25 = .
.LBE27 = .
	.loc 1 66 0
	lw	$2,4($7)
	bne	$2,$0,.L27
.L4:
.LVL6 = .
.LBB28 = .
.LBB19 = .
	.loc 1 85 0
	sw	$0,36($sp)
	.loc 1 86 0
	sw	$0,32($sp)
	.loc 1 89 0
	sw	$0,36($sp)
	beq	$9,$0,.L8
	lw	$2,36($sp)
	slt	$2,$2,8
	beq	$2,$0,.L8
.LBE19 = .
.LBE28 = .
	.set	noreorder
	.set	nomacro
	b	.L9
	move	$4,$9
	.set	macro
	.set	reorder

.LVL7 = .
.L28:
.LBB29 = .
.LBB20 = .
	lw	$2,36($sp)
	slt	$2,$2,8
	beq	$2,$0,.L8
.L9:
	.loc 1 90 0
	multu	$4,$6
	mfhi	$10
	srl	$2,$10,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,40($sp)
	.loc 1 91 0
	lw	$3,40($sp)
	lw	$2,36($sp)
	lw	$11,32($sp)
	.loc 1 92 0
	srl	$4,$10,3
.LVL8 = .
	.loc 1 91 0
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$11
	sw	$2,32($sp)
	.loc 1 93 0
	lw	$2,36($sp)
	lw	$3,28($sp)
	sll	$2,$5,$2
	or	$2,$2,$3
	sw	$2,28($sp)
	.loc 1 89 0
	lw	$2,36($sp)
	addiu	$2,$2,1
	sw	$2,36($sp)
	bne	$4,$0,.L28
.LVL9 = .
.L8:
	.loc 1 96 0
	lw	$2,32($sp)
	sw	$2,16($7)
	.loc 1 97 0
	lw	$2,28($sp)
	nor	$2,$0,$2
	sw	$2,12($7)
	b	.L2
.L25:
.LVL10 = .
.LBE20 = .
.LBE29 = .
.LBB30 = .
.LBB31 = .
	.loc 1 85 0
	sw	$0,8($sp)
	.loc 1 86 0
	sw	$0,4($sp)
	.loc 1 89 0
	sw	$0,8($sp)
	.loc 1 96 0
	lw	$2,4($sp)
	sw	$2,12($3)
	.loc 1 97 0
	lw	$2,0($sp)
	nor	$2,$0,$2
	sw	$2,8($3)
	b	.L2
.LBE31 = .
.LBE30 = .
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.loc 1 83 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7Segs
	.type	writeValTo7Segs, @function
writeValTo7Segs:
	.frame	$sp,16,$31		# vars= 16, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL11 = .
	addiu	$sp,$sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 85 0
	sw	$0,8($sp)
	.loc 1 86 0
	sw	$0,4($sp)
	.loc 1 89 0
	sw	$0,8($sp)
	beq	$4,$0,.L31
	nop

	lw	$2,8($sp)
	slt	$2,$2,8
	beq	$2,$0,.L31
	nop

	.loc 1 90 0 discriminator 4
	li	$7,-859045888			# 0xffffffffcccc0000
	ori	$7,$7,0xcccd
	.loc 1 93 0 discriminator 4
	b	.L32
	li	$8,1			# 0x1

.L39:
	.loc 1 89 0 discriminator 3
	lw	$2,8($sp)
	slt	$2,$2,8
	beq	$2,$0,.L31
	nop

.L32:
	.loc 1 90 0 discriminator 4
	multu	$4,$7
	mfhi	$5
	srl	$2,$5,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,12($sp)
	.loc 1 91 0 discriminator 4
	lw	$3,12($sp)
	lw	$2,8($sp)
	lw	$6,4($sp)
	.loc 1 92 0 discriminator 4
	srl	$4,$5,3
.LVL12 = .
	.loc 1 91 0 discriminator 4
	sll	$2,$2,2
	sll	$2,$3,$2
	or	$2,$2,$6
	sw	$2,4($sp)
	.loc 1 93 0 discriminator 4
	lw	$2,8($sp)
	lw	$3,0($sp)
	sll	$2,$8,$2
	or	$2,$2,$3
	sw	$2,0($sp)
	.loc 1 89 0 discriminator 4
	lw	$2,8($sp)
	addiu	$2,$2,1
	sw	$2,8($sp)
	bne	$4,$0,.L39
	nop

.L31:
	.loc 1 96 0
	lw	$2,4($sp)
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 97 0
	lw	$2,0($sp)
	nor	$2,$0,$2
	sw	$2,12($3)
	.loc 1 100 0
	jr	$31
	addiu	$sp,$sp,16

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	writeValTo7Segs
	.cfi_endproc
.LFE1:
	.size	writeValTo7Segs, .-writeValTo7Segs
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 104 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL13 = .
	.loc 1 105 0
	li	$3,32769			# 0x8001
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$3,0($2)
.L41:
	.loc 1 106 0 discriminator 1
	b	.L41
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
	.4byte	0x253
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x1
	.4byte	.LASF15
	.4byte	.LASF16
	.4byte	.Ldebug_ranges0+0x48
	.4byte	0
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
	.4byte	.LASF17
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.4byte	0xbb
	.uleb128 0x9
	.ascii	"val\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x2c
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.byte	0x55
	.4byte	0xbb
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0x55
	.4byte	0xbb
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x56
	.4byte	0xc0
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x1
	.byte	0x56
	.4byte	0xc0
	.byte	0
	.uleb128 0xc
	.4byte	0x46
	.uleb128 0xc
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x1
	.byte	0x26
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e7
	.uleb128 0xe
	.4byte	.LASF10
	.byte	0x1
	.byte	0x28
	.4byte	0x6e
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.4byte	0x108
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x25
	.uleb128 0x1
	.byte	0x59
	.byte	0
	.uleb128 0xf
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.4byte	0x123
	.uleb128 0x10
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x25
	.uleb128 0x1
	.byte	0x58
	.byte	0
	.uleb128 0x11
	.4byte	0x79
	.4byte	.LBB16
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x44
	.4byte	0x166
	.uleb128 0x12
	.4byte	0x85
	.4byte	.LLST1
	.uleb128 0x13
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x14
	.4byte	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x14
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0x79
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x28
	.byte	0x1
	.byte	0x47
	.4byte	0x1a9
	.uleb128 0x12
	.4byte	0x85
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	.Ldebug_ranges0+0x28
	.uleb128 0x14
	.4byte	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	0x79
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.byte	0x1
	.byte	0x4a
	.uleb128 0x16
	.4byte	0x85
	.byte	0
	.uleb128 0x17
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.uleb128 0x18
	.4byte	0x90
	.uleb128 0x14
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	0x79
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x224
	.uleb128 0x12
	.4byte	0x85
	.4byte	.LLST3
	.uleb128 0x14
	.4byte	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x14
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x14
	.4byte	0xa4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF12
	.byte	0x1
	.byte	0x68
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x254
	.uleb128 0x1b
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x68
	.4byte	0x254
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1c
	.4byte	.LASF13
	.byte	0x1
	.byte	0x68
	.4byte	0x46
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x1d
	.byte	0x4
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x5
	.byte	0x59
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL1
	.4byte	.LFE0
	.2byte	0x6
	.byte	0x59
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL12
	.4byte	.LFE1
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	0
	.4byte	0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"event2\000"
.LASF15:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"test_result_t\000"
.LASF3:
	.ascii	"event1\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"reg32_t\000"
.LASF9:
	.ascii	"enDigits\000"
.LASF11:
	.ascii	"main\000"
.LASF14:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O3\000"
.LASF8:
	.ascii	"allDigits\000"
.LASF12:
	.ascii	"_mips_handle_exception\000"
.LASF13:
	.ascii	"reason\000"
.LASF17:
	.ascii	"writeValTo7Segs\000"
.LASF7:
	.ascii	"digit\000"
.LASF10:
	.ascii	"test_result\000"
.LASF16:
	.ascii	"C:\\Users\\Dani\\Desktop\\OriginalCode\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
