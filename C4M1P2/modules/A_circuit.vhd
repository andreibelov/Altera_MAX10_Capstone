--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/6/24 7:32 PM
-- Design Name: A_circuit.vhd
-- Module Name: A_circuit
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Entity port declaration
entity A_circuit is port (
	-- Input ports
	V :  IN  std_logic_vector(3 downto 0);
	-- Output ports
	A :  OUT  std_logic_vector(3 downto 0));
end entity A_circuit;

-- Architecture of the entity
architecture Behavioural of A_circuit is

	-- Declarations

	-- Signals with no default value

begin

	-- Concurrent Signal Assignment
	A(3) <= '0';
	A(2) <= (V(3) and V(2) and (    V(1)));
	A(1) <= (V(3) and V(2) and (not V(1)));
	A(0) <= (V(3) and V(2) and 					V(0)) or
	 		(V(3) and 				V(1) and 	V(0));
end architecture Behavioural; -- of A_circuit
