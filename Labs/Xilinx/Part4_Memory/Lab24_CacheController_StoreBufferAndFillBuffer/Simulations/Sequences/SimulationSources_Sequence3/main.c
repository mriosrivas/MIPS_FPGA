int __attribute__((aligned(16))) test_data[10]={0,1,2,3,4,5,6,7,8,9};

int main() {


    // Empty D$ by using cache instructions
    asm volatile
    ( 
        "   li $t1, 256;"
        "   li $t2, 0;"
        "   lui $t3, 0x0;"
        "loop1:"
        "   cache 0x01, 0($t3);"    // According to the cache instruction, the op value must be, in binary, 000|01, as this means to invalidate the index in the D$
        "   addiu $t3, $t3, 16;"
        "   addiu $t2, $t2, 1;"
        "   blt $t2, $t1, loop1;"
    );

    
    asm volatile
    ( 
        "   li $t1, 2;"
        "   li $t2, 0;"
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   loop:"
            "   nop;"
            "   lw $t7, 8($t6);"
            "   lw $t8, 12($t6);"
            "   nop;"
            "   addiu $t6, $t6, 16;"
            "   addiu $t2, $t2, 1;"
            "   blt $t2, $t1, loop;"
        "   b .;"       // Stay here
    );

    return 0;
}