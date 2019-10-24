int __attribute__((aligned(16))) test_data[1000];
int main ()
{
    asm volatile
    ( 
        "lui $t6, 0x8000;"
        "addiu $t6, $t6, test_data;"
        "loop:"
        "   lw  $t1, 0($t6);"
        "   lw  $t1, 4($t6);"
        "   lw  $t1, 8($t6);"
        "   lw  $t1, 12($t6);"
        "   lw  $t1, 16($t6);"
        "   lw  $t1, 20($t6);"
        "   lw  $t1, 24($t6);"
        "   lw  $t1, 28($t6);"
        "   addiu $t6, $t6, 32;"
        "   b       loop;"
        "   nop;"
    );
    return 0;
}