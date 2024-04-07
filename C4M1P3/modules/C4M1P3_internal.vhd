--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/7/24 7:25 AM
-- Design Name: C4M1P3_internal.vhd
-- Module Name: C4M1P3_internal
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
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
	signal Carry_int : std_logic_vector(4 downto 0);
begin
	-- Concurrent Signal Assignment
	Carry_int(0) <= Cin;
	Cout <= Carry_int(4);

	-- Generate Statements
	adder:
		for I in 0 to 3 generate
			-- Component Instantiation Statements
			u : entity work.Full_adder(Behavioural)
			 port map (A => A(I), B => B(I), S => S(I),
				Cin => Carry_int(I), Cout => Carry_int(I + 1));
		end generate;

	-- Component Instantiation Statements
-- 	u0 : entity work.Full_adder(Behavioural)
-- 			port map (Cin => Cin, A => A(0), B => B(0), Cout => Cout_int(0), S => S(0));
--
-- 	u1 : entity work.Full_adder(Behavioural)
-- 			port map (Cin => Cout_int(0), A => A(1), B => B(1), Cout => Cout_int(1), S => S(1));
--
-- 	u2 : entity work.Full_adder(Behavioural)
-- 			port map (Cin => Cout_int(1), A => A(2), B => B(2), Cout => Cout_int(2), S => S(2));
--
-- 	u3 : entity work.Full_adder(Behavioural)
-- 			port map (Cin => Cout_int(2), A => A(3), B => B(3), Cout => Cout, S => S(3));

end architecture Structural;

-- Structural Architecture of the C4M1P3 entity
architecture Structural2 of C4M1P3_internal is
	component Full_Adder is  port (
		A,B,Cin : in STD_LOGIC;
		S,Cout	: out STD_LOGIC);
	end component Full_Adder;
	-- Commonly declared signals
	signal Cout_int : std_logic_vector(2 downto 0);
begin
	-- Component Instantiation Statements
	u0 : Full_adder port map (
		Cin => Cin, A => A(0), B => B(0), Cout => Cout_int(0), S => S(0));

	u1 : Full_adder port map (
		Cin => Cout_int(0), A => A(1), B => B(1), Cout => Cout_int(1), S => S(1));

	u2 : Full_adder port map (
		Cin => Cout_int(1), A => A(2), B => B(2), Cout => Cout_int(2), S => S(2));

	u3 : Full_adder port map (
		Cin => Cout_int(2), A => A(3), B => B(3), Cout => Cout, S => S(3));
end architecture Structural2;

-- Configuration declaration
configuration C4M1P3_internal_Config of C4M1P3_internal is
    for Structural2  -- Specify which architecture to use
        for all : Full_adder
            use entity work.Full_adder(Mux);
        end for;
    end for;
end configuration C4M1P3_internal_Config;
