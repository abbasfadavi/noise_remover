-- Generated from Simulink block CostasLoop/carrier  recovery/PI
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_pi is
  port (
    ph : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    yn : out std_logic_vector( 32-1 downto 0 )
  );
end costasloop_pi;
architecture structural of costasloop_pi is 
  signal accumulator1_q_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal accumulator_q_net : std_logic_vector( 32-1 downto 0 );
  signal ki_p_net : std_logic_vector( 32-1 downto 0 );
  signal kp_p_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net_x0 : std_logic_vector( 32-1 downto 0 );
begin
  yn <= accumulator1_q_net;
  addsub_s_net <= ph;
  clk_net <= clk_1;
  ce_net <= ce_1;
  accumulator : entity xil_defaultlib.sysgen_accum_3f37348835 
  port map (
    clr => '0',
    b => ki_p_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_q_net
  );
  accumulator1 : entity xil_defaultlib.sysgen_accum_46676044df 
  port map (
    clr => '0',
    b => addsub_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => accumulator1_q_net
  );
  addsub : entity xil_defaultlib.sysgen_addsub_6c4dceaf59 
  port map (
    clr => '0',
    a => kp_p_net,
    b => accumulator_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net_x0
  );
  ki : entity xil_defaultlib.costasloop_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_bin_pt => 15,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 32,
    core_name0 => "costasloop_mult_gen_v12_0_i0",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 30,
    p_width => 32,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => ki_p_net
  );
  kp : entity xil_defaultlib.costasloop_xlcmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_bin_pt => 15,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 1,
    c_b_width => 16,
    c_output_width => 32,
    core_name0 => "costasloop_mult_gen_v12_0_i1",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 30,
    p_width => 32,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => kp_p_net
  );
end structural;
-- Generated from Simulink block CostasLoop/carrier  recovery/Phase Error Detector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_phase_error_detector is
  port (
    r : in std_logic_vector( 24-1 downto 0 );
    i : in std_logic_vector( 24-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    pherr : out std_logic_vector( 16-1 downto 0 )
  );
end costasloop_phase_error_detector;
architecture structural of costasloop_phase_error_detector is 
  signal constant1_op_net : std_logic_vector( 24-1 downto 0 );
  signal res_r_s_net : std_logic_vector( 24-1 downto 0 );
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 24-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 16-1 downto 0 );
  signal res_i_s_net : std_logic_vector( 24-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 24-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter1_op_net : std_logic_vector( 24-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 24-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 24-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
begin
  pherr <= addsub_s_net;
  res_r_s_net <= r;
  res_i_s_net <= i;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.costasloop_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 23,
    a_width => 24,
    b_arith => xlSigned,
    b_bin_pt => 23,
    b_width => 24,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 25,
    core_name0 => "costasloop_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 25,
    latency => 0,
    overflow => 3,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 16
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_05ec6bb878 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_05ec6bb878 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_be287cac10 
  port map (
    clr => '0',
    ip => res_i_s_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_be287cac10 
  port map (
    clr => '0',
    ip => res_r_s_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_8a5649a9bb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational_op_net,
    d0 => inverter_op_net,
    d1 => res_i_s_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_8a5649a9bb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => inverter1_op_net,
    d1 => res_r_s_net,
    y => mux1_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_275a34fbce 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => res_r_s_net,
    b => constant1_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_275a34fbce 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => res_i_s_net,
    b => constant2_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block CostasLoop/carrier  recovery/cmplx_mult
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_cmplx_mult is
  port (
    ar : in std_logic_vector( 16-1 downto 0 );
    ai : in std_logic_vector( 16-1 downto 0 );
    br : in std_logic_vector( 16-1 downto 0 );
    bi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    pr : out std_logic_vector( 24-1 downto 0 );
    pi : out std_logic_vector( 24-1 downto 0 )
  );
end costasloop_cmplx_mult;
architecture structural of costasloop_cmplx_mult is 
  signal i_net : std_logic_vector( 16-1 downto 0 );
  signal res_r_s_net : std_logic_vector( 24-1 downto 0 );
  signal sin_table_data_net : std_logic_vector( 16-1 downto 0 );
  signal r_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal res_i_s_net : std_logic_vector( 24-1 downto 0 );
  signal cos_table_data_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal armai_s_net : std_logic_vector( 17-1 downto 0 );
  signal arpai_s_net : std_logic_vector( 17-1 downto 0 );
  signal brpbi_s_net : std_logic_vector( 17-1 downto 0 );
  signal ar_br_nbi_p_net : std_logic_vector( 33-1 downto 0 );
  signal ar_ai_br_p_net : std_logic_vector( 33-1 downto 0 );
  signal ar_nai_bi_p_net : std_logic_vector( 33-1 downto 0 );
begin
  pr <= res_r_s_net;
  pi <= res_i_s_net;
  r_net <= ar;
  i_net <= ai;
  sin_table_data_net <= br;
  cos_table_data_net <= bi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  armai : entity xil_defaultlib.sysgen_addsub_ec365702c6 
  port map (
    clr => '0',
    a => r_net,
    b => i_net,
    clk => clk_net,
    ce => ce_net,
    s => armai_s_net
  );
  arpai : entity xil_defaultlib.sysgen_addsub_af3cc93f85 
  port map (
    clr => '0',
    a => r_net,
    b => i_net,
    clk => clk_net,
    ce => ce_net,
    s => arpai_s_net
  );
  ar_ai_br : entity xil_defaultlib.costasloop_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_a_type => 0,
    c_a_width => 17,
    c_b_type => 0,
    c_b_width => 16,
    c_baat => 17,
    c_output_width => 33,
    c_type => 0,
    core_name0 => "costasloop_mult_gen_v12_0_i2",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 30,
    p_width => 33,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => arpai_s_net,
    b => sin_table_data_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => ar_ai_br_p_net
  );
  ar_br_nbi : entity xil_defaultlib.costasloop_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 17,
    c_baat => 16,
    c_output_width => 33,
    c_type => 0,
    core_name0 => "costasloop_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 30,
    p_width => 33,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => r_net,
    b => brpbi_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => ar_br_nbi_p_net
  );
  ar_nai_bi : entity xil_defaultlib.costasloop_xlmult 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 13,
    b_width => 17,
    c_a_type => 0,
    c_a_width => 16,
    c_b_type => 0,
    c_b_width => 17,
    c_baat => 16,
    c_output_width => 33,
    c_type => 0,
    core_name0 => "costasloop_mult_gen_v12_0_i3",
    extra_registers => 0,
    multsign => 2,
    overflow => 1,
    p_arith => xlSigned,
    p_bin_pt => 28,
    p_width => 33,
    quantization => 1
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => cos_table_data_net,
    b => armai_s_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => ar_nai_bi_p_net
  );
  brpbi : entity xil_defaultlib.sysgen_addsub_8bdbb9942b 
  port map (
    clr => '0',
    a => sin_table_data_net,
    b => cos_table_data_net,
    clk => clk_net,
    ce => ce_net,
    s => brpbi_s_net
  );
  res_i : entity xil_defaultlib.sysgen_addsub_ec77de93c1 
  port map (
    clr => '0',
    a => ar_ai_br_p_net,
    b => ar_br_nbi_p_net,
    clk => clk_net,
    ce => ce_net,
    s => res_i_s_net
  );
  res_r : entity xil_defaultlib.sysgen_addsub_9bd749c035 
  port map (
    clr => '0',
    a => ar_br_nbi_p_net,
    b => ar_nai_bi_p_net,
    clk => clk_net,
    ce => ce_net,
    s => res_r_s_net
  );
end structural;
-- Generated from Simulink block CostasLoop/carrier  recovery/dds1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_dds1 is
  port (
    err : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    cos : out std_logic_vector( 16-1 downto 0 );
    sin : out std_logic_vector( 16-1 downto 0 )
  );
end costasloop_dds1;
architecture structural of costasloop_dds1 is 
  signal accumulator1_q_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal cos_table_data_net : std_logic_vector( 16-1 downto 0 );
  signal sin_table_data_net : std_logic_vector( 16-1 downto 0 );
  signal shift1_op_net : std_logic_vector( 32-1 downto 0 );
  signal slice2_0_9_y_net : std_logic_vector( 10-1 downto 0 );
  signal clk_net : std_logic;
  signal slice1_0_9_y_net : std_logic_vector( 10-1 downto 0 );
begin
  cos <= cos_table_data_net;
  sin <= sin_table_data_net;
  accumulator1_q_net <= err;
  clk_net <= clk_1;
  ce_net <= ce_1;
  shift1 : entity xil_defaultlib.sysgen_shift_0cbcf06b47 
  port map (
    clr => '0',
    ip => accumulator1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift1_op_net
  );
  cos_table : entity xil_defaultlib.costasloop_xlsprom 
  generic map (
    c_address_width => 10,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_d3aa2b_vivado.mem",
    mem_size => 16384,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => slice1_0_9_y_net,
    clk => clk_net,
    ce => ce_net,
    data => cos_table_data_net
  );
  sin_table : entity xil_defaultlib.costasloop_xlsprom 
  generic map (
    c_address_width => 10,
    c_width => 16,
    latency => 1,
    mem_init_file => "xpm_d4bea3_vivado.mem",
    mem_size => 16384,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => slice2_0_9_y_net,
    clk => clk_net,
    ce => ce_net,
    data => sin_table_data_net
  );
  slice1_0_9 : entity xil_defaultlib.costasloop_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 9,
    x_width => 32,
    y_width => 10
  )
  port map (
    x => shift1_op_net,
    y => slice1_0_9_y_net
  );
  slice2_0_9 : entity xil_defaultlib.costasloop_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 9,
    x_width => 32,
    y_width => 10
  )
  port map (
    x => shift1_op_net,
    y => slice2_0_9_y_net
  );
end structural;
-- Generated from Simulink block CostasLoop/carrier  recovery
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_carrier_recovery is
  port (
    r : in std_logic_vector( 16-1 downto 0 );
    i : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    rr : out std_logic_vector( 24-1 downto 0 );
    ii : out std_logic_vector( 24-1 downto 0 )
  );
end costasloop_carrier_recovery;
architecture structural of costasloop_carrier_recovery is 
  signal res_r_s_net : std_logic_vector( 24-1 downto 0 );
  signal res_i_s_net : std_logic_vector( 24-1 downto 0 );
  signal r_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal i_net : std_logic_vector( 16-1 downto 0 );
  signal accumulator1_q_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal sin_table_data_net : std_logic_vector( 16-1 downto 0 );
  signal cos_table_data_net : std_logic_vector( 16-1 downto 0 );
begin
  rr <= res_r_s_net;
  ii <= res_i_s_net;
  r_net <= r;
  i_net <= i;
  clk_net <= clk_1;
  ce_net <= ce_1;
  pi : entity xil_defaultlib.costasloop_pi 
  port map (
    ph => addsub_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    yn => accumulator1_q_net
  );
  phase_error_detector : entity xil_defaultlib.costasloop_phase_error_detector 
  port map (
    r => res_r_s_net,
    i => res_i_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    pherr => addsub_s_net
  );
  cmplx_mult : entity xil_defaultlib.costasloop_cmplx_mult 
  port map (
    ar => r_net,
    ai => i_net,
    br => sin_table_data_net,
    bi => cos_table_data_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    pr => res_r_s_net,
    pi => res_i_s_net
  );
  dds1 : entity xil_defaultlib.costasloop_dds1 
  port map (
    err => accumulator1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    cos => cos_table_data_net,
    sin => sin_table_data_net
  );
end structural;
-- Generated from Simulink block CostasLoop_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_struct is
  port (
    i : in std_logic_vector( 16-1 downto 0 );
    r : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    ii : out std_logic_vector( 24-1 downto 0 );
    rr : out std_logic_vector( 24-1 downto 0 )
  );
end costasloop_struct;
architecture structural of costasloop_struct is 
  signal i_net : std_logic_vector( 16-1 downto 0 );
  signal res_i_s_net : std_logic_vector( 24-1 downto 0 );
  signal r_net : std_logic_vector( 16-1 downto 0 );
  signal res_r_s_net : std_logic_vector( 24-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
begin
  i_net <= i;
  ii <= res_i_s_net;
  r_net <= r;
  rr <= res_r_s_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  carrier_recovery : entity xil_defaultlib.costasloop_carrier_recovery 
  port map (
    r => r_net,
    i => i_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    rr => res_r_s_net,
    ii => res_i_s_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop_default_clock_driver is
  port (
    costasloop_sysclk : in std_logic;
    costasloop_sysce : in std_logic;
    costasloop_sysclr : in std_logic;
    costasloop_clk1 : out std_logic;
    costasloop_ce1 : out std_logic
  );
end costasloop_default_clock_driver;
architecture structural of costasloop_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => costasloop_sysclk,
    sysce => costasloop_sysce,
    sysclr => costasloop_sysclr,
    clk => costasloop_clk1,
    ce => costasloop_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity costasloop is
  port (
    i : in std_logic_vector( 16-1 downto 0 );
    r : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    ii : out std_logic_vector( 24-1 downto 0 );
    rr : out std_logic_vector( 24-1 downto 0 )
  );
end costasloop;
architecture structural of costasloop is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "costasloop,sysgen_core_2021_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k160t,speed=-2,package=fbg484,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1e-08,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.0001,accum=2,addsub=7,cmult=2,constant=2,inv=2,mult=3,mux=2,relational=2,shift=1,slice=2,sprom=2,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  costasloop_default_clock_driver : entity xil_defaultlib.costasloop_default_clock_driver 
  port map (
    costasloop_sysclk => clk,
    costasloop_sysce => '1',
    costasloop_sysclr => '0',
    costasloop_clk1 => clk_1_net,
    costasloop_ce1 => ce_1_net
  );
  costasloop_struct : entity xil_defaultlib.costasloop_struct 
  port map (
    i => i,
    r => r,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    ii => ii,
    rr => rr
  );
end structural;
