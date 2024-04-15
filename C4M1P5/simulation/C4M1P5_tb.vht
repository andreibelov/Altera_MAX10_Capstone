-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Intel Program License
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to
-- suit user's needs .Comments are provided in each section to help the user
-- fill out necessary details.
-- ***************************************************************************
-- Generated on "04/15/2024 01:04:12"

-- Vhdl Test Bench template for design  :  C4M1P5_internal
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.c4m1p5_internal;

entity C4M1P5_tb is
end C4M1P5_tb;

architecture C4M1P5_tb_arch of C4M1P5_tb is
	-- constants
	-- signals
	signal a_tb 	: std_logic_vector(3 downto 0);
	signal b_tb 	: std_logic_vector(3 downto 0);
	signal cin_tb 	: std_logic;
	signal err 		: std_logic;
	signal s0_tb 	: integer range 0 to 9;
	signal s1_tb 	: integer range 0 to 9;
	signal x_tb 	: integer range 0 to 9;
	signal y_tb 	: integer range 0 to 9;
	signal Sum_tb   : integer := 0;
	signal expect	: integer := 0;
	signal simend 	: boolean := false; -- signal to end simulation
begin
	DUT : entity work.c4m1p5_internal port map (
		-- list connections between master ports and signals
		A_input => a_tb, B_input => b_tb, Cin => cin_tb,
		ERR => err,
		S0 => s0_tb, S1 => s1_tb,
		X_out => x_tb, Y_out => y_tb);

	init : process
		-- variable declarations
	begin
		-- code that executes only once
		wait;
	end process init;

	-- Monitor
	txt_out : process (cin_tb)
		variable str_o : line;
	begin
		write(str_o, LF);
		write(str_o, string'(" a="));      write(str_o, a_tb);
		write(str_o, string'(" b="));      write(str_o, b_tb);
		write(str_o, string'(" cin="));    write(str_o, Cin_tb);
		write(str_o, string'(" sum="));    write(str_o, Sum_tb);
		write(str_o, string'(" expect=")); write(str_o, expect);
		write(str_o, LF);
		report time'image(now) & str_o.all severity note;
	end process txt_out;

	always : process
		-- optional sensitivity list
		-- (        )
		-- variable declarations
		variable i, j, k : integer := 0;
		variable a_v, b_v : std_logic_vector(3 downto 0) := "0000";
		constant n : integer := 4;
		variable expect_v	: integer := 0;
		variable Cin_v : std_logic := '0';
	begin
    	wait for 0 ns;
    	a_tb   <= "1111"; b_tb <= "1111"; cin_tb <= '1';
		wait for 2 ns;
		expect <= 88;
    	Sum_tb <= (s1_tb * 10) + s0_tb;
		wait for 2 ns;

		for i in 0 to 2**n-1 loop
			for j in 0 to 2**n-1 loop
				for k in 0 to 1 loop
					a_v := std_logic_vector(to_unsigned(i, a_tb'length));
					b_v := std_logic_vector(to_unsigned(j, b_tb'length));
					Cin_v :=  to_unsigned(k, 1)(0);
					a_tb <= a_v; b_tb <= b_v; cin_tb <= Cin_v;
					wait for 2 ns;
					Sum_tb <= (s1_tb * 10) + s0_tb;
					expect_v := i + j + k;
					if (expect_v < 20) then
						expect <= expect_v;
					else
						expect <= 88;
					end if;
					wait for 2 ns;
					if (sum_tb /= expect) then
						simend <= true;
						wait for 10 ns;
						assert false report "Error - Sum" severity failure;
		            end if;
				end loop;
			end loop;
		end loop;
		wait for 10 ns;
		simend <= true;
		wait for 1 ns;
		assert false report "Test Complete" & time'image(now) severity failure;
	wait;
	end process always;

end architecture C4M1P5_tb_arch; -- of C4M1P5_tb
