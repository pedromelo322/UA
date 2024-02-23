-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/16/2022 17:20:51"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MiniProjeto IS
    PORT (
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(1 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END MiniProjeto;

-- Design Ports Information
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF MiniProjeto IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \inst5|s_count[0]~8_combout\ : std_logic;
SIGNAL \inst5|s_count[0]~9\ : std_logic;
SIGNAL \inst5|s_count[1]~10_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst5|s_count[3]~17_combout\ : std_logic;
SIGNAL \inst5|s_count[1]~11\ : std_logic;
SIGNAL \inst5|s_count[2]~12_combout\ : std_logic;
SIGNAL \inst5|s_count[2]~13\ : std_logic;
SIGNAL \inst5|s_count[3]~18_combout\ : std_logic;
SIGNAL \inst5|s_count[3]~19\ : std_logic;
SIGNAL \inst5|s_count[4]~20_combout\ : std_logic;
SIGNAL \inst5|s_count[4]~21\ : std_logic;
SIGNAL \inst5|s_count[5]~22_combout\ : std_logic;
SIGNAL \inst5|s_count[5]~23\ : std_logic;
SIGNAL \inst5|s_count[6]~24_combout\ : std_logic;
SIGNAL \inst5|s_count[6]~25\ : std_logic;
SIGNAL \inst5|s_count[7]~26_combout\ : std_logic;
SIGNAL \inst5|s_count[3]~14_combout\ : std_logic;
SIGNAL \inst5|s_count[3]~15_combout\ : std_logic;
SIGNAL \inst5|s_count[3]~16_combout\ : std_logic;
SIGNAL \inst3|binoutput[6]~0_combout\ : std_logic;
SIGNAL \inst3|binoutput[5]~1_combout\ : std_logic;
SIGNAL \inst3|binoutput[4]~2_combout\ : std_logic;
SIGNAL \inst3|binoutput[3]~3_combout\ : std_logic;
SIGNAL \inst3|binoutput[2]~4_combout\ : std_logic;
SIGNAL \inst3|binoutput[1]~5_combout\ : std_logic;
SIGNAL \inst3|binoutput[0]~6_combout\ : std_logic;
SIGNAL \inst1|binoutput[6]~0_combout\ : std_logic;
SIGNAL \inst1|binoutput[5]~1_combout\ : std_logic;
SIGNAL \inst1|binoutput[4]~2_combout\ : std_logic;
SIGNAL \inst1|binoutput[3]~3_combout\ : std_logic;
SIGNAL \inst1|binoutput[2]~4_combout\ : std_logic;
SIGNAL \inst1|binoutput[1]~5_combout\ : std_logic;
SIGNAL \inst1|binoutput[0]~6_combout\ : std_logic;
SIGNAL \inst5|s_count\ : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

HEX0 <= ww_HEX0;
ww_KEY <= KEY;
ww_SW <= SW;
HEX1 <= ww_HEX1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[6]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[5]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[4]~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[2]~4_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[1]~5_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|binoutput[0]~6_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[6]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[5]~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[4]~2_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[2]~4_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[1]~5_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|binoutput[0]~6_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X114_Y40_N14
\inst5|s_count[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[0]~8_combout\ = \inst5|s_count\(0) $ (VCC)
-- \inst5|s_count[0]~9\ = CARRY(\inst5|s_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst5|s_count\(0),
	datad => VCC,
	combout => \inst5|s_count[0]~8_combout\,
	cout => \inst5|s_count[0]~9\);

-- Location: LCCOMB_X114_Y40_N16
\inst5|s_count[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[1]~10_combout\ = (\inst5|s_count\(1) & (!\inst5|s_count[0]~9\)) # (!\inst5|s_count\(1) & ((\inst5|s_count[0]~9\) # (GND)))
-- \inst5|s_count[1]~11\ = CARRY((!\inst5|s_count[0]~9\) # (!\inst5|s_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|s_count\(1),
	datad => VCC,
	cin => \inst5|s_count[0]~9\,
	combout => \inst5|s_count[1]~10_combout\,
	cout => \inst5|s_count[1]~11\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y40_N0
\inst5|s_count[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[3]~17_combout\ = (\SW[1]~input_o\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst5|s_count[3]~17_combout\);

-- Location: FF_X114_Y40_N17
\inst5|s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[1]~10_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(1));

-- Location: LCCOMB_X114_Y40_N18
\inst5|s_count[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[2]~12_combout\ = (\inst5|s_count\(2) & (\inst5|s_count[1]~11\ $ (GND))) # (!\inst5|s_count\(2) & (!\inst5|s_count[1]~11\ & VCC))
-- \inst5|s_count[2]~13\ = CARRY((\inst5|s_count\(2) & !\inst5|s_count[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|s_count\(2),
	datad => VCC,
	cin => \inst5|s_count[1]~11\,
	combout => \inst5|s_count[2]~12_combout\,
	cout => \inst5|s_count[2]~13\);

-- Location: FF_X114_Y40_N19
\inst5|s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[2]~12_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(2));

-- Location: LCCOMB_X114_Y40_N20
\inst5|s_count[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[3]~18_combout\ = (\inst5|s_count\(3) & (!\inst5|s_count[2]~13\)) # (!\inst5|s_count\(3) & ((\inst5|s_count[2]~13\) # (GND)))
-- \inst5|s_count[3]~19\ = CARRY((!\inst5|s_count[2]~13\) # (!\inst5|s_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(3),
	datad => VCC,
	cin => \inst5|s_count[2]~13\,
	combout => \inst5|s_count[3]~18_combout\,
	cout => \inst5|s_count[3]~19\);

-- Location: FF_X114_Y40_N21
\inst5|s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[3]~18_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(3));

-- Location: LCCOMB_X114_Y40_N22
\inst5|s_count[4]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[4]~20_combout\ = (\inst5|s_count\(4) & (\inst5|s_count[3]~19\ $ (GND))) # (!\inst5|s_count\(4) & (!\inst5|s_count[3]~19\ & VCC))
-- \inst5|s_count[4]~21\ = CARRY((\inst5|s_count\(4) & !\inst5|s_count[3]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(4),
	datad => VCC,
	cin => \inst5|s_count[3]~19\,
	combout => \inst5|s_count[4]~20_combout\,
	cout => \inst5|s_count[4]~21\);

-- Location: FF_X114_Y40_N23
\inst5|s_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[4]~20_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(4));

-- Location: LCCOMB_X114_Y40_N24
\inst5|s_count[5]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[5]~22_combout\ = (\inst5|s_count\(5) & (!\inst5|s_count[4]~21\)) # (!\inst5|s_count\(5) & ((\inst5|s_count[4]~21\) # (GND)))
-- \inst5|s_count[5]~23\ = CARRY((!\inst5|s_count[4]~21\) # (!\inst5|s_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|s_count\(5),
	datad => VCC,
	cin => \inst5|s_count[4]~21\,
	combout => \inst5|s_count[5]~22_combout\,
	cout => \inst5|s_count[5]~23\);

-- Location: FF_X114_Y40_N25
\inst5|s_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[5]~22_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(5));

-- Location: LCCOMB_X114_Y40_N26
\inst5|s_count[6]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[6]~24_combout\ = (\inst5|s_count\(6) & (\inst5|s_count[5]~23\ $ (GND))) # (!\inst5|s_count\(6) & (!\inst5|s_count[5]~23\ & VCC))
-- \inst5|s_count[6]~25\ = CARRY((\inst5|s_count\(6) & !\inst5|s_count[5]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datad => VCC,
	cin => \inst5|s_count[5]~23\,
	combout => \inst5|s_count[6]~24_combout\,
	cout => \inst5|s_count[6]~25\);

-- Location: FF_X114_Y40_N27
\inst5|s_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[6]~24_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(6));

-- Location: LCCOMB_X114_Y40_N28
\inst5|s_count[7]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[7]~26_combout\ = \inst5|s_count[6]~25\ $ (\inst5|s_count\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst5|s_count\(7),
	cin => \inst5|s_count[6]~25\,
	combout => \inst5|s_count[7]~26_combout\);

-- Location: FF_X114_Y40_N29
\inst5|s_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[7]~26_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(7));

-- Location: LCCOMB_X114_Y40_N10
\inst5|s_count[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[3]~14_combout\ = (!\inst5|s_count\(3) & (!\inst5|s_count\(2) & ((!\inst5|s_count\(1)) # (!\inst5|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(3),
	datab => \inst5|s_count\(2),
	datac => \inst5|s_count\(0),
	datad => \inst5|s_count\(1),
	combout => \inst5|s_count[3]~14_combout\);

-- Location: LCCOMB_X114_Y40_N12
\inst5|s_count[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[3]~15_combout\ = (\inst5|s_count\(6) & ((\inst5|s_count\(4)) # (!\inst5|s_count[3]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(4),
	datac => \inst5|s_count\(6),
	datad => \inst5|s_count[3]~14_combout\,
	combout => \inst5|s_count[3]~15_combout\);

-- Location: LCCOMB_X114_Y40_N30
\inst5|s_count[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|s_count[3]~16_combout\ = (\inst5|s_count\(7)) # ((\SW[1]~input_o\) # ((\inst5|s_count\(5) & \inst5|s_count[3]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(7),
	datab => \inst5|s_count\(5),
	datac => \SW[1]~input_o\,
	datad => \inst5|s_count[3]~15_combout\,
	combout => \inst5|s_count[3]~16_combout\);

-- Location: FF_X114_Y40_N15
\inst5|s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \inst5|s_count[0]~8_combout\,
	sclr => \inst5|s_count[3]~16_combout\,
	ena => \inst5|s_count[3]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|s_count\(0));

-- Location: LCCOMB_X114_Y54_N28
\inst3|binoutput[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[6]~0_combout\ = (\inst5|s_count\(0) & (!\inst5|s_count\(3) & (\inst5|s_count\(1) $ (!\inst5|s_count\(2))))) # (!\inst5|s_count\(0) & (!\inst5|s_count\(1) & (\inst5|s_count\(2) $ (!\inst5|s_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[6]~0_combout\);

-- Location: LCCOMB_X114_Y54_N14
\inst3|binoutput[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[5]~1_combout\ = (\inst5|s_count\(0) & (\inst5|s_count\(3) $ (((\inst5|s_count\(1)) # (!\inst5|s_count\(2)))))) # (!\inst5|s_count\(0) & (\inst5|s_count\(1) & (!\inst5|s_count\(2) & !\inst5|s_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[5]~1_combout\);

-- Location: LCCOMB_X114_Y54_N4
\inst3|binoutput[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[4]~2_combout\ = (\inst5|s_count\(1) & (\inst5|s_count\(0) & ((!\inst5|s_count\(3))))) # (!\inst5|s_count\(1) & ((\inst5|s_count\(2) & ((!\inst5|s_count\(3)))) # (!\inst5|s_count\(2) & (\inst5|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[4]~2_combout\);

-- Location: LCCOMB_X114_Y54_N30
\inst3|binoutput[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[3]~3_combout\ = (\inst5|s_count\(1) & ((\inst5|s_count\(0) & (\inst5|s_count\(2))) # (!\inst5|s_count\(0) & (!\inst5|s_count\(2) & \inst5|s_count\(3))))) # (!\inst5|s_count\(1) & (!\inst5|s_count\(3) & (\inst5|s_count\(0) $ 
-- (\inst5|s_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[3]~3_combout\);

-- Location: LCCOMB_X114_Y54_N16
\inst3|binoutput[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[2]~4_combout\ = (\inst5|s_count\(2) & (\inst5|s_count\(3) & ((\inst5|s_count\(1)) # (!\inst5|s_count\(0))))) # (!\inst5|s_count\(2) & (!\inst5|s_count\(0) & (\inst5|s_count\(1) & !\inst5|s_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[2]~4_combout\);

-- Location: LCCOMB_X114_Y54_N6
\inst3|binoutput[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[1]~5_combout\ = (\inst5|s_count\(1) & ((\inst5|s_count\(0) & ((\inst5|s_count\(3)))) # (!\inst5|s_count\(0) & (\inst5|s_count\(2))))) # (!\inst5|s_count\(1) & (\inst5|s_count\(2) & (\inst5|s_count\(0) $ (\inst5|s_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[1]~5_combout\);

-- Location: LCCOMB_X114_Y54_N12
\inst3|binoutput[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|binoutput[0]~6_combout\ = (\inst5|s_count\(2) & (!\inst5|s_count\(1) & (\inst5|s_count\(0) $ (!\inst5|s_count\(3))))) # (!\inst5|s_count\(2) & (\inst5|s_count\(0) & (\inst5|s_count\(1) $ (!\inst5|s_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(0),
	datab => \inst5|s_count\(1),
	datac => \inst5|s_count\(2),
	datad => \inst5|s_count\(3),
	combout => \inst3|binoutput[0]~6_combout\);

-- Location: LCCOMB_X114_Y32_N28
\inst1|binoutput[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[6]~0_combout\ = (\inst5|s_count\(4) & (!\inst5|s_count\(7) & (\inst5|s_count\(6) $ (!\inst5|s_count\(5))))) # (!\inst5|s_count\(4) & (!\inst5|s_count\(5) & (\inst5|s_count\(6) $ (!\inst5|s_count\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[6]~0_combout\);

-- Location: LCCOMB_X114_Y32_N6
\inst1|binoutput[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[5]~1_combout\ = (\inst5|s_count\(6) & (\inst5|s_count\(4) & (\inst5|s_count\(7) $ (\inst5|s_count\(5))))) # (!\inst5|s_count\(6) & (!\inst5|s_count\(7) & ((\inst5|s_count\(4)) # (\inst5|s_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[5]~1_combout\);

-- Location: LCCOMB_X114_Y32_N8
\inst1|binoutput[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[4]~2_combout\ = (\inst5|s_count\(5) & (((!\inst5|s_count\(7) & \inst5|s_count\(4))))) # (!\inst5|s_count\(5) & ((\inst5|s_count\(6) & (!\inst5|s_count\(7))) # (!\inst5|s_count\(6) & ((\inst5|s_count\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[4]~2_combout\);

-- Location: LCCOMB_X114_Y32_N14
\inst1|binoutput[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[3]~3_combout\ = (\inst5|s_count\(5) & ((\inst5|s_count\(6) & ((\inst5|s_count\(4)))) # (!\inst5|s_count\(6) & (\inst5|s_count\(7) & !\inst5|s_count\(4))))) # (!\inst5|s_count\(5) & (!\inst5|s_count\(7) & (\inst5|s_count\(6) $ 
-- (\inst5|s_count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[3]~3_combout\);

-- Location: LCCOMB_X114_Y32_N12
\inst1|binoutput[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[2]~4_combout\ = (\inst5|s_count\(6) & (\inst5|s_count\(7) & ((\inst5|s_count\(5)) # (!\inst5|s_count\(4))))) # (!\inst5|s_count\(6) & (!\inst5|s_count\(7) & (!\inst5|s_count\(4) & \inst5|s_count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[2]~4_combout\);

-- Location: LCCOMB_X114_Y32_N18
\inst1|binoutput[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[1]~5_combout\ = (\inst5|s_count\(7) & ((\inst5|s_count\(4) & ((\inst5|s_count\(5)))) # (!\inst5|s_count\(4) & (\inst5|s_count\(6))))) # (!\inst5|s_count\(7) & (\inst5|s_count\(6) & (\inst5|s_count\(4) $ (\inst5|s_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(6),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(4),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[1]~5_combout\);

-- Location: LCCOMB_X114_Y40_N4
\inst1|binoutput[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|binoutput[0]~6_combout\ = (\inst5|s_count\(7) & (\inst5|s_count\(4) & (\inst5|s_count\(6) $ (\inst5|s_count\(5))))) # (!\inst5|s_count\(7) & (!\inst5|s_count\(5) & (\inst5|s_count\(4) $ (\inst5|s_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|s_count\(4),
	datab => \inst5|s_count\(7),
	datac => \inst5|s_count\(6),
	datad => \inst5|s_count\(5),
	combout => \inst1|binoutput[0]~6_combout\);

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;
END structure;


