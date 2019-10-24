int __attribute__((aligned(16))) test_data[10000];
int main ()
{
    asm volatile
    ( 
        "lui $t6, 0x8000;"
        "addiu $t6, $t6, test_data;"
        "loop:"
        "   lw  $t1, 0($t6);"
        "   nop;"
        "   nop;"
        "   lw  $t1, 2048($t6);"
        "   nop;"
        "   nop;"
        "   lw  $t1, 4096($t6);"
        "   nop;"
        "   nop;"
        "   nop;"
        "   nop;"
        "   nop;"
        "   nop;"
        "   b       loop;"
        "   nop;"
    );
    return 0;
}