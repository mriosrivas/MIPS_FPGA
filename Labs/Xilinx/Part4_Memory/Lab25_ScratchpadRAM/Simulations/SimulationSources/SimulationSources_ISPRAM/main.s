	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	ISPRAM_Init
.LFB0 = .
	.file 1 "main.c"
	.loc 1 41 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	ISPRAM_Init
	.type	ISPRAM_Init, @function
ISPRAM_Init:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
	sw	$fp,4($sp)
	.cfi_offset 30, -4
	move	$fp,$sp
	.cfi_def_cfa_register 30
	.loc 1 43 0
 #APP
 # 43 "main.c" 1
	nop;mfc0    $t4, $26, 0;lui     $t5, 0x1000;or      $t4, $t4, $t5;mtc0    $t4, $26, 0;nop;lui     $t3, 0x0000;mtc0    $t3, $28, 0;lui     $t3, 0x248f;mtc0    $t3, $28, 1;cache   0x8,0x0($0);lui     $t3, 0x24b8;mtc0    $t3, $28, 1;cache   0x8,0x4($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x007f;mtc0    $t3, $28, 1;cache   0x8,0x8($0);lui     $t3, 0x358c;ori   $t3, $t3, 0xffff;mtc0    $t3, $28, 1;cache   0x8,0xc($0);lui     $t3, 0x01ec;ori   $t3, $t3, 0x4024;mtc0    $t3, $28, 1;cache   0x8,0x10($0);lui     $t3, 0x030c;ori   $t3, $t3, 0x4824;mtc0    $t3, $28, 1;cache   0x8,0x14($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x0080;mtc0    $t3, $28, 1;cache   0x8,0x18($0);lui     $t3, 0x010c;ori   $t3, $t3, 0x4025;mtc0    $t3, $28, 1;cache   0x8,0x1c($0);lui     $t3, 0x012c;ori   $t3, $t3, 0x4825;mtc0    $t3, $28, 1;cache   0x8,0x20($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x7f80;mtc0    $t3, $28, 1;cache   0x8,0x24($0);lui     $t3, 0x01ec;ori   $t3, $t3, 0x5024;mtc0    $t3, $28, 1;cache   0x8,0x28($0);lui     $t3, 0x000a;ori   $t3, $t3, 0x55c2;mtc0    $t3, $28, 1;cache   0x8,0x2c($0);lui     $t3, 0x030c;ori   $t3, $t3, 0x5824;mtc0    $t3, $28, 1;cache   0x8,0x30($0);lui     $t3, 0x000b;ori   $t3, $t3, 0x5dc2;mtc0    $t3, $28, 1;cache   0x8,0x34($0);lui     $t3, 0x114b;ori   $t3, $t3, 0x000c;mtc0    $t3, $28, 1;cache   0x8,0x38($0);lui     $t3, 0x0000;ori   $t3, $t3, 0x0000;mtc0    $t3, $28, 1;cache   0x8,0x3c($0);lui     $t3, 0x014b;ori   $t3, $t3, 0x082b;mtc0    $t3, $28, 1;cache   0x8,0x40($0);lui     $t3, 0x1020;ori   $t3, $t3, 0x0006;mtc0    $t3, $28, 1;cache   0x8,0x44($0);lui     $t3, 0x0000;ori   $t3, $t3, 0x0000;mtc0    $t3, $28, 1;cache   0x8,0x48($0);lui     $t3, 0x016a;ori   $t3, $t3, 0x6022;mtc0    $t3, $28, 1;cache   0x8,0x4c($0);lui     $t3, 0x0188;ori   $t3, $t3, 0x4007;mtc0    $t3, $28, 1;cache   0x8,0x50($0);lui     $t3, 0x014c;ori   $t3, $t3, 0x5020;mtc0    $t3, $28, 1;cache   0x8,0x54($0);lui     $t3, 0x1000;ori   $t3, $t3, 0x0004;mtc0    $t3, $28, 1;cache   0x8,0x58($0);lui     $t3, 0x0000;ori   $t3, $t3, 0x0000;mtc0    $t3, $28, 1;cache   0x8,0x5c($0);lui     $t3, 0x014b;ori   $t3, $t3, 0x6022;mtc0    $t3, $28, 1;cache   0x8,0x60($0);lui     $t3, 0x0189;ori   $t3, $t3, 0x4807;mtc0    $t3, $28, 1;cache   0x8,0x64($0);lui     $t3, 0x016c;ori   $t3, $t3, 0x5820;mtc0    $t3, $28, 1;cache   0x8,0x68($0);lui     $t3, 0x0109;ori   $t3, $t3, 0x6820;mtc0    $t3, $28, 1;cache   0x8,0x6c($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x0100;mtc0    $t3, $28, 1;cache   0x8,0x70($0);lui     $t3, 0x01ac;ori   $t3, $t3, 0x6024;mtc0    $t3, $28, 1;cache   0x8,0x74($0);lui     $t3, 0x1180;ori   $t3, $t3, 0x0003;mtc0    $t3, $28, 1;cache   0x8,0x78($0);lui     $t3, 0x0000;ori   $t3, $t3, 0x0000;mtc0    $t3, $28, 1;cache   0x8,0x7c($0);lui     $t3, 0x000d;ori   $t3, $t3, 0x6842;mtc0    $t3, $28, 1;cache   0x8,0x80($0);lui     $t3, 0x214a;ori   $t3, $t3, 0x0001;mtc0    $t3, $28, 1;cache   0x8,0x84($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x007f;mtc0    $t3, $28, 1;cache   0x8,0x88($0);lui     $t3, 0x358c;ori   $t3, $t3, 0xffff;mtc0    $t3, $28, 1;cache   0x8,0x8c($0);lui     $t3, 0x01ac;ori   $t3, $t3, 0x6824;mtc0    $t3, $28, 1;cache   0x8,0x90($0);lui     $t3, 0x000a;ori   $t3, $t3, 0x55c0;mtc0    $t3, $28, 1;cache   0x8,0x94($0);lui     $t3, 0x3c0c;ori   $t3, $t3, 0x7f80;mtc0    $t3, $28, 1;cache   0x8,0x98($0);lui     $t3, 0x014c;ori   $t3, $t3, 0x5024;mtc0    $t3, $28, 1;cache   0x8,0x9c($0);lui     $t3, 0x01aa;ori   $t3, $t3, 0x1025;mtc0    $t3, $28, 1;cache   0x8,0xa0($0);lui     $t3, 0x03e0;ori   $t3, $t3, 0x8;mtc0    $t3, $28, 1;cache   0x8,0xa4($0);mtc0    $0, $28, 1;cache   0x8,0xa8($0);nop;mfc0    $t4, $26, 0;lui     $t5, 0xefff;ori    $t5, $t5, 0xffff;and     $t4, $t4, $t5;mtc0    $t4, $26, 0;nop;
 # 0 "" 2
	.loc 1 280 0
 #NO_APP
	move	$sp,$fp
	.cfi_def_cfa_register 29
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	jr	$31
	.end	ISPRAM_Init
	.cfi_endproc
.LFE0:
	.size	ISPRAM_Init, .-ISPRAM_Init
	.align	2
	.globl	main
.LFB1 = .
	.loc 1 285 0
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
	.loc 1 293 0
	jal	ISPRAM_Init
.LBB2 = .
	.loc 1 302 0
	li	$2,2			# 0x2
 #APP
 # 302 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 302 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 302 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 302 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 304 0
 #APP
 # 304 "main.c" 1
	addiu $sp ,$sp ,-4;sw $ra,0($sp);lui $a0, 0x3fa0;lui $a1, 0x4020;jal 0x40000;addiu $t9, $v0, 0;lw $ra,0($sp);addiu $sp, $sp, 4;
 # 0 "" 2
	.loc 1 315 0
 # 315 "main.c" 1
	   add $2, $t9, $zero;
 # 0 "" 2
 #NO_APP
	sw	$2,16($fp)
.LBB3 = .
.LBB4 = .
	.loc 1 322 0
 #APP
 # 322 "main.c" 1
	mfc0 $2,$25,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE4 = .
	sw	$2,20($fp)
.LBB5 = .
 #APP
 # 322 "main.c" 1
	mfc0 $2,$25,3
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE5 = .
	sw	$2,24($fp)
 #APP
 # 322 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 322 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 322 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 322 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.L8:
.LBE3 = .
	.loc 1 329 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x4
	lw	$2,0($2)
	li	$3,1			# 0x1
	beq	$2,$3,.L4
	sltu	$3,$2,1
	bne	$3,$0,.L5
	li	$3,2			# 0x2
	beq	$2,$3,.L6
	b	.L9
.L5:
	.loc 1 332 0
	lw	$2,20($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 333 0
	b	.L7
.L4:
	.loc 1 335 0
	lw	$2,24($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 336 0
	b	.L7
.L6:
	.loc 1 338 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	sw	$0,0($2)
	.loc 1 339 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,16($fp)
	sw	$3,0($2)
	.loc 1 340 0
	b	.L7
.L9:
	.loc 1 342 0
	move	$4,$0
	jal	writeValTo7Segs
.L7:
	.loc 1 344 0
	b	.L8
	.end	main
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.align	2
	.globl	writeValTo7Segs
.LFB2 = .
	.loc 1 351 0
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
	.loc 1 353 0
	sw	$0,4($fp)
	.loc 1 354 0
	sw	$0,8($fp)
	.loc 1 357 0
	sw	$0,4($fp)
	b	.L11
	nop

.L13:
	.loc 1 358 0 discriminator 4
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
	.loc 1 359 0 discriminator 4
	lw	$3,0($fp)
	lw	$2,4($fp)
	sll	$2,$2,2
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,8($fp)
	.loc 1 360 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sw	$2,24($fp)
	.loc 1 361 0 discriminator 4
	lw	$2,4($fp)
	li	$3,1			# 0x1
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,12($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	.loc 1 357 0 discriminator 4
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
.L11:
	.loc 1 357 0 is_stmt 0 discriminator 1
	lw	$2,24($fp)
	beq	$2,$0,.L12
	nop

	.loc 1 357 0 discriminator 3
	lw	$2,4($fp)
	slt	$2,$2,8
	bne	$2,$0,.L13
	nop

.L12:
	.loc 1 364 0 is_stmt 1
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,8($fp)
	sw	$3,0($2)
	.loc 1 365 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	lw	$3,12($fp)
	nor	$3,$0,$3
	sw	$3,0($2)
	.loc 1 367 0
	nop
	.loc 1 368 0
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
.LFE2:
	.size	writeValTo7Segs, .-writeValTo7Segs
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x15c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x1
	.4byte	.LASF14
	.4byte	.LASF15
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
	.byte	0x1d
	.4byte	0x6e
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1f
	.4byte	0x46
	.byte	0
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x20
	.4byte	0x46
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x22
	.4byte	0x4d
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1
	.byte	0x29
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x11d
	.4byte	0x46
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf5
	.uleb128 0xa
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x11f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.ascii	"x\000"
	.byte	0x1
	.2byte	0x120
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xdc
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.2byte	0x142
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.uleb128 0xd
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xb
	.ascii	"__r\000"
	.byte	0x1
	.2byte	0x142
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x15f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x155
	.uleb128 0xf
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x15f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x161
	.4byte	0x155
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x161
	.4byte	0x155
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x162
	.4byte	0x15a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x162
	.4byte	0x15a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	0x46
	.uleb128 0x10
	.4byte	0x2c
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
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF1:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g\000"
.LASF4:
	.ascii	"event2\000"
.LASF14:
	.ascii	"main.c\000"
.LASF6:
	.ascii	"test_result_t\000"
.LASF15:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_ISPRAM\000"
.LASF16:
	.ascii	"ISPRAM_Init\000"
.LASF3:
	.ascii	"event1\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"reg32_t\000"
.LASF12:
	.ascii	"enDigits\000"
.LASF8:
	.ascii	"main\000"
.LASF11:
	.ascii	"allDigits\000"
.LASF9:
	.ascii	"writeValTo7Segs\000"
.LASF10:
	.ascii	"digit\000"
.LASF7:
	.ascii	"test_result\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
