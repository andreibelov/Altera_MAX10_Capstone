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


-- Architecture of the Full_adder entity
-- www.physicsteacher.in/2023/07/14/full-adder-using-two-4-is-to-1-multiplexer/
-- #logic-circuit-for-the-full-adder-using-two-41-multiplexer
architecture Mux of Full_adder is
	-- Commonly declared signals
	signal NOTA		: std_logic;
	signal in2bit	: std_logic_vector(1 downto 0);
  	constant O  	: std_logic := '0';
  	constant I  	: std_logic := '1';
begin

	-- Selected Signal Assignment
	-- Selected Signal Assignment
	with in2bit select
		S <= A	  when "00",
			 NOTA when "01",
			 NOTA when "10",
			 A    when "11",
			 O    when others;

	with in2bit select
		Cout <= O when "00",
			 	A when "01",
			 	A when "10",
			    I when "11",
			 	O when others;
	-- Concurrent Signal Assignment
	in2bit <= (B & Cin);
	NOTA <= not A;
end architecture Mux;

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
	Cin		: in std_logic;
	A,B		: in std_logic_vector(3 downto 0);
	-- Output ports
	Cout	: out std_logic;
	S		: out std_logic_vector(3 downto 0));
end entity C4M1P3;

-- Architecture of the entity
architecture Structural of C4M1P3 is
begin
	u0 : entity work.C4M1P3_internal(Structural)
		port map (
			Cin => Cin,
			A => A,
			B => B,
			Cout => Cout,
			S => S);
end architecture Structural;
