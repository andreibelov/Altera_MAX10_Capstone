--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/4/24 4:23 AM
-- Design Name: Full_adder.vhd
-- Module Name: Full_adder
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity port declaration
entity Full_adder is port (
	-- Input ports
	A,B,Cin : in std_logic;
	-- Output ports
	S,Cout	: out std_logic);
end entity Full_adder;

-- Architecture of the Full_adder entity
architecture Selected of Full_adder is
	-- Commonly declared signals
	signal bac		: std_logic_vector(2 downto 0);
	signal Out2bit	: std_logic_vector(1 downto 0);
begin

	-- Selected Signal Assignment
	with bac select
		Out2bit <= 	"00" when "000",
					"01" when "001",
					"01" when "010",
					"10" when "011",
					"01" when "100",
					"10" when "101",
					"10" when "110",
					"11" when "111",
					"00" when others;

	-- Concurrent Signal Assignment
	bac <= B & A & Cin;
	S <= Out2bit(0);
	Cout <= Out2bit(1);
end architecture Selected;

architecture Behavioural of Full_Adder is

begin
    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end Behavioural;

-- Architecture of the Full_adder entity
architecture Behavioural1 of Full_adder is
	-- Commonly declared signals
	signal XOR_AB 		 : std_logic;
  	constant O  		 : std_logic := '0';
begin

	-- Selected Signal Assignment
	with XOR_AB select
		Cout <= B when '0',
			  Cin when '1',
			  	O when others;

	-- Concurrent Signal Assignment
	XOR_AB <= A xor B;
	S <= Cin xor XOR_AB;
end architecture Behavioural1;

-- Architecture of the Full_adder entity
architecture Behavioural2 of Full_adder is
	-- Commonly declared signals
	signal Out2bit : std_logic_vector(1 downto 0);
begin
	-- Concurrent Signal Assignment
	Out2bit <= ('0' & A) + ('0' & B) + Cin;
	S       <= Out2bit(0);
	Cout    <= Out2bit(1);
end architecture Behavioural2;
