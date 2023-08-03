-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity costasloop_stub is
  port (
    i : in std_logic_vector( 16-1 downto 0 );
    r : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    ii : out std_logic_vector( 24-1 downto 0 );
    rr : out std_logic_vector( 24-1 downto 0 )
  );
end costasloop_stub;
architecture structural of costasloop_stub is 
begin
  sysgen_dut : entity xil_defaultlib.costasloop 
  port map (
    i => i,
    r => r,
    clk => clk,
    ii => ii,
    rr => rr
  );
end structural;
