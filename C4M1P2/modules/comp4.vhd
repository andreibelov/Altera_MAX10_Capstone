--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/6/24 7:28 PM
-- Design Name: comp4.vhd
-- Module Name: comp4
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
-- 	Made with CLion
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity port declaration
entity comp4 is port (
	A, B			 :  in  std_logic_vector(3 downto 0) := (others => '0');
	AEB				 :  out  std_logic_vector(3 downto 0);
	AEQB, AGTB, ALTB :  out  std_logic);
end entity comp4;

-- Architecture of the entity
architecture Behavioural of comp4 is
	signal Aint, Bint : INTEGER RANGE 0 TO 15;
	-- Signals with no default value
	signal compare : std_logic_vector (2 downto 0);
begin

	-- Conditional Signal Assignmens
	compare <=
		"001" when (Aint < Bint) else
		"010" when (Aint = Bint) else
		"100" when (Aint > Bint) else
		"000";

	-- Concurrent Signal Assignments
	Aint <= to_integer(unsigned(A));
	Bint <= to_integer(unsigned(B));
	AGTB <= compare(2);
	AEQB <= compare(1);
	ALTB <= compare(0);
end architecture Behavioural; -- of comp4

-- Architecture of the entity
architecture Structural of comp4 is

	-- Declarations
	component p8mcompb port (
		A7, A6, A5, A4, A3, A2, A1, A0 					:  IN  STD_LOGIC := '0';
		B7, B6, B5, B4, B3, B2, B1, B0 					:  IN  STD_LOGIC := '0';
		AEB7, AEB6, AEB5, AEB4, AEB3, AEB2, AEB1, AEB0 	:  OUT  STD_LOGIC;
		AEQB, AGTB, ALTB 								:  OUT  STD_LOGIC);
	end component p8mcompb;
	-- Commonly declared signals

begin
	-- Component Instantiation Statements
	u0: p8mcompb
		port map (
			A3 => A(3), A2 => A(2), A1 => A(1), A0 => A(0),
			B3 => B(3), B2 => B(2), B1 => B(1), B0 => B(0),
			AEB3 => AEB(3), AEB2 => AEB(2), AEB1 => AEB(1), AEB0 => AEB(0),
			AEQB => AEQB, AGTB => AGTB, ALTB => ALTB);

end architecture Structural; -- of comp4

-- Architecture of the entity
architecture Structural2 of comp4 is
	-- Commonly declared signals
	component comp8 port (
		-- Input ports
		A, B :  IN  std_logic_vector(7 downto 0);
		-- Output ports
		AEB	 :  OUT  std_logic_vector(7 downto 0);
		AEQB, AGTB, ALTB :  OUT  STD_LOGIC);
	end component comp8;
begin
	-- Component Instantiation Statements
	-- To instantiate an entity directly, the entity must be written in VHDL.
	-- <instance_name>: entity <library>.<entity_name>(<architecture_name>)
	u0: entity work.comp8
		port map (
			A(3 downto 0) => A,
			B(3 downto 0) => B,
			AEB(3 downto 0) => AEB,
			AEQB => AEQB, AGTB => AGTB, ALTB => ALTB);

end architecture Structural2; -- of comp4
