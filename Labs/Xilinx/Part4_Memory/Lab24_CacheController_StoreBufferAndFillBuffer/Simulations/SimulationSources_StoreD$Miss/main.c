int __attribute__((aligned(16))) test_data[10]={0,1,2,3,4,5,6,7,8,9};

int main() {
    
    asm volatile
    ( 
        "   li $t1, 2;"
        "   li $t2, 0;"
        "   lui $t6, 0x8000;"
        "   addiu $t6, $t6, test_data;"
        "   loop:"
            "   nop;"
            "   sw $t2, 4($t6);"
            "   nop;"
            "   addiu $t2, $t2, 1;"
            "   addiu $t6, $t6, 16;"
            "   blt $t2, $t1, loop;"
        "   b ."        // Stay here
    );

    return 0;
}