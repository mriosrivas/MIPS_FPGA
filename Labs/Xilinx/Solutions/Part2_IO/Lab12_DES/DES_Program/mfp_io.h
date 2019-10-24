#ifndef MFP_MEMORY_MAPPED_REGISTERS_H
#define MFP_MEMORY_MAPPED_REGISTERS_H

#define MFP_LEDS_ADDR           0xBF800000
#define MFP_SWITCHES_ADDR       0xBF800004
#define MFP_BUTTONS_ADDR        0xBF800008
#define MFP_7SEGEN_ADDR         0xBF80000c
#define MFP_7SEGDIGITS_ADDR     0xBF800010

#define MFP_MILLIS_ADDR         0xBF800034
#define MFP_SPI_DATA_ADDR       0xBF80003c
#define MFP_SPI_DONE_ADDR       0xBF800040

#define MFP_DMASRC_ADDR         0xBF300000
#define MFP_DMADST_ADDR         0xBF300004
#define MFP_DMASIZE_ADDR        0xBF300008
#define MFP_DMASTART_ADDR       0xBF30000c

#define MFP_DESKEYLO_ADDR       0xBF300010
#define MFP_DESKEYHI_ADDR       0xBF300014
#define MFP_DESENDECRYPT_ADDR   0xBF300018


#define MFP_LEDS                (* (volatile unsigned *) MFP_LEDS_ADDR          )
#define MFP_SWITCHES            (* (volatile unsigned *) MFP_SWITCHES_ADDR      )
#define MFP_BUTTONS             (* (volatile unsigned *) MFP_BUTTONS_ADDR       )
#define MFP_7SEGEN              (* (volatile unsigned *) MFP_7SEGEN_ADDR        )
#define MFP_7SEGDIGITS          (* (volatile unsigned *) MFP_7SEGDIGITS_ADDR    )
#define MFP_MILLIS              (* (volatile unsigned *) MFP_MILLIS_ADDR        )
#define MFP_SPI_DATA            (* (volatile unsigned *) MFP_SPI_DATA_ADDR      )
#define MFP_SPI_DONE            (* (volatile unsigned *) MFP_SPI_DONE_ADDR      )
#define MFP_DMASRC              (* (volatile unsigned *) MFP_DMASRC_ADDR        )
#define MFP_DMADST              (* (volatile unsigned *) MFP_DMADST_ADDR        )
#define MFP_DMASIZE             (* (volatile unsigned *) MFP_DMASIZE_ADDR       )
#define MFP_DMASTART            (* (volatile unsigned *) MFP_DMASTART_ADDR      )
#define MFP_DESKEYLO            (* (volatile unsigned *) MFP_DESKEYLO_ADDR      )
#define MFP_DESKEYHI            (* (volatile unsigned *) MFP_DESKEYHI_ADDR      )
#define MFP_DESENDECRYPT        (* (volatile unsigned *) MFP_DESENDECRYPT_ADDR  )


// This define is used in boot.S code

#define BOARD_16_LEDS_ADDR      MFP_LEDS_ADDR

#endif
