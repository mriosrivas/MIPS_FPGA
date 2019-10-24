int __attribute__((aligned(16))) test_data[4]={0xf,0xe,0xd,0xc};

int main() {

    asm volatile
    ( 
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   lw  $t5, 0($t6);"  // array[0] - Miss
        "   nop;"
        "   addi $t6, $t6, 1;"  // We include several instructions between the two lw instructions in order to avoid an undesired effect with the Fill Buffer (Lab 24)
        "   nop;"
        "   addi $t6, $t6, 1;"
        "   nop;"
        "   addi $t6, $t6, 1;"
        "   nop;"
        "   addi $t6, $t6, 1;"
        "   nop;"
        "   lw  $t5, 0($t6);"  // array[1] - Hit
        "   b .;"               // Stay here
    );

    return 0;
}