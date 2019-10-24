int main ()
{
    asm volatile
    ( 
        ".set noreorder;"

        "loop:"
        "   add   $t1, $zero, $zero;"
        "   add   $t2, $zero, $zero;"
        "	nop;"
        "   addiu   $t1, $zero, 1;"
        "   addiu   $t2, $zero, 2;"
        "   add     $t3, $t2, $t1;"
        "   b       loop;"
        "	nop;"
    );
    return 0;
}
