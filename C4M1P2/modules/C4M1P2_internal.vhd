--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/6/24 6:50 PM
-- Design Name: C4M1P2_internal.vhd
-- Module Name: C4M1P2_internal
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

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


library work;
use work.all;

-- Structural Architecture of the entity
architecture Structural of C4M1P2_internal is

	-- Creates an unconstrained array (MUST be constrained when defined!)
	type t_vector_array is array (integer range <>) of std_logic_vector(3 downto 0);
	type t_hex_array is array (integer range <>) of std_logic_vector(7 downto 0);

	signal iDIG : t_vector_array(0 to 1) := (others => (others => '0'));
	signal oHEX : t_hex_array(0 to 1) := (others => (others => '0'));
	signal unused : std_logic_vector(3 downto 0);

	-- Signals with no default value
	signal z		: std_logic;
	signal A		: std_logic_vector(3 downto 0);
	signal V		: std_logic_vector(3 downto 0);

	constant comp	: std_logic_vector(3 downto 0) := "1001";
	constant O		: std_logic_vector(3 downto 0) := "1001";

begin


	-- Convert integer to std_logic_vector
-- 	comp <= std_logic_vector(to_unsigned(9, comp'length));

	-- Selected Signal Assignment
	-- The selected signal assignment (with <expr> select ...) is essentially
	-- a short-hand notion for creating a process along with the appropriate
	-- sensitivity list and case statement.
	with z select
		iDIG(0) <=	V when '0',
				 	A when '1',
					O when others;

	-- Concurrent Signal Assignment
	iDIG(1)(0) <= z;

	V <= SW(3 downto 0);
	HEX0 <= oHEX(0);
	HEX1 <= oHEX(1);

	-- Component Instantiation Statements
	u1 : entity work.A_circuit
		port map (V => V, A => A);

	-- Ports parts associated individually should in contiguous sequence.
	u0: entity work.comp8
		port map (
			A(7 downto 4) => (others => '0'),
			A(3 downto 0) => V,
			B(7 downto 4) => (others => '0'),
			B(3 downto 0) => comp,
			AGTB => z);

	-- Generate Statements
	segment:
		for I in 0 to 1 generate
			-- Component Instantiation Statements
			u : entity work.SEG7_LUT
				port map (iDIG => iDIG(I), oSEG => oHEX(I));
		end generate;

end architecture Structural;