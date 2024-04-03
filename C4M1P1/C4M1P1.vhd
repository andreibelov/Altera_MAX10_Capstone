--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/1/24 12:13 AM
-- Design Name: C4M1P1.vhd
-- Module Name: C4M1P1
-- Project Name: Altera_MAX10_Capstone
-- Description: NUMBERS AND DISPLAYS
-- Additional Comments:
-- 	values denoted by SW7-4 and SW3-0 to be displayed on HEX1 and HEX0
--  circuit should display the digits from 0 to 9,
--  and treat the valuations 1010 to 1111 as don’t-cares
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity port declaration
entity C4M1P1 is port (
	-- Input ports
	SW		: in std_logic_vector(9 downto 0);
	-- Output ports
	HEX0	: out std_logic_vector(7 downto 0);
	HEX1	: out std_logic_vector(7 downto 0));
end entity C4M1P1;

-- Architecture of the entity
architecture rtl of C4M1P1 is

	-- Declarations
	
	-- A component declaration declares the interface of an entity or
	-- a design unit written in another language.
	
	component SEG7_LUT port (
		-- Input ports
		iDIG	: in std_logic_vector(3 downto 0);
		-- Output ports
		oSEG	: out std_logic_vector(6 downto 0));
	end component SEG7_LUT;

	-- Commonly declared signals
	-- values denoted by SW7-4 and SW3-0 to be displayed on HEX1 and HEX0
	alias iDIG1 : std_logic_vector(3 downto 0) is SW(7 downto 4);
	alias iDIG0 : std_logic_vector(3 downto 0) is SW(3 downto 0);
	alias oHEX0 : std_logic_vector(6 downto 0) is HEX0(6 downto 0);
	alias oHEX1 : std_logic_vector(6 downto 0) is HEX1(6 downto 0);
begin


-- std_logic_1164 package defines the value '-' -- Don't care for std_ulogic.
-- This looks like it is the semantically correct choice for
-- an explicit "don't care".
--
-- Modelsim uses the value 'X' to display undefined signals.

-- TYPE std_ulogic IS ( 'U',  -- Uninitialized
--                      'X',  -- Forcing  Unknown
--                      '0',  -- Forcing  0
--                      '1',  -- Forcing  1
--                      'Z',  -- High Impedance
--                      'W',  -- Weak     Unknown
--                      'L',  -- Weak     0
--                      'H',  -- Weak     1
--                      '-'   -- Don't care
--                    );
	HEX0(7) <= '1';
	HEX1(7) <= '1';

--  circuit should display the digits from 0 to 9,
--  and treat the valuations 1010 to 1111 as don’t-cares
-- 	SEG7_LUT1: DIG1 <=
--     	iDIG1 when ((iDIG1 >= b"0000") and (iDIG1 < b"1010")) else
--     	b"----";
--
-- 	SEG7_LUT1: DIG0 <=
--     	iDIG1 when ((iDIG0 >= b"0000") and (iDIG0 < b"1010")) else
--     	b"----";

	-- Selected Signal Assignment
	-- The selected signal assignment (with <expr> select ...) is essentially
	-- a short-hand notion for creating a process along with the appropriate
	-- sensitivity list and case statement.

	-- Component Instantiation Statement
	u0 : SEG7_LUT
		port map (
			iDIG => iDIG0,
			oSEG => oHEX0);

	u1 : SEG7_LUT
		port map (
			iDIG => iDIG1,
			oSEG => oHEX1);

end architecture rtl;
