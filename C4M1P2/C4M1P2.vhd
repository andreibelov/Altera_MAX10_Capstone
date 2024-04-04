--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/1/24 7:58 PM
-- Design Name: C4M1P2.vhd
-- Module Name: C4M1P2
-- Project Name: Altera_MAX10_Capstone
-- Description: wrap all the VHDL in a single-entity-single-arch (VHDL) wrapper
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
	HEX0	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0));
end entity C4M1P2;

-- Architecture of the entity
architecture Structural of C4M1P2 is
begin
	u0 : work.C4M1P2_internal(Behavioural)
		port map (
			SW => SW,
			HEX0 => HEX0,
			HEX1 => HEX1);
end architecture Structural;

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity port declaration
entity C4M1P2_internal is port (
	-- Input ports
	SW		: in std_logic_vector(3 downto 0);
	-- Output ports
	HEX0	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0));
end entity C4M1P2_internal;

-- Architecture of the entity
architecture Behavioural of C4M1P2_internal is

	type lut_array is array (0 to 15) of std_logic_vector(7 downto 0);

	-- Commonly declared signals
	signal z	: std_logic;
	signal A	: std_logic_vector(3 downto 0);
	signal V	: std_logic_vector(3 downto 0);
	signal D0	: std_logic_vector(3 downto 0);
	signal D1	: std_logic_vector(3 downto 0) := "0000";
	constant O  : std_logic_vector(3 downto 0) := "0000";
	constant lut_data : lut_array := (
			"11000000", -- 0b0000
			"11111001", -- 0b0001
			"10100100", -- 0b0010
			"10110000", -- 0b0011
			"10011001", -- 0b0100
			"10010010", -- 0b0101
			"10000010", -- 0b0110
			"11111000", -- 0b0111
			"10000000", -- 0b1000
			"10011000", -- 0b1001
			"10001000", -- 0b1010
			"10000011", -- 0b1011
			"11000110", -- 0b1100
			"10100001", -- 0b1101
			"10000110", -- 0b1110
			"10001110" -- 0b1111
			);
begin

	-- Concurrent Signal Assignment
	V <= SW(3 downto 0);
	z <= (V(3) and V(2)) or (V(3) and V(1));

	D1(0) <= z;

	A(3) <= '0';
	A(2) <= (V(3) and V(2) and (    V(1)));
	A(1) <= (V(3) and V(2) and (not V(1)));
	A(0) <= (V(3) and V(2) and V(0)) or
	 		(V(3) and V(1) and V(0));

	with z select
		D0 <= V when '0',
			  A when '1',
			  O when others;

	HEX0 <= lut_data(to_integer(unsigned(D0)));
	HEX1 <= lut_data(to_integer(unsigned(D1)));

end architecture Behavioural;

-- Architecture of the entity
architecture Structural of C4M1P2_internal is
	-- Commonly declared signals
	signal z		: std_logic;
	signal A		: std_logic_vector(3 downto 0);
	signal V		: std_logic_vector(3 downto 0);
	signal oHEX0	: std_logic_vector(7 downto 0);
	signal oHEX1	: std_logic_vector(7 downto 0);
	signal iDIG0	: std_logic_vector(3 downto 0);
	signal iDIG1	: std_logic_vector(3 downto 0) := "0000";
begin
	-- Concurrent Signal Assignment
	V <= SW(3 downto 0);
	z <= (V(3) and V(2)) or (V(3) and V(1));

	iDIG1(0) <= z;

	A(3) <= '0';
	A(2) <= (V(3) and V(2) and (    V(1)));
	A(1) <= (V(3) and V(2) and (not V(1)));
	A(0) <= (V(3) and V(2) and V(0)) or
	 		(V(3) and V(1) and V(0));

	-- Selected Signal Assignment
	-- The selected signal assignment (with <expr> select ...) is essentially
	-- a short-hand notion for creating a process along with the appropriate
	-- sensitivity list and case statement.
	with z select
		iDIG0 <= V when '0',
				 A when '1',
			"0000" when others;

	-- Component Instantiation Statements
	u0 : work.SEG7_LUT
		port map (
			iDIG => iDIG0,
			oSEG => oHEX0);

	u1 : work.SEG7_LUT
		port map (
			iDIG => iDIG1,
			oSEG => oHEX1);

	HEX0 <= oHEX0;
	HEX1 <= oHEX1;

end architecture Structural;
