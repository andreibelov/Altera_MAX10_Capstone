/***************************************************
* File: DE10_LITE_Default.v
* Author: Andrei Belov
* Class: EE 271
* Module: DE10_LITE_Default
* Description: Top entity
****************************************************/

module DE10_LITE_Default
    (
        //////////// CLOCK //////////
        input ADC_CLK_10,
        input MAX10_CLK1_50,
        input MAX10_CLK2_50,

        //////////// SDRAM //////////
        output[12:0] DRAM_ADDR,
        output[1:0] DRAM_BA,
        output DRAM_CAS_N,
        output DRAM_CKE,
        output DRAM_CLK,
        output DRAM_CS_N,
        inout[15:0] DRAM_DQ,
        output DRAM_LDQM,
        output DRAM_RAS_N,
        output DRAM_UDQM,
        output DRAM_WE_N,

        //////////// SEG7 //////////
        output[7:0] HEX0,
        output[7:0] HEX1,
        output[7:0] HEX2,
        output[7:0] HEX3,
        output[7:0] HEX4,
        output[7:0] HEX5,

        //////////// KEY //////////
        input[1:0] KEY,

        //////////// LED //////////
        output[9:0] LEDR,

        //////////// SW //////////
        input[9:0] SW,

        //////////// VGA //////////
        output[3:0] VGA_B,
        output[3:0] VGA_G,
        output VGA_HS,
        output[3:0] VGA_R,
        output VGA_VS,

        //////////// Accelerometer //////////
        output GSENSOR_CS_N,
        input[2:1] GSENSOR_INT,
        output GSENSOR_SCLK,
        inout GSENSOR_SDI,
        inout GSENSOR_SDO,

        //////////// Arduino //////////
        inout[15:0] ARDUINO_IO,
        inout ARDUINO_RESET_N,

        //////////// GPIO, GPIO connect to GPIO Default //////////
        inout[35:0] GPIO
    );

    //=======================================================
    //  REG/WIRE declarations
    //=======================================================


    //=======================================================
    //  Structural coding
    //=======================================================
    //
    C4M1P3 u1(.Cin(SW[8]), .A(SW[7:4]), .B(SW[3:0]), .Cout(LEDR[4]), .S(LEDR[3:0]));

endmodule // DE10_LITE_Golden_Top
