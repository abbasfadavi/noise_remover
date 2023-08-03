--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Thu Aug  3 22:39:32 2023
--Host        : DESKTOP-JEI2OF3 running 64-bit major release  (build 9200)
--Command     : generate_target noise_remover_bd.bd
--Design      : noise_remover_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity noise_remover_bd is
  port (
    clk : in STD_LOGIC;
    sig_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sig_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of noise_remover_bd : entity is "noise_remover_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=noise_remover_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of noise_remover_bd : entity is "noise_remover_bd.hwdef";
end noise_remover_bd;

architecture STRUCTURE of noise_remover_bd is
  component noise_remover_bd_noise_remover_1_0 is
  port (
    sig_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    sig_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component noise_remover_bd_noise_remover_1_0;
  signal clk_1 : STD_LOGIC;
  signal noise_remover_1_sig_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sig_in_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN noise_remover_bd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of sig_in : signal is "xilinx.com:signal:data:1.0 DATA.SIG_IN DATA";
  attribute X_INTERFACE_PARAMETER of sig_in : signal is "XIL_INTERFACENAME DATA.SIG_IN, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sig_out : signal is "xilinx.com:signal:data:1.0 DATA.SIG_OUT DATA";
  attribute X_INTERFACE_PARAMETER of sig_out : signal is "XIL_INTERFACENAME DATA.SIG_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
begin
  clk_1 <= clk;
  sig_in_1(15 downto 0) <= sig_in(15 downto 0);
  sig_out(15 downto 0) <= noise_remover_1_sig_out(15 downto 0);
noise_remover_1: component noise_remover_bd_noise_remover_1_0
     port map (
      clk => clk_1,
      sig_in(15 downto 0) => sig_in_1(15 downto 0),
      sig_out(15 downto 0) => noise_remover_1_sig_out(15 downto 0)
    );
end STRUCTURE;
