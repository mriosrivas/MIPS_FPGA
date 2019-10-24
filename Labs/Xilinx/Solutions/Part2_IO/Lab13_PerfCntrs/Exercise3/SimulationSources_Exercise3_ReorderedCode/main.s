	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame

	.comm	test_array,1200,4
	.rdata
	.align	2
.LC0:
	.ascii	"Result[0]=%d, Result[50]=%d, Result[99]=%d\012\000"
	.text
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 39 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-40
	.cfi_def_cfa_offset 40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	.cfi_offset 31, -4
	.cfi_offset 30, -8
	move	$fp,$sp
	.cfi_def_cfa_register 30
	.loc 1 44 0
	sw	$0,16($fp)
	b	.L2
.L3:
	.loc 1 44 0 is_stmt 0 discriminator 3
	lui	$2,%hi(test_array)
	lw	$3,16($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(test_array)
	addu	$2,$3,$2
	lw	$3,16($fp)
	sw	$3,0($2)
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L2:
	.loc 1 44 0 discriminator 1
	lw	$2,16($fp)
	slt	$2,$2,300
	bne	$2,$0,.L3
.LBB2 = .
	.loc 1 47 0 is_stmt 1
	li	$2,2			# 0x2
 #APP
 # 47 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 47 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 47 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 47 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 49 0
 #APP
 # 49 "main.c" 1
	   .set noreorder;   lui     $t6, 0x8000;   addiu   $t6, $t6, test_array;   addi    $t1,$0,100;LOOP:  LW      $t2,0($t6);       LW      $t3,400($t6);       ADDI    $t1,$t1,-1;       SUB     $t2,$t3,$t2;       SW      $t2,800($t6);       BNE     $t1,$0,LOOP;       ADDI    $t6,$t6,4;   addi    $t1,$t1,100;   .set reorder;
 # 0 "" 2
 #NO_APP
.LBB3 = .
.LBB4 = .
	.loc 1 67 0
 #APP
 # 67 "main.c" 1
	mfc0 $2,$25,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE4 = .
	sw	$2,20($fp)
.LBB5 = .
 #APP
 # 67 "main.c" 1
	mfc0 $2,$25,3
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE5 = .
	sw	$2,24($fp)
 #APP
 # 67 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 67 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 67 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 67 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE3 = .
	.loc 1 69 0
	jal	fdc_init
	.loc 1 70 0
	lui	$2,%hi(test_array)
	addiu	$2,$2,%lo(test_array)
	lw	$5,800($2)
	lui	$2,%hi(test_array)
	addiu	$2,$2,%lo(test_array)
	lw	$6,1000($2)
	lui	$2,%hi(test_array)
	addiu	$2,$2,%lo(test_array)
	lw	$3,1196($2)
	lui	$2,%hi(.LC0)
	addiu	$4,$2,%lo(.LC0)
	move	$7,$3
	jal	fdc_printf
.L8:
	.loc 1 75 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x4
	lw	$2,0($2)
	beq	$2,$0,.L5
	li	$3,1			# 0x1
	beq	$2,$3,.L6
	b	.L9
.L5:
	.loc 1 77 0
	lw	$2,20($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 78 0
	b	.L7
.L6:
	.loc 1 80 0
	lw	$2,24($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 81 0
	b	.L7
.L9:
	.loc 1 83 0
	move	$4,$0
	jal	writeValTo7Segs
.L7:
	.loc 1 85 0
	b	.L8
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.loc 1 92 0
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
	.loc 1 94 0
	sw	$0,4($fp)
	.loc 1 95 0
	sw	$0,8($fp)
	.loc 1 98 0
	sw	$0,4($fp)
	b	.L11
	nop

.L13:
	.loc 1 99 0 discriminator 4
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
	.loc 1 100 0 discriminator 4
	lw	$3,0($fp)
	lw	$2,4($fp)
	sll	$2,$2,2
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,8($fp)
	.loc 1 101 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sw	$2,24($fp)
	.loc 1 102 0 discriminator 4
	lw	$2,4($fp)
	li	$3,1			# 0x1
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,12($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	.loc 1 98 0 discriminator 4
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
.L11:
	.loc 1 98 0 is_stmt 0 discriminator 1
	lw	$2,24($fp)
	beq	$2,$0,.L12
	nop

	.loc 1 98 0 discriminator 3
	lw	$2,4($fp)
	slt	$2,$2,8
	bne	$2,$0,.L13
	nop

.L12:
	.loc 1 105 0 is_stmt 1
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,8($fp)
	sw	$3,0($2)
	.loc 1 106 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	lw	$3,12($fp)
	nor	$3,$0,$3
	sw	$3,0($2)
	.loc 1 108 0
	nop
	.loc 1 109 0
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
	.loc 1 113 0
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
	.loc 1 114 0
	li	$2,-1082130432			# 0xffffffffbf800000
	li	$3,32769			# 0x8001
	sw	$3,0($2)
.L16:
	.loc 1 115 0 discriminator 1
	b	.L16
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
	.4byte	0x1b2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x1
	.4byte	.LASF20
	.4byte	.LASF21
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
	.4byte	.LASF8
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x8
	.byte	0x1
	.byte	0x1c
	.4byte	0x83
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1e
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x21
	.4byte	0x62
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x27
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf4
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x1
	.byte	0x29
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xdc
	.uleb128 0xa
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xc
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xa
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14e
	.uleb128 0xe
	.ascii	"val\000"
	.byte	0x1
	.byte	0x5c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x5e
	.4byte	0x14e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x14e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5f
	.4byte	0x153
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5f
	.4byte	0x153
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	0x46
	.uleb128 0xf
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x71
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18a
	.uleb128 0xe
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x1
	.byte	0x71
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.uleb128 0x12
	.4byte	0x46
	.4byte	0x19d
	.uleb128 0x13
	.4byte	0x19d
	.2byte	0x12b
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF18
	.uleb128 0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x23
	.4byte	0x18c
	.uleb128 0x5
	.byte	0x3
	.4byte	test_array
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
	.uleb128 0xa
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.ascii	"test_result\000"
.LASF14:
	.ascii	"allDigits\000"
.LASF16:
	.ascii	"_mips_handle_exception\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF12:
	.ascii	"writeValTo7Segs\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF19:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"reg32_t\000"
.LASF21:
	.ascii	"C:\\Users\\Dani\\Desktop\\Exercise3_Reordered\000"
.LASF11:
	.ascii	"main\000"
.LASF22:
	.ascii	"test_array\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"digit\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF15:
	.ascii	"enDigits\000"
.LASF17:
	.ascii	"reason\000"
.LASF18:
	.ascii	"sizetype\000"
.LASF20:
	.ascii	"main.c\000"
.LASF9:
	.ascii	"test_result_t\000"
.LASF5:
	.ascii	"short int\000"
.LASF6:
	.ascii	"event1\000"
.LASF7:
	.ascii	"event2\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
