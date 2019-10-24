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
	.loc 1 4 0
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
	.loc 1 8 0
 #APP
 # 8 "main.c" 1
	.set noreorder;   start: li $t1, 1;   li $t2, 1;   li $t3, 1;   li $t4, 2;   beql $t4, $t3, a;   add $t1, $t1, $t1;   add $t2, $t2, $t2;   a: beql $t4, $t4, b;   add $t2, $t2, $t2;   add $t1, $t1, $t1;   b:   b start;   nop;.set reorder;
 # 0 "" 2
	.loc 1 32 0
 # 32 "main.c" 1
	   add $6, $t1, $zero;
 # 0 "" 2
.LVL1 = .
	.loc 1 37 0
 # 37 "main.c" 1
	   add $5, $t2, $zero;
 # 0 "" 2
.LVL2 = .
	.loc 1 43 0
 #NO_APP
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$0,12($2)
	.loc 1 46 0
	li	$3,-1082130432			# 0xffffffffbf800000
	li	$4,1			# 0x1
.L2:
	lw	$2,4($3)
	beq	$2,$0,.L4
	beq	$2,$4,.L5
	b	.L7
.L4:
	.loc 1 48 0
	sw	$6,16($3)
	.loc 1 49 0
	b	.L2
.L5:
	.loc 1 51 0
	sw	$5,16($3)
	.loc 1 52 0
	b	.L2
.L7:
	.loc 1 54 0
	sw	$0,16($3)
	b	.L2
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x63
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x1
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.4byte	0x5f
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x5f
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x3
	.ascii	"y\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x5f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.ascii	"z\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x5f
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
.LASF2:
	.ascii	"C:\\Users\\Dani\\Desktop\\SimulationSources_BC\000"
.LASF0:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF1:
	.ascii	"main.c\000"
.LASF3:
	.ascii	"main\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
