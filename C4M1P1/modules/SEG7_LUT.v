/***************************************************
* File: SEG7_LUT.v
* Author: Andrei Belov
* Class: EE 271
* Module: SEG7_LUT
* Description: Top entity
****************************************************/

module SEG7_LUT
    (
        input[3:0] iDIG,
        output reg[6:0] oSEG
    );

    always @(iDIG)
        begin
            casex (iDIG)
                4'h0: oSEG = 7'b1000000;
                4'h1: oSEG = 7'b1111001;    // ---t----
                4'h2: oSEG = 7'b0100100;    // |	  |
                4'h3: oSEG = 7'b0110000;    // lt	 rt
                4'h4: oSEG = 7'b0011001;    // |	  |
                4'h5: oSEG = 7'b0010010;    // ---m----
                4'h6: oSEG = 7'b0000010;    // |	  |
                4'h7: oSEG = 7'b1111000;    // lb	 rb
                4'h8: oSEG = 7'b0000000;    // |	  |
                4'h9: oSEG = 7'b0011000;    // ---b----
                default: oSEG = 7'bxxxxxxx;
            endcase
        end

endmodule // SEG7_LUT
