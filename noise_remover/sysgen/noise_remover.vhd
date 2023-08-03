-- Generated from Simulink block th
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_th_x0 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_th_x0;
architecture structural of noise_remover_th_x0 is 
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 28-1 downto 0 );
  signal mux_y_net : std_logic_vector( 27-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 28-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 27-1 downto 0 );
  signal register_q_net : std_logic_vector( 27-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
begin
  sig_out <= convert5_dout_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_63fb7d2f7b 
  port map (
    clr => '0',
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  addsub : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_34ad6accd0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_63d105a7ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 11,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  mux : entity xil_defaultlib.sysgen_mux_c1caa19456 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => addsub1_s_net,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.noise_remover_xlregister 
  generic map (
    d_width => 27,
    init_value => b"000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_742ccc387a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => absolute_op_net,
    b => register_q_net,
    op => relational1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f238fafa51 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block noise_canceler
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_noise_canceler_x0 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_noise_canceler_x0;
architecture structural of noise_remover_noise_canceler_x0 is 
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal bitbasher_a_net : std_logic_vector( 2-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 16-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
begin
  sig_out <= mux_y_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  th : entity xil_defaultlib.noise_remover_th_x0 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => convert5_dout_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  bitbasher : entity xil_defaultlib.sysgen_bitbasher_2bdf359892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    b => relational_op_net,
    c => relational1_op_net,
    a => bitbasher_a_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_c80d041661 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_e658647fdb 
  port map (
    clr => '0',
    ip => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a6e18d98e2 
  port map (
    clr => '0',
    sel => bitbasher_a_net,
    d0 => addsub2_s_net,
    d1 => constant2_op_net,
    d2 => constant2_op_net,
    d3 => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => convert5_dout_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => inverter_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block Subsystem1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_subsystem1 is
  port (
    a : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_subsystem1;
architecture structural of noise_remover_subsystem1 is 
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 17-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 17-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 17-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 16-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 19-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 17-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 19-1 downto 0 );
begin
  s <= convert5_dout_net;
  convert5_dout_net_x0 <= a;
  clk_net <= clk_1;
  ce_net <= ce_1;
  noise_canceler : entity xil_defaultlib.noise_remover_noise_canceler_x0 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => mux_y_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "noise_remover_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => convert5_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay1_q_net,
    b => convert5_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => delay6_q_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 19,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => scale2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  delay1 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 8,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay6 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_3712f2fa19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addsub1_s_net,
    op => scale2_op_net
  );
end structural;
-- Generated from Simulink block th
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_th_x3 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_th_x3;
architecture structural of noise_remover_th_x3 is 
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub_s_net : std_logic_vector( 28-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 27-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 28-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 27-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 27-1 downto 0 );
begin
  sig_out <= convert5_dout_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_63fb7d2f7b 
  port map (
    clr => '0',
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  addsub : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_34ad6accd0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_63d105a7ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 11,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  mux : entity xil_defaultlib.sysgen_mux_c1caa19456 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => addsub1_s_net,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.noise_remover_xlregister 
  generic map (
    d_width => 27,
    init_value => b"000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_742ccc387a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => absolute_op_net,
    b => register_q_net,
    op => relational1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f238fafa51 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block noise_canceler
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_noise_canceler_x3 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_noise_canceler_x3;
architecture structural of noise_remover_noise_canceler_x3 is 
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal bitbasher_a_net : std_logic_vector( 2-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
begin
  sig_out <= mux_y_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  th : entity xil_defaultlib.noise_remover_th_x3 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => convert5_dout_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  bitbasher : entity xil_defaultlib.sysgen_bitbasher_2bdf359892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    b => relational_op_net,
    c => relational1_op_net,
    a => bitbasher_a_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_c80d041661 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_e658647fdb 
  port map (
    clr => '0',
    ip => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a6e18d98e2 
  port map (
    clr => '0',
    sel => bitbasher_a_net,
    d0 => addsub2_s_net,
    d1 => constant2_op_net,
    d2 => constant2_op_net,
    d3 => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => convert5_dout_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => inverter_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block Subsystem2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_subsystem2 is
  port (
    a : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_subsystem2;
architecture structural of noise_remover_subsystem2 is 
  signal sig_in_net : std_logic_vector( 16-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 19-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 17-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 17-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 17-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 19-1 downto 0 );
begin
  s <= convert5_dout_net;
  sig_in_net <= a;
  clk_net <= clk_1;
  ce_net <= ce_1;
  noise_canceler : entity xil_defaultlib.noise_remover_noise_canceler_x3 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => mux_y_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "noise_remover_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => sig_in_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay1_q_net,
    b => sig_in_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => delay6_q_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 19,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => scale2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  delay1 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => sig_in_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => sig_in_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 16,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay6 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_3712f2fa19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addsub1_s_net,
    op => scale2_op_net
  );
end structural;
-- Generated from Simulink block Subsystem3/noise_canceler/th
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_th is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_th;
architecture structural of noise_remover_th is 
  signal clk_net : std_logic;
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal register_q_net : std_logic_vector( 27-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 28-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal ce_net : std_logic;
  signal absolute_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 28-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 27-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 27-1 downto 0 );
begin
  sig_out <= convert5_dout_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_63fb7d2f7b 
  port map (
    clr => '0',
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  addsub : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_34ad6accd0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_63d105a7ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 11,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  mux : entity xil_defaultlib.sysgen_mux_c1caa19456 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => addsub1_s_net,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.noise_remover_xlregister 
  generic map (
    d_width => 27,
    init_value => b"000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_742ccc387a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => absolute_op_net,
    b => register_q_net,
    op => relational1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f238fafa51 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block Subsystem3/noise_canceler
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_noise_canceler is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_noise_canceler;
architecture structural of noise_remover_noise_canceler is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal bitbasher_a_net : std_logic_vector( 2-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 16-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
begin
  sig_out <= mux_y_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  th : entity xil_defaultlib.noise_remover_th 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => convert5_dout_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  bitbasher : entity xil_defaultlib.sysgen_bitbasher_2bdf359892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    b => relational_op_net,
    c => relational1_op_net,
    a => bitbasher_a_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_c80d041661 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_e658647fdb 
  port map (
    clr => '0',
    ip => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a6e18d98e2 
  port map (
    clr => '0',
    sel => bitbasher_a_net,
    d0 => addsub2_s_net,
    d1 => constant2_op_net,
    d2 => constant2_op_net,
    d3 => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => convert5_dout_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => inverter_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block Subsystem3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_subsystem3 is
  port (
    a : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_subsystem3;
architecture structural of noise_remover_subsystem3 is 
  signal addsub5_s_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 19-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 17-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 19-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 17-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 17-1 downto 0 );
begin
  s <= convert5_dout_net_x0;
  convert5_dout_net <= a;
  clk_net <= clk_1;
  ce_net <= ce_1;
  noise_canceler : entity xil_defaultlib.noise_remover_noise_canceler 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => mux_y_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "noise_remover_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay1_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => delay6_q_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 19,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => scale2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net_x0
  );
  delay1 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay6 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_3712f2fa19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addsub1_s_net,
    op => scale2_op_net
  );
end structural;
-- Generated from Simulink block th
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_th_x1 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_th_x1;
architecture structural of noise_remover_th_x1 is 
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 27-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal mux_y_net : std_logic_vector( 27-1 downto 0 );
  signal absolute_op_net : std_logic_vector( 18-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 28-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 28-1 downto 0 );
  signal register_q_net : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  sig_out <= convert5_dout_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_63fb7d2f7b 
  port map (
    clr => '0',
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  addsub : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_34ad6accd0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_63d105a7ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 11,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  mux : entity xil_defaultlib.sysgen_mux_c1caa19456 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => addsub1_s_net,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.noise_remover_xlregister 
  generic map (
    d_width => 27,
    init_value => b"000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_742ccc387a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => absolute_op_net,
    b => register_q_net,
    op => relational1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f238fafa51 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block noise_canceler
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_noise_canceler_x1 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_noise_canceler_x1;
architecture structural of noise_remover_noise_canceler_x1 is 
  signal clk_net : std_logic;
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal bitbasher_a_net : std_logic_vector( 2-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
begin
  sig_out <= mux_y_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  th : entity xil_defaultlib.noise_remover_th_x1 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => convert5_dout_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  bitbasher : entity xil_defaultlib.sysgen_bitbasher_2bdf359892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    b => relational_op_net,
    c => relational1_op_net,
    a => bitbasher_a_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_c80d041661 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_e658647fdb 
  port map (
    clr => '0',
    ip => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a6e18d98e2 
  port map (
    clr => '0',
    sel => bitbasher_a_net,
    d0 => addsub2_s_net,
    d1 => constant2_op_net,
    d2 => constant2_op_net,
    d3 => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => convert5_dout_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => inverter_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block Subsystem4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_subsystem4 is
  port (
    a : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_subsystem4;
architecture structural of noise_remover_subsystem4 is 
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 17-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 19-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 17-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 17-1 downto 0 );
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 18-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 19-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 17-1 downto 0 );
begin
  s <= convert5_dout_net_x0;
  convert5_dout_net <= a;
  clk_net <= clk_1;
  ce_net <= ce_1;
  noise_canceler : entity xil_defaultlib.noise_remover_noise_canceler_x1 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => mux_y_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "noise_remover_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay1_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => delay6_q_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 19,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => scale2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net_x0
  );
  delay1 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay6 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_3712f2fa19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addsub1_s_net,
    op => scale2_op_net
  );
end structural;
-- Generated from Simulink block th
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_th_x2 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_th_x2;
architecture structural of noise_remover_th_x2 is 
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 28-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal mux_y_net : std_logic_vector( 27-1 downto 0 );
  signal shift2_op_net : std_logic_vector( 27-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 28-1 downto 0 );
  signal register_q_net : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal absolute_op_net : std_logic_vector( 18-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
begin
  sig_out <= convert5_dout_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_63fb7d2f7b 
  port map (
    clr => '0',
    a => addsub3_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  addsub : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant2_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 11,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 11,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 28,
    core_name0 => "noise_remover_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 11,
    s_width => 28
  )
  port map (
    clr => '0',
    en => "1",
    a => register_q_net,
    b => constant1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_34ad6accd0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_63d105a7ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 11,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => shift2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  mux : entity xil_defaultlib.sysgen_mux_c1caa19456 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => relational1_op_net,
    d0 => addsub1_s_net,
    d1 => addsub_s_net,
    y => mux_y_net
  );
  register_x0 : entity xil_defaultlib.noise_remover_xlregister 
  generic map (
    d_width => 27,
    init_value => b"000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_742ccc387a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => absolute_op_net,
    b => register_q_net,
    op => relational1_op_net
  );
  shift2 : entity xil_defaultlib.sysgen_shift_f238fafa51 
  port map (
    clr => '0',
    ip => register_q_net,
    clk => clk_net,
    ce => ce_net,
    op => shift2_op_net
  );
end structural;
-- Generated from Simulink block noise_canceler
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_noise_canceler_x2 is
  port (
    sig : in std_logic_vector( 17-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_noise_canceler_x2;
architecture structural of noise_remover_noise_canceler_x2 is 
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal bitbasher_a_net : std_logic_vector( 2-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 18-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 16-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 16-1 downto 0 );
begin
  sig_out <= mux_y_net;
  addsub3_s_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  th : entity xil_defaultlib.noise_remover_th_x2 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => convert5_dout_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  bitbasher : entity xil_defaultlib.sysgen_bitbasher_2bdf359892 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    b => relational_op_net,
    c => relational1_op_net,
    a => bitbasher_a_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_c80d041661 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_e658647fdb 
  port map (
    clr => '0',
    ip => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_a6e18d98e2 
  port map (
    clr => '0',
    sel => bitbasher_a_net,
    d0 => addsub2_s_net,
    d1 => constant2_op_net,
    d2 => constant2_op_net,
    d3 => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => convert5_dout_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2abe9e611d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => addsub3_s_net,
    b => inverter_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block Subsystem5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_subsystem5 is
  port (
    a : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_subsystem5;
architecture structural of noise_remover_subsystem5 is 
  signal convert5_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 16-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 19-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal addsub4_s_net : std_logic_vector( 17-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 17-1 downto 0 );
  signal addsub5_s_net : std_logic_vector( 18-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 17-1 downto 0 );
  signal scale2_op_net : std_logic_vector( 19-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 16-1 downto 0 );
  signal delay6_q_net : std_logic_vector( 17-1 downto 0 );
  signal delay3_q_net : std_logic_vector( 17-1 downto 0 );
begin
  s <= convert5_dout_net_x0;
  convert5_dout_net <= a;
  clk_net <= clk_1;
  ce_net <= ce_1;
  noise_canceler : entity xil_defaultlib.noise_remover_noise_canceler_x2 
  port map (
    sig => addsub3_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sig_out => mux_y_net
  );
  addsub1 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 18,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 19,
    core_name0 => "noise_remover_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 19,
    latency => 1,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 19
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub5_s_net,
    b => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i1",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay2_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => delay1_q_net,
    b => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 16,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 16,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 17,
    core_name0 => "noise_remover_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 17,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 17
  )
  port map (
    clr => '0',
    en => "1",
    a => mux_y_net,
    b => delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  addsub5 : entity xil_defaultlib.noise_remover_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 15,
    a_width => 17,
    b_arith => xlSigned,
    b_bin_pt => 15,
    b_width => 17,
    c_has_c_out => 0,
    c_latency => 0,
    c_output_width => 18,
    core_name0 => "noise_remover_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 18,
    latency => 0,
    overflow => 2,
    quantization => 2,
    s_arith => xlSigned,
    s_bin_pt => 15,
    s_width => 18
  )
  port map (
    clr => '0',
    en => "1",
    a => delay6_q_net,
    b => delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub5_s_net
  );
  convert5 : entity xil_defaultlib.noise_remover_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 17,
    din_width => 19,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => scale2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net_x0
  );
  delay1 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  delay3 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => delay6_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay3_q_net
  );
  delay4 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 16
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay4_q_net
  );
  delay6 : entity xil_defaultlib.noise_remover_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
  port map (
    en => '1',
    rst => '0',
    d => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    q => delay6_q_net
  );
  scale2 : entity xil_defaultlib.sysgen_scale_3712f2fa19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addsub1_s_net,
    op => scale2_op_net
  );
end structural;
-- Generated from Simulink block Wavelet
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_wavelet is
  port (
    sig : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    s : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_wavelet;
architecture structural of noise_remover_wavelet is 
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal sig_in_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert5_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert5_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
begin
  s <= convert5_dout_net;
  sig_in_net <= sig;
  clk_net <= clk_1;
  ce_net <= ce_1;
  subsystem1 : entity xil_defaultlib.noise_remover_subsystem1 
  port map (
    a => convert5_dout_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net_x3
  );
  subsystem2 : entity xil_defaultlib.noise_remover_subsystem2 
  port map (
    a => sig_in_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net_x2
  );
  subsystem3 : entity xil_defaultlib.noise_remover_subsystem3 
  port map (
    a => convert5_dout_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net_x1
  );
  subsystem4 : entity xil_defaultlib.noise_remover_subsystem4 
  port map (
    a => convert5_dout_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net_x0
  );
  subsystem5 : entity xil_defaultlib.noise_remover_subsystem5 
  port map (
    a => convert5_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net
  );
end structural;
-- Generated from Simulink block noise_remover_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_struct is
  port (
    sig_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover_struct;
architecture structural of noise_remover_struct is 
  signal sig_in_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal convert5_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
begin
  sig_in_net <= sig_in;
  sig_out <= convert5_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  wavelet : entity xil_defaultlib.noise_remover_wavelet 
  port map (
    sig => sig_in_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    s => convert5_dout_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover_default_clock_driver is
  port (
    noise_remover_sysclk : in std_logic;
    noise_remover_sysce : in std_logic;
    noise_remover_sysclr : in std_logic;
    noise_remover_clk1 : out std_logic;
    noise_remover_ce1 : out std_logic
  );
end noise_remover_default_clock_driver;
architecture structural of noise_remover_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => noise_remover_sysclk,
    sysce => noise_remover_sysce,
    sysclr => noise_remover_sysclr,
    clk => noise_remover_clk1,
    ce => noise_remover_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity noise_remover is
  port (
    sig_in : in std_logic_vector( 16-1 downto 0 );
    clk : in std_logic;
    sig_out : out std_logic_vector( 16-1 downto 0 )
  );
end noise_remover;
architecture structural of noise_remover is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "noise_remover,sysgen_core_2021_2,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k160t,speed=-2,package=fbg484,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1e-08,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.001,abs=5,addsub=45,bitbasher=5,constant=15,convert=10,delay=25,inv=5,mux=10,register=5,relational=15,scale=5,shift=5,}";
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
begin
  noise_remover_default_clock_driver : entity xil_defaultlib.noise_remover_default_clock_driver 
  port map (
    noise_remover_sysclk => clk,
    noise_remover_sysce => '1',
    noise_remover_sysclr => '0',
    noise_remover_clk1 => clk_1_net,
    noise_remover_ce1 => ce_1_net
  );
  noise_remover_struct : entity xil_defaultlib.noise_remover_struct 
  port map (
    sig_in => sig_in,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    sig_out => sig_out
  );
end structural;
