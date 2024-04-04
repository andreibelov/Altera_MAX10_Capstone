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
use ieee.std_logic_unsigned.all;

-- Entity port declaration
entity C4M1P3_internal is port (
	-- Input ports
	Cin		: in std_logic;
	A,B		: in std_logic_vector(3 downto 0);
	-- Output ports
	Cout	: out std_logic;
	S		: out std_logic_vector(3 downto 0));
end entity C4M1P3_internal;

-- Behavioural Architecture of the C4M1P3 entity
architecture Behavioural of C4M1P3_internal is
	-- Commonly declared signals
	signal Out5bit : std_logic_vector(4 downto 0);
begin
	Out5bit <= ('0' & A) + ('0' & B) + Cin;
	S       <= Out5bit(3 downto 0);        -- 4 bits
	Cout    <= Out5bit(4);                 -- 5th bit
end architecture Behavioural;

-- Structural Architecture of the C4M1P3 entity
architecture Structural of C4M1P3_internal is
	-- Commonly declared signals
	signal Cout_int : std_logic_vector(2 downto 0);
begin

	-- Component Instantiation Statements
	u0 : entity work.Full_adder(Mux)
			port map (
    			Cin => Cin,
    			A => A(0),
    			B => B(0),
    			Cout => Cout_int(0),
    			S => S(0));

	u1 : entity work.Full_adder(Mux)
			port map (
    			Cin => Cout_int(0),
    			A => A(1),
    			B => B(1),
    			Cout => Cout_int(1),
    			S => S(1));

	u2 : entity work.Full_adder(Mux)
			port map (
    			Cin => Cout_int(1),
    			A => A(2),
    			B => B(2),
    			Cout => Cout_int(2),
    			S => S(2));

	u3 : entity work.Full_adder(Mux)
			port map (
    			Cin => Cout_int(2),
    			A => A(3),
    			B => B(3),
    			Cout => Cout,
    			S => S(3));

end architecture Structural;

-- Use standard IEEE library
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

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
end architecture Structural;
