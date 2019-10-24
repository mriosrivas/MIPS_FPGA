int main() {

    asm volatile
    ( 
        "loop:"
        "   li $t3, 2;"
        "   li $t4, 3;"
        "   add $t5, $t4, $t3;"
        "   sub $t6, $t5, $t3;"
        "   b loop;"               // Infinite loop
    );

    return 0;
}