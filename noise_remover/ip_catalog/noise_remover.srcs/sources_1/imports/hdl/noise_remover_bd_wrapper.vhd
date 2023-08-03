--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Thu Aug  3 22:39:32 2023
--Host        : DESKTOP-JEI2OF3 running 64-bit major release  (build 9200)
--Command     : generate_target noise_remover_bd_wrapper.bd
--Design      : noise_remover_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity noise_remover_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    sig_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sig_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end noise_remover_bd_wrapper;

architecture STRUCTURE of noise_remover_bd_wrapper is
  component noise_remover_bd is
  port (
    clk : in STD_LOGIC;
    sig_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sig_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component noise_remover_bd;
begin
noise_remover_bd_i: component noise_remover_bd
     port map (
      clk => clk,
      sig_in(15 downto 0) => sig_in(15 downto 0),
      sig_out(15 downto 0) => sig_out(15 downto 0)
    );
end STRUCTURE;
