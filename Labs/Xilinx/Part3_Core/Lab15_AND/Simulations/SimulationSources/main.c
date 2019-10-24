int main() {

    asm volatile
    ( 
        "   li $t3, 2;"         // Initialize first source operand
        "   li $t4, 3;"         // Initialize second source operand
        "   li $t5, 0;"         // Initialize destination operand
        "   nop;"               // Avoid RAW dependencies
        "   and $t5, $t4, $t3;" // AND Operation
        "   b .;"               // Stay here
    );

    return 0;
}