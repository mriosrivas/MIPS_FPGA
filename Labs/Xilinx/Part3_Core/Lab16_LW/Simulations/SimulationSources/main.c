int __attribute__((aligned(16))) test_data[10]={0xf,0xe,0xd,0xc,0xb,0xa,0x9,0x8,0x7,0x6};

int main() {

    asm volatile
    ( 
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   li $t5, 0;"
        "   nop;"
        "   lw  $t5, 8($t6);"  // array[2]=0xd
        "   nop;"
        "   li $t5, 0;"
        "   lw  $t5, 8($t6);"  // array[2]=0xd
        "   b .;"               // Stay here
    );

    return 0;
}