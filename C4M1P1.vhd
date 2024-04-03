--------------------------------------------------------------------------------
-- Class: EE 271
-- Author: Andrei Belov
--
-- Create Date: 02/02/2024 01:04:13 AM
-- Design Name: data_reg.vhd
-- Module Name: Data_Reg
-- Project Name: vhdl_basics
-- Description: simple Data_Reg implementation
-- Additional Comments:
--
--------------------------------------------------------------------------------

-- Entity
entity C4M1P1 is port (
  i_clk             : in  std_logic;
  i_data            : in  std_logic_vector(7 downto 0);
  o_parity          : out std_logic);
end entity C4M1P1;

-- Architecture
architecture rtl of C4M1P1 is begin
end architecture rtl;
