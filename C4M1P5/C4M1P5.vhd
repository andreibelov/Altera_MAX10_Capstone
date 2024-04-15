--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/3/24 10:23 PM
-- Design Name: C4M1P5.vhd
-- Module Name: C4M1P5
-- Project Name: Altera_MAX10_Capstone
-- Description: Four-bit Ripple Carry Adder Circuit
-- Additional Comments:
-- 	using-array-of-std-logic-vector-as-a-port-type
-- 	https://stackoverflow.com/questions/28468334/
-- 	fill-one-row-in-2d-array-outside-the-process-vhdl
-- 	https://stackoverflow.com/questions/25836462/25842592#25842592
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- use ieee.std_logic_arith.conv_std_logic_vector;

-- Entity port declaration
entity C4M1P5 is port (
	-- Input ports
	SW		: in std_logic_vector(9 downto 0);
	-- Output ports
	LEDR	: out std_logic_vector(9 downto 0);
	HEX5	: out std_logic_vector(7 downto 0);
	HEX3	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0);
	HEX0	: out std_logic_vector(7 downto 0));
end entity C4M1P5;

library work;
use work.C4M1P5_internal;

-- Architecture of the entity
architecture Structural of C4M1P5 is
	-- Creates an unconstrained array (MUST be constrained when defined!)
	type t_int_array is array (integer range <>) of integer range 0 to 9;
	type t_hex_array is array (integer range <>) of std_logic_vector(7 downto 0);
	-- IEEE Std 1076-1993 4.3.3 Alias declarations
	-- "An alias ... declares an alternate name for an existing named entity."
	alias A_input 	: std_logic_vector(3 downto 0) is SW(7 downto 4);
	alias B_input	: std_logic_vector(3 downto 0) is SW(3 downto 0);
	alias C_input	: std_logic is SW(8);

	signal iDIG 	: t_int_array(0 to 3) := (others => 0);
	signal oHEX 	: t_hex_array(0 to 3) := (others => (others => '0'));

begin

	HEX5 <= oHEX(3);
	HEX3 <= oHEX(2);
	HEX1 <= oHEX(1);
	HEX0 <= oHEX(0);

	LEDR(8 downto 0) <= (others => '0');

	internal : entity C4M1P5_internal(Behavioural)
		port map (
			Cin => C_input,
			A_input => A_input,
			B_input => B_input,
			ERR => LEDR(9),
			S0 => iDIG(0),
			S1 => iDIG(1),
			X_out => iDIG(3),
			Y_out => iDIG(2));

	-- Generate Statements
	segment:
		for i in 0 to 3 generate
			-- Component Instantiation Statements
			u : entity work.SEG7_LUT port map (
				iDIG => std_logic_vector(to_unsigned(iDIG(i), 4)),
				oSEG => oHEX(i));
		end generate;

end architecture Structural;
