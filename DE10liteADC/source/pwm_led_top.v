// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Tue Apr 23 23:14:26 2024"

module pwm_led_top
    (
        input wire MAX10_CLK1_50,
        input wire ADC_CLK_10,
        input wire ARDUINO_RESET_N,
        input wire[2:0] SW,
        output wire[0:0] ARDUINO_IO,
        output wire[6:0] HEX0,
        output wire[6:0] HEX1,
        output wire[6:0] HEX2,
        output wire[6:0] HEX3,
        output wire[6:0] HEX4,
        output wire[6:0] HEX5,
        output wire[0:0] LEDR
    );

    wire adc_clk;
    wire[2:0] duty_cycle;
    wire duty_cycle_clk;
    wire not_pwm;
    wire pwm;
    wire pwm_clk;
    wire mm_bridge_0_s0_burstcount;
    wire mm_bridge_0_s0_write;
    wire mm_bridge_0_s0_read;
    wire mm_bridge_0_s0_debugaccess;
    wire[9:0] mm_bridge_0_s0_address;
    wire[1:0] mm_bridge_0_s0_byteenable;
    wire[15:0] mm_bridge_0_s0_writedata;
    wire mm_bridge_0_s0_waitrequest;
    wire mm_bridge_0_s0_readdatavalid;
    wire modular_adc_0_response_valid;
    wire modular_adc_0_response_empty;
    wire modular_adc_0_response_startofpacket;
    wire modular_adc_0_response_endofpacket;
    wire[15:0] mm_bridge_0_s0_readdata;
    wire[4:0] modular_adc_0_response_channel;
    wire[11:0] modular_adc_0_response_data;
    wire[23:0] led7;

    pwm_pll b2v_inst(
        .inclk0(MAX10_CLK1_50),
        .c0(pwm_clk),
        .c1(duty_cycle_clk));

    ADC b2v_inst1(
        .clk_clk(adc_clk),
        .mm_bridge_0_s0_burstcount(mm_bridge_0_s0_burstcount),
        .mm_bridge_0_s0_write(mm_bridge_0_s0_write),
        .mm_bridge_0_s0_read(mm_bridge_0_s0_read),
        .mm_bridge_0_s0_debugaccess(mm_bridge_0_s0_debugaccess),
        .reset_reset_n(ARDUINO_RESET_N),
        .mm_bridge_0_s0_address(mm_bridge_0_s0_address),
        .mm_bridge_0_s0_byteenable(mm_bridge_0_s0_byteenable),
        .mm_bridge_0_s0_writedata(mm_bridge_0_s0_writedata),
        .mm_bridge_0_s0_waitrequest(mm_bridge_0_s0_waitrequest),
        .mm_bridge_0_s0_readdatavalid(mm_bridge_0_s0_readdatavalid),
        .modular_adc_0_response_valid(modular_adc_0_response_valid),
        .modular_adc_0_response_startofpacket(modular_adc_0_response_startofpacket),
        .modular_adc_0_response_endofpacket(modular_adc_0_response_endofpacket),
        .modular_adc_0_response_empty(modular_adc_0_response_empty),
        .mm_bridge_0_s0_readdata(mm_bridge_0_s0_readdata),
        .modular_adc_0_response_channel(modular_adc_0_response_channel),
        .modular_adc_0_response_data(modular_adc_0_response_data));

    assign not_pwm = ~pwm;

    debouncer b2v_inst3(
        .noisy(SW[0]),
        .clk(duty_cycle_clk),
        .debounced(duty_cycle[0]));

    debouncer b2v_inst4(
        .noisy(SW[1]),
        .clk(duty_cycle_clk),
        .debounced(duty_cycle[1]));

    debouncer b2v_inst5(
        .noisy(SW[2]),
        .clk(duty_cycle_clk),
        .debounced(duty_cycle[2]));

    pwm_gen b2v_inst6(
        .clk(pwm_clk),
        .duty_cycle(duty_cycle),
        .pwm(pwm));

    ADC_connect b2v_inst7(
        .clk(adc_clk),
        .reset_n(ARDUINO_RESET_N),
        .mm_bridge_0_s0_waitrequest(mm_bridge_0_s0_waitrequest),
        .mm_bridge_0_s0_readdatavalid(mm_bridge_0_s0_readdatavalid),
        .modular_adc_0_valid(modular_adc_0_response_valid),
        .modular_adc_0_response_empty(modular_adc_0_response_empty),
        .modular_adc_0_startofpacket(modular_adc_0_response_startofpacket),
        .modular_adc_0_endofpacket(modular_adc_0_response_endofpacket),
        .mm_bridge_0_s0_readdata(mm_bridge_0_s0_readdata),
        .modular_adc_0_channel(modular_adc_0_response_channel),
        .modular_adc_0_data(modular_adc_0_response_data),
        .mm_bridge_0_s0_burstcount(mm_bridge_0_s0_burstcount),
        .mm_bridge_0_s0_write(mm_bridge_0_s0_write),
        .mm_bridge_0_s0_read(mm_bridge_0_s0_read),
        .mm_bridge_0_s0_debugaccess(mm_bridge_0_s0_debugaccess),
        .led7(led7),
        .mm_bridge_0_s0_address(mm_bridge_0_s0_address),
        .mm_bridge_0_s0_byteenable(mm_bridge_0_s0_byteenable),
        .mm_bridge_0_s0_writedata(mm_bridge_0_s0_writedata));

    SEG7_LUT_6 b2v_inst9(
        .iDIG(led7),
        .oSEG0(HEX0),
        .oSEG1(HEX1),
        .oSEG2(HEX2),
        .oSEG3(HEX3),
        .oSEG4(HEX4),
        .oSEG5(HEX5));

    assign ARDUINO_IO = not_pwm;
    assign adc_clk = ADC_CLK_10;
    assign LEDR = not_pwm;

endmodule // pwm_led_top
