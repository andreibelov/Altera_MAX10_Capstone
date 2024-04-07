--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/3/24 10:23 PM
-- Design Name: C4M1P3.vhd
-- Module Name: C4M1P3
-- Project Name: Altera_MAX10_Capstone
-- Description: Four-bit Ripple Carry Adder Circuit
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
library work;
use ieee.std_logic_1164.all;

-- Entity port declaration
entity C4M1P3 is port (
	-- Input ports
	SW		: in std_logic_vector(9 downto 0);
	-- Output ports
	LEDR	: out std_logic_vector(9 downto 0));
end entity C4M1P3;

-- Architecture of the entity
architecture Structural of C4M1P3 is
begin
	u0 : entity work.C4M1P3_internal(Structural)
		port map (
			Cin => SW(8),
			A => SW(7 downto 4),
			B => SW(3 downto 0),
			Cout => LEDR(4),
			S => LEDR(3 downto 0));
end architecture Structural; -- of C4M1P3
