--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/3/24 10:23 PM
-- Design Name: C4M1P4.vhd
-- Module Name: C4M1P4
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
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity port declaration
entity C4M1P4 is port (
	-- Input ports
	SW		: in std_logic_vector(8 downto 0);
	-- Output ports
	LEDR	: out std_logic_vector(9 downto 0);
	HEX5	: out std_logic_vector(7 downto 0);
	HEX3	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0);
	HEX0	: out std_logic_vector(7 downto 0));
end entity C4M1P4;



-- Architecture of the entity
architecture Structural of C4M1P4 is
	component C4M1P4_internal port (
		-- Input ports
		Cin		: in std_logic;
		X,Y		: in std_logic_vector(3 downto 0);
		-- Output ports
		LEDR	: out std_logic_vector(9 downto 0);
		HEX		: out std_logic_vector(31 downto 0));
	end component C4M1P4_internal;
	signal HEX	: std_logic_vector(31 downto 0);
begin

	HEX5 <= HEX(31 downto 24);
	HEX3 <= HEX(23 downto 16);
	HEX1 <= HEX(15 downto 8);
	HEX0 <= HEX( 7 downto 0);

	u0 : C4M1P4_internal
		port map (
			Cin => SW(8),
			X => SW(7 downto 4),
			Y => SW(3 downto 0),
			LEDR => LEDR,
			HEX => HEX);
end architecture Structural;
