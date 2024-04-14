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
-- Generated on "04/10/2024 07:11:28"

-- Vhdl Test Bench template for design  :  C4M1P2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity C4M1P2_vhd_tst IS end C4M1P2_vhd_tst;

architecture C4M1P2_arch of C4M1P2_vhd_tst is
	component C4M1P2 port (
		-- Input ports
		SW : in STD_LOGIC_VECTOR(3 downto 0);
		-- Output ports
		HEX0 : buffer STD_LOGIC_VECTOR(7 downto 0);
		HEX1 : buffer STD_LOGIC_VECTOR(7 downto 0));
	end component;
	-- constants
	-- signals
	signal iSW_tb	: STD_LOGIC_VECTOR(3 downto 0);
	signal oHEX0_tb	: STD_LOGIC_VECTOR(7 downto 0);
	signal oHEX1_tb : STD_LOGIC_VECTOR(7 downto 0);

	-- https://github.com/wzab/wzab-hdl-library/blob/master/genlfsr_hs/sim2/genlfsr_tb.vhd#L55
	-- https://stackoverflow.com/questions/42105535/stop-vhdl-simulation-with-wait-statements
	signal simend : boolean := false; -- signal to end simulation, used to stop clock process
begin

	DUT : C4M1P2 port map (
		-- Input ports
		SW => iSW_tb,
		-- Output ports
		HEX0 => oHEX0_tb,
		HEX1 => oHEX1_tb);

	init : process
		-- variable declarations
	begin
		-- code that executes only once

		wait;
	end process init;

	always : process
	-- optional sensitivity list
	-- (        )
	-- variable declarations
	begin
		-- code executes for every event on sensitivity list
		wait for 0 ns;
		iSW_tb(3 downto 0) <= "0000";
		wait for 10 ns;
		iSW_tb(3 downto 0) <= "1001";
		wait for 10 ns;
		iSW_tb(3 downto 0) <= "1111";
		wait for 10 ns;
		simend <= true;
		wait for 2 ns;
		assert false report "Tests Complete" severity failure;
	end process always;
end architecture C4M1P2_arch;
