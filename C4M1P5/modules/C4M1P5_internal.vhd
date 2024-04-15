--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: andrei_belov
--
-- Create Date: 4/7/24 8:26 PM
-- Design Name: C4M1P5_internal.vhd
-- Module Name: C4M1P5_internal
-- Project Name: Altera_MAX10_Capstone
-- Description: Quartus Prime VHDL Template
-- Additional Comments:
--  vhdl-abcarry-in-creates-two-adders-instead-of-using-carry-in-in-the-existing
-- 	https://electronics.stackexchange.com/questions/254500/
--------------------------------------------------------------------------------

-- Use standard IEEE library
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

-- Entity port declaration
entity C4M1P5_internal is port (
	-- Input ports
	Cin			: in std_logic;
	A_input		: in std_logic_vector(3 downto 0);
	B_input		: in std_logic_vector(3 downto 0);
	-- Output ports
	ERR			: out std_logic := '0';
	S0,S1		: out integer range 0 to 9 := 0;
	X_out,Y_out	: out integer range 0 to 9 := 0);
end entity C4M1P5_internal;

architecture Behavioural of C4M1P5_internal is
	signal A_err : boolean := false;
	signal B_err : boolean := false;
	signal A 	 : integer range 0 to 15 := 0;
	signal B	 : integer range 0 to 15 := 0;
begin
	A <= to_integer(unsigned(A_input));
	B <= to_integer(unsigned(B_input));

	A_err <= (A > 9);
	B_err <= (B > 9);

	ERR <= '1' when (A_err OR B_err) else '0';

	X_out <= 8 when (A > 9) else A;
	Y_out <= 8 when (B > 9) else B;

	-- Since VHDL allows inputs to be represented as integers,
	-- we can define the required size of inputs A and B and
	-- compare them using IF statements
	process(A, B, Cin)
		variable T0 : integer range 0 to 31 := 0;
		variable Z0 : integer range 0 to 10 := 0;
		variable C1 : integer range 0 to 1  := 0;

		variable a_r, b_r : unsigned(5 downto 0) := "000000";
		variable tmp	  : unsigned(5 downto 0) := "000000";
	begin
-- 		T0 := A + B + to_integer('0' & Cin);
-- 		T0 := to_integer(unsigned(A_input) + unsigned(B_input) + ('0' & Cin));

		a_r := '0' & unsigned(A_input) & '1';
		b_r := '0' & unsigned(B_input) & Cin;
		tmp := a_r + b_r;
		T0  := to_integer(tmp(5 downto 1));
		if (T0 > 9) then
			Z0 := 10;
			C1 := 1;
		else
			Z0 := 0;
			C1 := 0;
		end if;

		if (T0 > 19) then
			S0 <= 8;
			S1 <= 8;
		else
			S0 <= (T0 - Z0);
			S1 <= C1;
		end if;

	end process;

end architecture Behavioural; -- of C4M1P5_internal
