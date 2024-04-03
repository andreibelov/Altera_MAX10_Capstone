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
	HEX0	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0));
end entity C4M1P2;

-- Architecture of the entity
architecture arch of C4M1P2 is
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
	A(2) <= SW(3) and SW(2) and SW(1);
	A(1) <= SW(3) and SW(2) and not(SW(1));
	A(0) <= (SW(3) and SW(2) and SW(0)) or (SW(3) and SW(1) and SW(0));

	-- Selected Signal Assignment
	-- The selected signal assignment (with <expr> select ...) is essentially
	-- a short-hand notion for creating a process along with the appropriate
	-- sensitivity list and case statement.
	with z select
		iDIG0 <= V when '0',
				 A when '1',
			"0000" when others;

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

end architecture arch;
