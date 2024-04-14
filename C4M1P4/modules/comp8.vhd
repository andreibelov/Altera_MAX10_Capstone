--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/6/24 11:10 PM
-- Design Name: comp8.vhd
-- Module Name: comp8
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_misc.all;

LIBRARY work;

entity comp8 is port (
	-- Input ports
	A, B :  IN  std_logic_vector(7 downto 0);
	-- Output ports
	AEB	 :  OUT  std_logic_vector(7 downto 0);
	AEQB, AGTB, ALTB :  OUT  STD_LOGIC);
END comp8;

architecture Behavioural of comp8 is

	component soft port(
		a_in : in std_logic;
		a_out : out std_logic);
	end component;

	SIGNAL	AXNORB :  std_logic_vector(7 downto 0);
	SIGNAL	AND_AXNORB :  std_logic_vector(7 downto 0);
	SIGNAL	SOFT_AXNORB :  std_logic_vector(7 downto 0);

begin
	-- Concurrent Signal Assignments
	AEB <= SOFT_AXNORB;

	AXNORB <= NOT(A XOR B);

	AEQB <= AND_REDUCE(SOFT_AXNORB(7 downto 0));
	ALTB <= OR_REDUCE((NOT(A) AND B) AND AND_AXNORB);
	AGTB <= OR_REDUCE((NOT(B) AND A) AND AND_AXNORB);

	AND_AXNORB(7) <= '1';
	AND_AXNORB(6) <= AND_AXNORB(7) AND SOFT_AXNORB(7);
	AND_AXNORB(5) <= AND_AXNORB(6) AND SOFT_AXNORB(6);
	AND_AXNORB(4) <= AND_AXNORB(5) AND SOFT_AXNORB(5);
	AND_AXNORB(3) <= AND_AXNORB(4) AND SOFT_AXNORB(4);
	AND_AXNORB(2) <= AND_AXNORB(3) AND SOFT_AXNORB(3);
	AND_AXNORB(1) <= AND_AXNORB(2) AND SOFT_AXNORB(2);
	AND_AXNORB(0) <= AND_AXNORB(1) AND SOFT_AXNORB(1);

	-- Generate Statements
	gen_soft:
		for I in 0 to 7 generate
			-- Component Instantiation Statements
			uX : soft
				port map (A_IN => AXNORB(I), A_OUT => SOFT_AXNORB(I));
		end generate;

end architecture Behavioural; -- of comp8
