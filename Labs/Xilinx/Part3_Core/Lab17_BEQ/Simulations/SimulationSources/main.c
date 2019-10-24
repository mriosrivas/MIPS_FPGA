int main() {

    asm volatile
    ( 
        "   li $t1, 4;"
        "   li $t2, 4;"
        "a:"
        "   addiu $t1, $t1, 1;"
        "   addiu $t2, $t2, 1;"
        "   beq $t2, $t1, a;"
    );

    return 0;
}