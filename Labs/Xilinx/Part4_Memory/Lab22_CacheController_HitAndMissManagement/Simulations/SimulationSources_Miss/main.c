int __attribute__((aligned(16))) test_data[10]={0xf,0xe,0xd,0xc,0xb,0xa,0x9,0x8,0x7,0x6};

int main() {

    asm volatile
    ( 
        "   li $t1, 2;"
        "   li $t2, 0;"
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   loop:"
            "   sub $t4,$t1,$t2;"
            "   and $t4,$t1,$t2;"
            "   lw  $t5, 4($t6);"
            "   add $t4,$t1,$t2;"
            "   nor $t4,$t1,$t2;"
            "   or  $t4,$t1,$t2;"
            "   nop;"
            "   addiu $t6, $t6, 16;"
            "   addiu $t2, $t2, 1;"
            "   blt $t2, $t1, loop;"
        "   b .;"               // Stay here
    );

    return 0;
}