--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/7/24 8:26 PM
-- Design Name: C4M1P4_internal.vhd
-- Module Name: C4M1P4_internal
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.all;

-- Entity port declaration
entity C4M1P4_internal is port (
	-- Input ports
	Cin		: in std_logic;
	X,Y		: in std_logic_vector(3 downto 0);
	-- Output ports
	LEDR	: out std_logic_vector(9 downto 0);
	HEX		: out std_logic_vector(31 downto 0));
end entity C4M1P4_internal;

-- Structural Architecture of the C4M1P4 entity
architecture Structural of C4M1P4_internal is
	-- Creates an unconstrained array (MUST be constrained when defined!)
	type t_vector_array is array (integer range <>) of std_logic_vector(3 downto 0);
	type t_hex_array is array (integer range <>) of std_logic_vector(7 downto 0);

	signal iDIG 	: t_vector_array(0 to 3) := (others => (others => '0'));
	signal oHEX 	: t_hex_array(0 to 3) := (others => (others => '0'));

	signal ERR	 	: std_logic;
	signal SGTB 	: std_logic;
	signal SLTB 	: std_logic;
	signal XGTB 	: std_logic;
	signal YGTB 	: std_logic;
	signal A		: std_logic_vector(4 downto 0);
	signal T		: std_logic_vector(9 downto 0) := (others => '0');
	signal Sum		: std_logic_vector(4 downto 0);
	constant comp	: std_logic_vector(4 downto 0) := "01001";
	constant max	: std_logic_vector(4 downto 0) := "10100";
begin

	iDIG(3) <= 	X when (XGTB = '0') else "1111";
	iDIG(2) <= 	Y when (YGTB = '0') else "1111";
	iDIG(1)	<=	"0001" when ((SGTB = '1') AND (SLTB = '1')) else
				"1000" when ((SLTB = '0') OR  (ERR = '1')) else
	 			"0000";
	iDIG(0) <= 	A(3 downto 0) when ((SLTB = '1') AND (SGTB = '1')) else
				Sum(3 downto 0) when ((SLTB = '1') AND (SGTB = '0')) else
				"1000";
	A <= std_logic_vector(unsigned(Sum) - 10);

	LEDR(9) <= '1' when (ERR = '1') else '0';

	ERR <= XGTB OR YGTB;

	-- Component Instantiation Statements
	u1 : entity work.comp8(Behavioural)
		port map (
            A(7 downto 4) => (others => '0'),
			A(3 downto 0) => X,
            B(7 downto 4) => (others => '0'),
		 	B(3 downto 0) => comp(3 downto 0),
		 	AGTB => XGTB);

	u2 : entity work.comp8(Behavioural)
		port map (
            A(7 downto 4) => (others => '0'),
			A(3 downto 0) => Y,
            B(7 downto 4) => (others => '0'),
			B(3 downto 0) => comp(3 downto 0),
			AGTB => YGTB);

	u3 : entity work.comp8(Behavioural)
		port map (
            A(7 downto 5) => (others => '0'),
            A(4 downto 0) => Sum,
            B(7 downto 5) => (others => '0'),
		 	B(4 downto 0) => comp, AGTB => SGTB);

	u4 : entity work.comp8(Behavioural)
		port map (
            A(7 downto 5) => (others => '0'),
            A(4 downto 0) => Sum,
            B(7 downto 5) => (others => '0'),
            B(4 downto 0) => max,
            ALTB => SLTB);

	u0 : entity work.add4(RTL)
		port map (
			Cin => Cin,
			A => X,
			B => Y,
			Cout => Sum(4),
			Sum => Sum(3 downto 0));

	-- Generate Statements
	segment:
		for i in 0 to 3 generate
			-- Component Instantiation Statements
			u : entity work.SEG7_LUT
				port map (iDIG => iDIG(i), oSEG => oHEX(i));
		end generate;

	combine : for i in 0 to 3 generate
		HEX((8*(i+1))-1 downto 8*i) <= oHEX(i);
	end generate;
end architecture Structural;
