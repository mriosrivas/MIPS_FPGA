#ifndef MFP_MEMORY_MAPPED_REGISTERS_H
#define MFP_MEMORY_MAPPED_REGISTERS_H

#define MFP_LEDS_ADDR           0xBF800000
#define MFP_SWITCHES_ADDR       0xBF800004
#define MFP_BUTTONS_ADDR        0xBF800008
#define MFP_7SEGEN_ADDR         0xBF80000c
#define MFP_7SEGDIGITS_ADDR     0xBF800010


#define MFP_LEDS                (* (volatile unsigned *) MFP_LEDS_ADDR          )
#define MFP_SWITCHES            (* (volatile unsigned *) MFP_SWITCHES_ADDR      )
#define MFP_BUTTONS             (* (volatile unsigned *) MFP_BUTTONS_ADDR       )
#define MFP_7SEGEN              (* (volatile unsigned *) MFP_7SEGEN_ADDR        )
#define MFP_7SEGDIGITS          (* (volatile unsigned *) MFP_7SEGDIGITS_ADDR    )

// This define is used in boot.S code

#define BOARD_16_LEDS_ADDR      MFP_LEDS_ADDR

#endif
