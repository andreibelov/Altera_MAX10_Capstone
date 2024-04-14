--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/7/24 8:38 PM
-- Design Name: add4.vhd
-- Module Name: add4
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

LIBRARY work;

-- Entity port declaration
entity add4 is port (
	-- Input ports
	Cin		: in std_logic;
	A,B		: in std_logic_vector(3 downto 0);
	-- Output ports
	Cout	: out std_logic;
	Sum		: out std_logic_vector(3 downto 0));
end entity add4;

-- Structural Architecture of the add4 entity
architecture Structural of add4 is
	component Full_Adder is  port (
		A,B,Cin : in STD_LOGIC;
		S,Cout	: out STD_LOGIC);
	end component Full_Adder;
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
			u : Full_adder
			 port map (A => A(I), B => B(I), S => Sum(I),
				Cin => Carry_int(I), Cout => Carry_int(I + 1));
		end generate;
end architecture Structural; -- of add4

-- Architecture
Architecture RTL of Add4 is
  signal Out5bit : std_logic_vector(4 downto 0);
begin
	process(A, B, Cin)
		variable carry : STD_LOGIC := '0';
	begin
		carry := Cin; -- assign value to the variable inside the process
		for i in 0 to 3 loop
			Sum(i) <= A(i) xor B(i) xor carry;
			carry  := (A(i) and B(i)) or
			 		  (B(i) and carry) or
					  (carry and A(i));
		end loop;
		Cout <= carry;
	end process;
end Architecture RTL;