int test_data=10;
int main ()
{
    asm volatile
    ( 
        ".set noreorder;"

        "lui $t6, 0x8000;"
        "addiu $t6, $t6, test_data;"
        "loop:"
        "   add   $t1, $zero, $zero;"
        "   nop;"
        "   lw  $t1, 0($t6);"
        "   add $t2, $zero, $t1;"
        "   b       loop;"
        "   nop;"
    );
    return 0;
}