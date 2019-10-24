#include "mfp_io.h"

int main ()
{
	// enable the four right-most 7-segment display digits
	MFP_7SEGEN = 0xF0;  

    while (1) {
        MFP_LEDS          = MFP_LIGHTSENSOR;
        MFP_7SEGDIGITS    = MFP_LIGHTSENSOR;
    }

    return 0;
}
