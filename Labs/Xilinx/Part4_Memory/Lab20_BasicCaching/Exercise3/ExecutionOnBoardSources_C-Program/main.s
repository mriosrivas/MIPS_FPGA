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
	.loc 1 6 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LVL0 = .
	.loc 1 12 0
 #APP
 # 12 "main.c" 1
	   li $t1, 4096;   li $t2, 0;   lui $t3, 0x0;loop1:   cache 0x01, 0($t3);   addiu $t3, $t3, 16;   addiu $t2, $t2, 1;   blt $t2, $t1, loop1;
 # 0 "" 2
	.loc 1 27 0
 #NO_APP
	li	$3,-1082130432			# 0xffffffffbf800000
.L2:
	.loc 1 27 0 is_stmt 0 discriminator 1
	lw	$2,4($3)
	andi	$2,$2,0x4
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L2
	lui	$6,%hi(a)
	.set	macro
	.set	reorder

	addiu	$6,$6,%lo(a)
	.loc 1 27 0
	move	$5,$0
	.loc 1 31 0 is_stmt 1
	.set	noreorder
	.set	nomacro
	b	.L3
	li	$7,8			# 0x8
	.set	macro
	.set	reorder

.LVL1 = .
.L4:
	.loc 1 33 0 discriminator 3
	sw	$2,0($3)
.LVL2 = .
	addiu	$2,$2,1
.LVL3 = .
	.loc 1 32 0 discriminator 3
	.set	noreorder
	.set	nomacro
	bne	$2,$4,.L4
	addiu	$3,$3,4
	.set	macro
	.set	reorder

	.loc 1 31 0 discriminator 2
	addiu	$5,$5,1
.LVL4 = .
	.set	noreorder
	.set	nomacro
	beq	$5,$7,.L5
	addiu	$6,$6,32
	.set	macro
	.set	reorder

.LVL5 = .
.L3:
	move	$2,$5
	addiu	$4,$5,8
	.loc 1 6 0 discriminator 1
	.set	noreorder
	.set	nomacro
	b	.L4
	move	$3,$6
	.set	macro
	.set	reorder

.LVL6 = .
.L5:
	.loc 1 37 0
	.set	noreorder
	.set	nomacro
	jr	$31
	move	$2,$0
	.set	macro
	.set	reorder

	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main

	.comm	a,256,16
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x91
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF1
	.byte	0x1
	.4byte	.LASF2
	.4byte	.LASF3
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x5
	.4byte	0x61
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61
	.uleb128 0x3
	.ascii	"n\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x61
	.byte	0
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x61
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.ascii	"j\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x61
	.4byte	.LLST0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.4byte	0x61
	.4byte	0x7e
	.uleb128 0x8
	.4byte	0x7e
	.byte	0x7
	.uleb128 0x8
	.4byte	0x7e
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0xa
	.ascii	"a\000"
	.byte	0x1
	.byte	0x3
	.4byte	0x68
	.uleb128 0x5
	.byte	0x3
	.4byte	a
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
	.uleb128 0x3
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x9
	.byte	0x73
	.sleb128 -4
	.byte	0x6
	.byte	0x75
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x9
	.byte	0x73
	.sleb128 -4
	.byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x9
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x9
	.byte	0x73
	.sleb128 -4
	.byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x9
	.byte	0x9f
	.4byte	0
	.4byte	0
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
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF2:
	.ascii	"main.c\000"
.LASF0:
	.ascii	"sizetype\000"
.LASF4:
	.ascii	"main\000"
.LASF3:
	.ascii	"C:\\Users\\Dani\\Desktop\\ExecutionOnBoardSources_C-Prog"
	.ascii	"ram\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
