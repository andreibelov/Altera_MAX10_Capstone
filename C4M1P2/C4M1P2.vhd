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
	u0 : work.C4M1P2_internal(Structural)
		port map (
			SW => SW,
			HEX0 => HEX0,
			HEX1 => HEX1);
end architecture Structural;
