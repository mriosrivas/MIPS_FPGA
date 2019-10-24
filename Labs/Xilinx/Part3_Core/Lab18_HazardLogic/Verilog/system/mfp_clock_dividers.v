module mfp_clock_divider
(
    input      clki,
    input      sel_lo,
    input      sel_mid,
    output reg clko
);

    parameter DIV_POW_FASTEST = 1;
    parameter DIV_POW_SLOWEST = 27;

    reg [DIV_POW_SLOWEST - 1: 0] counter;

    always @ (posedge clki)
        counter <= counter + 1'b1;

    always @ (*)
	  clko = sel_lo  ? counter [DIV_POW_SLOWEST - 1] : 
             sel_mid ? counter [DIV_POW_SLOWEST - 5] :
                       counter [DIV_POW_FASTEST - 1] ;

endmodule

//--------------------------------------------------------------------

module mfp_clock_divider_100_MHz_to_25_MHz_12_Hz_0_75_Hz
(
    input  clki,
    input  sel_lo,
    input  sel_mid,
    output clko
);

    // sel = ?1: clock frequency = 100 MHz / 2 ** 27 = 0.75 Hz
    // sel = 10: clock frequency = 100 MHz / 2 ** 23 = 12 Hz
    // sel = 00: clock frequency = 100 MHz / 4       = 25 MHz


    mfp_clock_divider # (.DIV_POW_FASTEST (2), .DIV_POW_SLOWEST (27))
    mfp_clock_divider (clki, sel_lo, sel_mid, clko);

endmodule

//--------------------------------------------------------------------

module mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz
(
    input  clki,
    input  sel_lo,
    input  sel_mid,
    output clko
);

    mfp_clock_divider # (.DIV_POW_FASTEST (1), .DIV_POW_SLOWEST (26))
    mfp_clock_divider (clki, sel_lo, sel_mid, clko);

endmodule

//--------------------------------------------------------------------

module mfp_clock_divider_100_MHz_to_763_Hz
(
    input  clki,
    output clko
);

    mfp_clock_divider
    # (.DIV_POW_SLOWEST (17))
    mfp_clock_divider
    (
        .clki    ( clki ),
        .sel_lo  ( 1'b1 ),
        .sel_mid ( 1'b0 ),
        .clko    ( clko )
    );

endmodule
