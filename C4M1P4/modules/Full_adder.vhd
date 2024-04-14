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

LIBRARY work;

-- Entity port declaration
entity Full_adder is port (
	-- Input ports
	A,B,Cin : in std_logic;
	-- Output ports
	S,Cout	: out std_logic);
end entity Full_adder;

architecture Behavioural of Full_Adder is
begin
    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end Behavioural; -- of Full_adder
