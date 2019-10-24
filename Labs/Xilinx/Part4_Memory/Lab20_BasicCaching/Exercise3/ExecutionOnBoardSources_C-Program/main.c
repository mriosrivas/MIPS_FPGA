#include "mfp_io.h"

int __attribute__((aligned(16))) a[8][8];

int main ()
{
    int n = 0;
    int i, j;


    // Empty D$ by using cache instructions
    asm volatile
    ( 
        "   li $t1, 4096;"       // This should be set to (TOTAL_CACHE_SIZE)/16. For safety, we use the maximum possible value (i.e. the value for a 64KB D$)
        "   li $t2, 0;"
        "   lui $t3, 0x0;"
        "loop1:"
        "   cache 0x01, 0($t3);"    // According to the cache instruction, the op value must be, in binary, 000|01, as this means to invalidate the index in the D$
        "   addiu $t3, $t3, 16;"
        "   addiu $t2, $t2, 1;"
        "   blt $t2, $t1, loop1;"
    );


    // Wait for switch 2

    while ((MFP_SWITCHES & 4) == 0)
        ;


    for (i = 0; i < 8; i ++)
        for (j = 0; j < 8; j ++)
             a [i][j] = i + j;
            // a [j][i] = i + j;

    return 0;
}
