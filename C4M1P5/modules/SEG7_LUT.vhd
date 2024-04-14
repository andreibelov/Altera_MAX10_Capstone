library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity SEG7_LUT is port(
    iDIG	: in STD_LOGIC_VECTOR (3 downto 0);
    oSEG	: out STD_LOGIC_VECTOR(7 downto 0));
end entity SEG7_LUT;

architecture conversion of SEG7_LUT is
begin
	WITH iDIG SELECT
		oSEG <= "11000000" WHEN "0000",
				"11111001" WHEN "0001",
				"10100100" WHEN "0010",
				"10110000" WHEN "0011",
				"10011001" WHEN "0100",
				"10010010" WHEN "0101",
				"10000010" WHEN "0110",
				"11111000" WHEN "0111",
				"10000000" WHEN "1000",
				"10011000" WHEN "1001",
				"10000000" WHEN others;
-- 				"10111111" WHEN others;
-- 				"01110111" WHEN others;

end architecture conversion;
