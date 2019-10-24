	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	main
.LFB0 = .
	.file 1 "main.c"
	.loc 1 41 0
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
.LBB2 = .
	.loc 1 52 0
	li	$2,2			# 0x2
 #APP
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	li	$2,34			# 0x22
 #APP
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$25,2
ehb
.set pop
 # 0 "" 2
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 52 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBE2 = .
	.loc 1 54 0
 #APP
 # 54 "main.c" 1
	lui $t7, 0x3fa0;lui $t8, 0x4020;flpadd: lui $t4,0x007f;ori $t4,$t4,0xffff;and $t0,$t7,$t4;and $t1,$t8,$t4;lui $t4,0x0080;or $t0,$t0,$t4;or $t1,$t1,$t4;lui $t4,0x7f80;and $t2,$t7,$t4;srl $t2,$t2,23;and $t3,$t8,$t4;srl $t3,$t3,23;match: beq $t2,$t3,addsig;bgeu $t2,$t3,shiftb;shifta: sub $t4,$t3,$t2;srav $t0,$t0,$t4;add $t2,$t2,$t4;b addsig;shiftb: sub $t4,$t2,$t3;srav $t1,$t1,$t4;add $t3,$t3,$t4;addsig: add $t5,$t0,$t1;norm: lui $t4,0x0100;and $t4,$t5,$t4;beq $t4,$0,done;srl $t5,$t5,1;addi $t2,$t2,1;done: lui $t4,0x007f;ori $t4,$t4,0xffff;and $t5,$t5,$t4;sll $t2,$t2,23;lui $t4,0x7f80;and $t2,$t2,$t4;or $t9,$t5,$t2;   add $2, $t9, $zero;
 # 0 "" 2
 #NO_APP
	sw	$2,16($fp)
.LBB3 = .
.LBB4 = .
	.loc 1 99 0
 #APP
 # 99 "main.c" 1
	mfc0 $2,$25,1
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE4 = .
	sw	$2,20($fp)
.LBB5 = .
 #APP
 # 99 "main.c" 1
	mfc0 $2,$25,3
 # 0 "" 2
 #NO_APP
	move	$31,$2
	move	$2,$31
.LBE5 = .
	sw	$2,24($fp)
 #APP
 # 99 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,0
ehb
.set pop
 # 0 "" 2
 # 99 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,2
ehb
.set pop
 # 0 "" 2
 # 99 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,1
ehb
.set pop
 # 0 "" 2
 # 99 "main.c" 1
	.set push 
.set noreorder
mtc0 $0,$25,3
ehb
.set pop
 # 0 "" 2
 #NO_APP
.L7:
.LBE3 = .
	.loc 1 105 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x4
	lw	$2,0($2)
	li	$3,1			# 0x1
	beq	$2,$3,.L3
	sltu	$3,$2,1
	bne	$3,$0,.L4
	li	$3,2			# 0x2
	beq	$2,$3,.L5
	b	.L8
.L4:
	.loc 1 108 0
	lw	$2,20($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 109 0
	b	.L6
.L3:
	.loc 1 111 0
	lw	$2,24($fp)
	move	$4,$2
	jal	writeValTo7Segs
	.loc 1 112 0
	b	.L6
.L5:
	.loc 1 114 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	sw	$0,0($2)
	.loc 1 115 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,16($fp)
	sw	$3,0($2)
	.loc 1 116 0
	b	.L6
.L8:
	.loc 1 118 0
	move	$4,$0
	jal	writeValTo7Segs
.L6:
	.loc 1 120 0
	b	.L7
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	writeValTo7Segs
.LFB1 = .
	.loc 1 127 0
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
	.loc 1 129 0
	sw	$0,4($fp)
	.loc 1 130 0
	sw	$0,8($fp)
	.loc 1 133 0
	sw	$0,4($fp)
	b	.L10
	nop

.L12:
	.loc 1 134 0 discriminator 4
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
	.loc 1 135 0 discriminator 4
	lw	$3,0($fp)
	lw	$2,4($fp)
	sll	$2,$2,2
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,8($fp)
	.loc 1 136 0 discriminator 4
	lw	$3,24($fp)
	li	$2,-859045888			# 0xffffffffcccc0000
	ori	$2,$2,0xcccd
	multu	$3,$2
	mfhi	$2
	srl	$2,$2,3
	sw	$2,24($fp)
	.loc 1 137 0 discriminator 4
	lw	$2,4($fp)
	li	$3,1			# 0x1
	sll	$2,$3,$2
	move	$3,$2
	lw	$2,12($fp)
	or	$2,$3,$2
	sw	$2,12($fp)
	.loc 1 133 0 discriminator 4
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
.L10:
	.loc 1 133 0 is_stmt 0 discriminator 1
	lw	$2,24($fp)
	beq	$2,$0,.L11
	nop

	.loc 1 133 0 discriminator 3
	lw	$2,4($fp)
	slt	$2,$2,8
	bne	$2,$0,.L12
	nop

.L11:
	.loc 1 140 0 is_stmt 1
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0x10
	lw	$3,8($fp)
	sw	$3,0($2)
	.loc 1 141 0
	li	$2,-1082130432			# 0xffffffffbf800000
	ori	$2,$2,0xc
	lw	$3,12($fp)
	nor	$3,$0,$3
	sw	$3,0($2)
	.loc 1 143 0
	nop
	.loc 1 144 0
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
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x140
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
	.4byte	.LASF8
	.byte	0x1
	.byte	0x29
	.4byte	0x46
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdf
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2b
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xc7
	.uleb128 0xa
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x63
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
	.byte	0x63
	.4byte	0x25
	.uleb128 0x1
	.byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0x7f
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139
	.uleb128 0xe
	.ascii	"val\000"
	.byte	0x1
	.byte	0x7f
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x1
	.byte	0x81
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x81
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x1
	.byte	0x82
	.4byte	0x13e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x82
	.4byte	0x13e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	0x46
	.uleb128 0xf
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
.LASF12:
	.ascii	"enDigits\000"
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
.LASF15:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_WithoutISPRA"
	.ascii	"M\000"
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
