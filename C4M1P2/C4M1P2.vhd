--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/1/24 7:58 PM
-- Design Name: C4M1P2.vhd
-- Module Name: C4M1P2
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Your VHDL code should not include any IF-ELSE, CASE, or similar statements.
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity port declaration
entity C4M1P2 is port (
	-- Input ports
	SW		: in std_logic_vector(3 downto 0);
	-- Output ports
	HEX0	: out std_logic_vector(6 downto 0);
	HEX1	: out std_logic_vector(6 downto 0));
end entity C4M1P2;

-- Architecture of the entity
architecture arch of C4M1P2 is
	-- Commonly declared signals
	signal z	: std_logic;
	signal A	: std_logic_vector(3 downto 0);
	signal V	: std_logic_vector(3 downto 0);
	signal D0	: std_logic_vector(3 downto 0);
	signal D1	: std_logic_vector(3 downto 0) := "0000";
	type lut_array is array (0 to 15) of std_logic_vector(6 downto 0);
	constant lut_data : lut_array := (
			"1000000", -- 0b0000
			"1111001", -- 0b0001
			"0100100", -- 0b0010
			"0110000", -- 0b0011
			"0011001", -- 0b0100
			"0010010", -- 0b0101
			"0000010", -- 0b0110
			"1111000", -- 0b0111
			"0000000", -- 0b1000
			"0011000", -- 0b1001
			"0001000", -- 0b1010
			"0000011", -- 0b1011
			"1000110", -- 0b1100
			"0100001", -- 0b1101
			"0000110", -- 0b1110
			"0001110" -- 0b1111
		);
begin

	-- Concurrent Signal Assignment
	V <= SW(3 downto 0);
	z <= (V(3) and V(2)) or (V(3) and V(1));

	D1(0) <= z;

	A <= std_logic_vector(to_unsigned(to_integer(unsigned(V)) mod 10, 4));

	D0(0) <= (V(0) and (not z)) or (A(0) and z);
	D0(1) <= (V(1) and (not z)) or (A(1) and z);
	D0(2) <= (V(2) and (not z)) or (A(2) and z);
	D0(3) <= (V(3) and (not z)) or (A(3) and z);

	HEX0 <= lut_data(to_integer(unsigned(D0)));
	HEX1 <= lut_data(to_integer(unsigned(D1)));

end architecture arch;
