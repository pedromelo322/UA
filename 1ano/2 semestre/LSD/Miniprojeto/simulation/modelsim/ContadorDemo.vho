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

-- DATE "05/15/2023 18:45:22"

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

ENTITY 	ContadorDemo IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	Hex0 : OUT std_logic_vector(6 DOWNTO 0);
	Hex1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END ContadorDemo;

-- Design Ports Information
-- Hex0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Hex1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ContadorDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Hex0[0]~output_o\ : std_logic;
SIGNAL \Hex0[1]~output_o\ : std_logic;
SIGNAL \Hex0[2]~output_o\ : std_logic;
SIGNAL \Hex0[3]~output_o\ : std_logic;
SIGNAL \Hex0[4]~output_o\ : std_logic;
SIGNAL \Hex0[5]~output_o\ : std_logic;
SIGNAL \Hex0[6]~output_o\ : std_logic;
SIGNAL \Hex1[0]~output_o\ : std_logic;
SIGNAL \Hex1[1]~output_o\ : std_logic;
SIGNAL \Hex1[2]~output_o\ : std_logic;
SIGNAL \Hex1[3]~output_o\ : std_logic;
SIGNAL \Hex1[4]~output_o\ : std_logic;
SIGNAL \Hex1[5]~output_o\ : std_logic;
SIGNAL \Hex1[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \debounce_KEY0|s_dirtyIn~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_dirtyIn~q\ : std_logic;
SIGNAL \debounce_KEY0|s_previousIn~q\ : std_logic;
SIGNAL \debounce_KEY0|Add0~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~41\ : std_logic;
SIGNAL \debounce_KEY0|Add0~42_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[21]~10_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~43\ : std_logic;
SIGNAL \debounce_KEY0|Add0~44_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~11\ : std_logic;
SIGNAL \debounce_KEY0|Add0~12_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~13\ : std_logic;
SIGNAL \debounce_KEY0|Add0~14_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~11_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~15\ : std_logic;
SIGNAL \debounce_KEY0|Add0~16_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~17\ : std_logic;
SIGNAL \debounce_KEY0|Add0~18_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~19\ : std_logic;
SIGNAL \debounce_KEY0|Add0~20_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~14_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~21\ : std_logic;
SIGNAL \debounce_KEY0|Add0~22_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~15_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~23\ : std_logic;
SIGNAL \debounce_KEY0|Add0~24_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~25\ : std_logic;
SIGNAL \debounce_KEY0|Add0~26_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~27\ : std_logic;
SIGNAL \debounce_KEY0|Add0~28_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~29\ : std_logic;
SIGNAL \debounce_KEY0|Add0~30_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~31\ : std_logic;
SIGNAL \debounce_KEY0|Add0~32_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~33\ : std_logic;
SIGNAL \debounce_KEY0|Add0~34_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~35\ : std_logic;
SIGNAL \debounce_KEY0|Add0~36_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[18]~17_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[14]~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[22]~24_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[22]~25_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[22]~26_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[14]~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~37\ : std_logic;
SIGNAL \debounce_KEY0|Add0~38_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[19]~18_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~39\ : std_logic;
SIGNAL \debounce_KEY0|Add0~40_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[20]~9_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[14]~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~23_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~1\ : std_logic;
SIGNAL \debounce_KEY0|Add0~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~19_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~3\ : std_logic;
SIGNAL \debounce_KEY0|Add0~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~5\ : std_logic;
SIGNAL \debounce_KEY0|Add0~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~21_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~7\ : std_logic;
SIGNAL \debounce_KEY0|Add0~8_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~22_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~9\ : std_logic;
SIGNAL \debounce_KEY0|Add0~10_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~27_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~q\ : std_logic;
SIGNAL \s_enable~0_combout\ : std_logic;
SIGNAL \s_enable~q\ : std_logic;
SIGNAL \TimerN|count[0]~4_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \TimerN|count[1]~3_combout\ : std_logic;
SIGNAL \TimerN|count[2]~2_combout\ : std_logic;
SIGNAL \TimerN|count[3]~0_combout\ : std_logic;
SIGNAL \TimerN|count[3]~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[1]~1_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[2]~2_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[3]~3_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[4]~4_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[5]~5_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst1|decOut_n[6]~6_combout\ : std_logic;
SIGNAL \bin7segdecoder_inst0|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \TimerN|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \debounce_KEY0|s_debounceCnt\ : std_logic_vector(22 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
Hex0 <= ww_Hex0;
Hex1 <= ww_Hex1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\Hex0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\Hex0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[1]~1_combout\,
	devoe => ww_devoe,
	o => \Hex0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\Hex0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[2]~2_combout\,
	devoe => ww_devoe,
	o => \Hex0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\Hex0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[3]~3_combout\,
	devoe => ww_devoe,
	o => \Hex0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\Hex0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[4]~4_combout\,
	devoe => ww_devoe,
	o => \Hex0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\Hex0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[5]~5_combout\,
	devoe => ww_devoe,
	o => \Hex0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\Hex0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst1|decOut_n[6]~6_combout\,
	devoe => ww_devoe,
	o => \Hex0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\Hex1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst0|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\Hex1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Hex1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\Hex1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Hex1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\Hex1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst0|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\Hex1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst0|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\Hex1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder_inst0|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\Hex1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \Hex1[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

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

-- Location: LCCOMB_X111_Y45_N24
\debounce_KEY0|s_dirtyIn~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_dirtyIn~0_combout\ = !\KEY[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[0]~input_o\,
	combout => \debounce_KEY0|s_dirtyIn~0_combout\);

-- Location: FF_X111_Y45_N25
\debounce_KEY0|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_dirtyIn~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_dirtyIn~q\);

-- Location: FF_X108_Y45_N31
\debounce_KEY0|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \debounce_KEY0|s_dirtyIn~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_previousIn~q\);

-- Location: LCCOMB_X109_Y45_N10
\debounce_KEY0|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~0_combout\ = \debounce_KEY0|s_debounceCnt\(0) $ (VCC)
-- \debounce_KEY0|Add0~1\ = CARRY(\debounce_KEY0|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(0),
	datad => VCC,
	combout => \debounce_KEY0|Add0~0_combout\,
	cout => \debounce_KEY0|Add0~1\);

-- Location: LCCOMB_X109_Y44_N18
\debounce_KEY0|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~40_combout\ = (\debounce_KEY0|s_debounceCnt\(20) & ((GND) # (!\debounce_KEY0|Add0~39\))) # (!\debounce_KEY0|s_debounceCnt\(20) & (\debounce_KEY0|Add0~39\ $ (GND)))
-- \debounce_KEY0|Add0~41\ = CARRY((\debounce_KEY0|s_debounceCnt\(20)) # (!\debounce_KEY0|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(20),
	datad => VCC,
	cin => \debounce_KEY0|Add0~39\,
	combout => \debounce_KEY0|Add0~40_combout\,
	cout => \debounce_KEY0|Add0~41\);

-- Location: LCCOMB_X109_Y44_N20
\debounce_KEY0|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~42_combout\ = (\debounce_KEY0|s_debounceCnt\(21) & (\debounce_KEY0|Add0~41\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(21) & (!\debounce_KEY0|Add0~41\))
-- \debounce_KEY0|Add0~43\ = CARRY((!\debounce_KEY0|s_debounceCnt\(21) & !\debounce_KEY0|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(21),
	datad => VCC,
	cin => \debounce_KEY0|Add0~41\,
	combout => \debounce_KEY0|Add0~42_combout\,
	cout => \debounce_KEY0|Add0~43\);

-- Location: LCCOMB_X109_Y44_N26
\debounce_KEY0|s_debounceCnt[21]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[21]~10_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~42_combout\ & (\debounce_KEY0|s_debounceCnt[14]~3_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datab => \debounce_KEY0|Add0~42_combout\,
	datac => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt[21]~10_combout\);

-- Location: FF_X109_Y44_N27
\debounce_KEY0|s_debounceCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[21]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(21));

-- Location: LCCOMB_X109_Y44_N22
\debounce_KEY0|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~44_combout\ = \debounce_KEY0|Add0~43\ $ (\debounce_KEY0|s_debounceCnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debounce_KEY0|s_debounceCnt\(22),
	cin => \debounce_KEY0|Add0~43\,
	combout => \debounce_KEY0|Add0~44_combout\);

-- Location: LCCOMB_X109_Y45_N20
\debounce_KEY0|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~10_combout\ = (\debounce_KEY0|s_debounceCnt\(5) & (\debounce_KEY0|Add0~9\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(5) & (!\debounce_KEY0|Add0~9\))
-- \debounce_KEY0|Add0~11\ = CARRY((!\debounce_KEY0|s_debounceCnt\(5) & !\debounce_KEY0|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(5),
	datad => VCC,
	cin => \debounce_KEY0|Add0~9\,
	combout => \debounce_KEY0|Add0~10_combout\,
	cout => \debounce_KEY0|Add0~11\);

-- Location: LCCOMB_X109_Y45_N22
\debounce_KEY0|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~12_combout\ = (\debounce_KEY0|s_debounceCnt\(6) & ((GND) # (!\debounce_KEY0|Add0~11\))) # (!\debounce_KEY0|s_debounceCnt\(6) & (\debounce_KEY0|Add0~11\ $ (GND)))
-- \debounce_KEY0|Add0~13\ = CARRY((\debounce_KEY0|s_debounceCnt\(6)) # (!\debounce_KEY0|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(6),
	datad => VCC,
	cin => \debounce_KEY0|Add0~11\,
	combout => \debounce_KEY0|Add0~12_combout\,
	cout => \debounce_KEY0|Add0~13\);

-- Location: LCCOMB_X108_Y45_N0
\debounce_KEY0|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~1_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~12_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~12_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~1_combout\);

-- Location: FF_X108_Y45_N1
\debounce_KEY0|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~1_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(6));

-- Location: LCCOMB_X109_Y45_N24
\debounce_KEY0|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~14_combout\ = (\debounce_KEY0|s_debounceCnt\(7) & (\debounce_KEY0|Add0~13\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(7) & (!\debounce_KEY0|Add0~13\))
-- \debounce_KEY0|Add0~15\ = CARRY((!\debounce_KEY0|s_debounceCnt\(7) & !\debounce_KEY0|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(7),
	datad => VCC,
	cin => \debounce_KEY0|Add0~13\,
	combout => \debounce_KEY0|Add0~14_combout\,
	cout => \debounce_KEY0|Add0~15\);

-- Location: LCCOMB_X108_Y45_N14
\debounce_KEY0|s_debounceCnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~11_combout\ = (\debounce_KEY0|Add0~14_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~14_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~11_combout\);

-- Location: FF_X108_Y45_N15
\debounce_KEY0|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~11_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(7));

-- Location: LCCOMB_X109_Y45_N26
\debounce_KEY0|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~16_combout\ = (\debounce_KEY0|s_debounceCnt\(8) & ((GND) # (!\debounce_KEY0|Add0~15\))) # (!\debounce_KEY0|s_debounceCnt\(8) & (\debounce_KEY0|Add0~15\ $ (GND)))
-- \debounce_KEY0|Add0~17\ = CARRY((\debounce_KEY0|s_debounceCnt\(8)) # (!\debounce_KEY0|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(8),
	datad => VCC,
	cin => \debounce_KEY0|Add0~15\,
	combout => \debounce_KEY0|Add0~16_combout\,
	cout => \debounce_KEY0|Add0~17\);

-- Location: LCCOMB_X108_Y45_N4
\debounce_KEY0|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~12_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~16_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datab => \debounce_KEY0|Add0~16_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~12_combout\);

-- Location: FF_X108_Y45_N5
\debounce_KEY0|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~12_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(8));

-- Location: LCCOMB_X109_Y45_N28
\debounce_KEY0|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~18_combout\ = (\debounce_KEY0|s_debounceCnt\(9) & (\debounce_KEY0|Add0~17\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(9) & (!\debounce_KEY0|Add0~17\))
-- \debounce_KEY0|Add0~19\ = CARRY((!\debounce_KEY0|s_debounceCnt\(9) & !\debounce_KEY0|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(9),
	datad => VCC,
	cin => \debounce_KEY0|Add0~17\,
	combout => \debounce_KEY0|Add0~18_combout\,
	cout => \debounce_KEY0|Add0~19\);

-- Location: LCCOMB_X107_Y45_N26
\debounce_KEY0|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~13_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~18_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datad => \debounce_KEY0|Add0~18_combout\,
	combout => \debounce_KEY0|s_debounceCnt~13_combout\);

-- Location: FF_X107_Y45_N27
\debounce_KEY0|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~13_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(9));

-- Location: LCCOMB_X109_Y45_N30
\debounce_KEY0|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~20_combout\ = (\debounce_KEY0|s_debounceCnt\(10) & ((GND) # (!\debounce_KEY0|Add0~19\))) # (!\debounce_KEY0|s_debounceCnt\(10) & (\debounce_KEY0|Add0~19\ $ (GND)))
-- \debounce_KEY0|Add0~21\ = CARRY((\debounce_KEY0|s_debounceCnt\(10)) # (!\debounce_KEY0|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(10),
	datad => VCC,
	cin => \debounce_KEY0|Add0~19\,
	combout => \debounce_KEY0|Add0~20_combout\,
	cout => \debounce_KEY0|Add0~21\);

-- Location: LCCOMB_X108_Y45_N22
\debounce_KEY0|s_debounceCnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~14_combout\ = (\debounce_KEY0|Add0~20_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~20_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~14_combout\);

-- Location: FF_X108_Y45_N23
\debounce_KEY0|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~14_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(10));

-- Location: LCCOMB_X109_Y44_N0
\debounce_KEY0|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~22_combout\ = (\debounce_KEY0|s_debounceCnt\(11) & (\debounce_KEY0|Add0~21\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(11) & (!\debounce_KEY0|Add0~21\))
-- \debounce_KEY0|Add0~23\ = CARRY((!\debounce_KEY0|s_debounceCnt\(11) & !\debounce_KEY0|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(11),
	datad => VCC,
	cin => \debounce_KEY0|Add0~21\,
	combout => \debounce_KEY0|Add0~22_combout\,
	cout => \debounce_KEY0|Add0~23\);

-- Location: LCCOMB_X107_Y45_N30
\debounce_KEY0|s_debounceCnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~15_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~22_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datad => \debounce_KEY0|Add0~22_combout\,
	combout => \debounce_KEY0|s_debounceCnt~15_combout\);

-- Location: FF_X107_Y45_N31
\debounce_KEY0|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~15_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(11));

-- Location: LCCOMB_X109_Y44_N2
\debounce_KEY0|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~24_combout\ = (\debounce_KEY0|s_debounceCnt\(12) & ((GND) # (!\debounce_KEY0|Add0~23\))) # (!\debounce_KEY0|s_debounceCnt\(12) & (\debounce_KEY0|Add0~23\ $ (GND)))
-- \debounce_KEY0|Add0~25\ = CARRY((\debounce_KEY0|s_debounceCnt\(12)) # (!\debounce_KEY0|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(12),
	datad => VCC,
	cin => \debounce_KEY0|Add0~23\,
	combout => \debounce_KEY0|Add0~24_combout\,
	cout => \debounce_KEY0|Add0~25\);

-- Location: LCCOMB_X107_Y45_N2
\debounce_KEY0|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~7_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & \debounce_KEY0|Add0~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datad => \debounce_KEY0|Add0~24_combout\,
	combout => \debounce_KEY0|s_debounceCnt~7_combout\);

-- Location: FF_X107_Y45_N3
\debounce_KEY0|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~7_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(12));

-- Location: LCCOMB_X109_Y44_N4
\debounce_KEY0|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~26_combout\ = (\debounce_KEY0|s_debounceCnt\(13) & (\debounce_KEY0|Add0~25\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(13) & (!\debounce_KEY0|Add0~25\))
-- \debounce_KEY0|Add0~27\ = CARRY((!\debounce_KEY0|s_debounceCnt\(13) & !\debounce_KEY0|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(13),
	datad => VCC,
	cin => \debounce_KEY0|Add0~25\,
	combout => \debounce_KEY0|Add0~26_combout\,
	cout => \debounce_KEY0|Add0~27\);

-- Location: LCCOMB_X108_Y45_N8
\debounce_KEY0|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~8_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|Add0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|Add0~26_combout\,
	combout => \debounce_KEY0|s_debounceCnt~8_combout\);

-- Location: FF_X108_Y45_N9
\debounce_KEY0|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~8_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(13));

-- Location: LCCOMB_X109_Y44_N6
\debounce_KEY0|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~28_combout\ = (\debounce_KEY0|s_debounceCnt\(14) & ((GND) # (!\debounce_KEY0|Add0~27\))) # (!\debounce_KEY0|s_debounceCnt\(14) & (\debounce_KEY0|Add0~27\ $ (GND)))
-- \debounce_KEY0|Add0~29\ = CARRY((\debounce_KEY0|s_debounceCnt\(14)) # (!\debounce_KEY0|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(14),
	datad => VCC,
	cin => \debounce_KEY0|Add0~27\,
	combout => \debounce_KEY0|Add0~28_combout\,
	cout => \debounce_KEY0|Add0~29\);

-- Location: LCCOMB_X108_Y45_N12
\debounce_KEY0|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~16_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~28_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~28_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~16_combout\);

-- Location: FF_X108_Y45_N13
\debounce_KEY0|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~16_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(14));

-- Location: LCCOMB_X109_Y44_N8
\debounce_KEY0|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~30_combout\ = (\debounce_KEY0|s_debounceCnt\(15) & (\debounce_KEY0|Add0~29\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(15) & (!\debounce_KEY0|Add0~29\))
-- \debounce_KEY0|Add0~31\ = CARRY((!\debounce_KEY0|s_debounceCnt\(15) & !\debounce_KEY0|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(15),
	datad => VCC,
	cin => \debounce_KEY0|Add0~29\,
	combout => \debounce_KEY0|Add0~30_combout\,
	cout => \debounce_KEY0|Add0~31\);

-- Location: LCCOMB_X109_Y44_N28
\debounce_KEY0|s_debounceCnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~4_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~30_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~30_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~4_combout\);

-- Location: FF_X109_Y44_N29
\debounce_KEY0|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~4_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(15));

-- Location: LCCOMB_X109_Y44_N10
\debounce_KEY0|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~32_combout\ = (\debounce_KEY0|s_debounceCnt\(16) & ((GND) # (!\debounce_KEY0|Add0~31\))) # (!\debounce_KEY0|s_debounceCnt\(16) & (\debounce_KEY0|Add0~31\ $ (GND)))
-- \debounce_KEY0|Add0~33\ = CARRY((\debounce_KEY0|s_debounceCnt\(16)) # (!\debounce_KEY0|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(16),
	datad => VCC,
	cin => \debounce_KEY0|Add0~31\,
	combout => \debounce_KEY0|Add0~32_combout\,
	cout => \debounce_KEY0|Add0~33\);

-- Location: LCCOMB_X109_Y44_N30
\debounce_KEY0|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~5_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~32_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~32_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~5_combout\);

-- Location: FF_X109_Y44_N31
\debounce_KEY0|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~5_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(16));

-- Location: LCCOMB_X109_Y44_N12
\debounce_KEY0|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~34_combout\ = (\debounce_KEY0|s_debounceCnt\(17) & (\debounce_KEY0|Add0~33\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(17) & (!\debounce_KEY0|Add0~33\))
-- \debounce_KEY0|Add0~35\ = CARRY((!\debounce_KEY0|s_debounceCnt\(17) & !\debounce_KEY0|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(17),
	datad => VCC,
	cin => \debounce_KEY0|Add0~33\,
	combout => \debounce_KEY0|Add0~34_combout\,
	cout => \debounce_KEY0|Add0~35\);

-- Location: LCCOMB_X108_Y45_N26
\debounce_KEY0|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~6_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|Add0~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|Add0~34_combout\,
	combout => \debounce_KEY0|s_debounceCnt~6_combout\);

-- Location: FF_X108_Y45_N27
\debounce_KEY0|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~6_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(17));

-- Location: LCCOMB_X109_Y44_N14
\debounce_KEY0|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~36_combout\ = (\debounce_KEY0|s_debounceCnt\(18) & ((GND) # (!\debounce_KEY0|Add0~35\))) # (!\debounce_KEY0|s_debounceCnt\(18) & (\debounce_KEY0|Add0~35\ $ (GND)))
-- \debounce_KEY0|Add0~37\ = CARRY((\debounce_KEY0|s_debounceCnt\(18)) # (!\debounce_KEY0|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(18),
	datad => VCC,
	cin => \debounce_KEY0|Add0~35\,
	combout => \debounce_KEY0|Add0~36_combout\,
	cout => \debounce_KEY0|Add0~37\);

-- Location: LCCOMB_X108_Y45_N18
\debounce_KEY0|s_debounceCnt[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[18]~17_combout\ = (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & (\debounce_KEY0|s_debounceCnt[14]~3_combout\ & ((\debounce_KEY0|Add0~36_combout\) # (!\debounce_KEY0|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datab => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|Add0~36_combout\,
	combout => \debounce_KEY0|s_debounceCnt[18]~17_combout\);

-- Location: FF_X108_Y45_N19
\debounce_KEY0|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[18]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(18));

-- Location: LCCOMB_X107_Y45_N16
\debounce_KEY0|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~4_combout\ = (\debounce_KEY0|s_debounceCnt\(8) & (\debounce_KEY0|s_debounceCnt\(19) & (\debounce_KEY0|s_debounceCnt\(14) & \debounce_KEY0|s_debounceCnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(8),
	datab => \debounce_KEY0|s_debounceCnt\(19),
	datac => \debounce_KEY0|s_debounceCnt\(14),
	datad => \debounce_KEY0|s_debounceCnt\(18),
	combout => \debounce_KEY0|LessThan0~4_combout\);

-- Location: LCCOMB_X107_Y45_N10
\debounce_KEY0|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~5_combout\ = (\debounce_KEY0|s_debounceCnt\(9) & (\debounce_KEY0|s_debounceCnt\(11) & \debounce_KEY0|LessThan0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(9),
	datac => \debounce_KEY0|s_debounceCnt\(11),
	datad => \debounce_KEY0|LessThan0~4_combout\,
	combout => \debounce_KEY0|LessThan0~5_combout\);

-- Location: LCCOMB_X109_Y45_N0
\debounce_KEY0|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~5_combout\ = (!\debounce_KEY0|s_debounceCnt\(4) & (!\debounce_KEY0|s_debounceCnt\(3) & (!\debounce_KEY0|s_debounceCnt\(1) & !\debounce_KEY0|s_debounceCnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(4),
	datab => \debounce_KEY0|s_debounceCnt\(3),
	datac => \debounce_KEY0|s_debounceCnt\(1),
	datad => \debounce_KEY0|s_debounceCnt\(2),
	combout => \debounce_KEY0|s_pulsedOut~5_combout\);

-- Location: LCCOMB_X107_Y45_N8
\debounce_KEY0|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~6_combout\ = (\debounce_KEY0|s_debounceCnt\(6) & ((\debounce_KEY0|s_debounceCnt\(0)) # ((\debounce_KEY0|s_debounceCnt\(5)) # (!\debounce_KEY0|s_pulsedOut~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(0),
	datab => \debounce_KEY0|s_debounceCnt\(6),
	datac => \debounce_KEY0|s_pulsedOut~5_combout\,
	datad => \debounce_KEY0|s_debounceCnt\(5),
	combout => \debounce_KEY0|LessThan0~6_combout\);

-- Location: LCCOMB_X107_Y45_N22
\debounce_KEY0|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~1_combout\ = (\debounce_KEY0|s_debounceCnt\(12)) # ((\debounce_KEY0|s_debounceCnt\(13)) # ((\debounce_KEY0|s_debounceCnt\(11) & \debounce_KEY0|s_debounceCnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(11),
	datab => \debounce_KEY0|s_debounceCnt\(12),
	datac => \debounce_KEY0|s_debounceCnt\(13),
	datad => \debounce_KEY0|s_debounceCnt\(10),
	combout => \debounce_KEY0|LessThan0~1_combout\);

-- Location: LCCOMB_X107_Y45_N0
\debounce_KEY0|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~2_combout\ = (\debounce_KEY0|s_debounceCnt\(16)) # ((\debounce_KEY0|s_debounceCnt\(15)) # ((\debounce_KEY0|s_debounceCnt\(14) & \debounce_KEY0|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(16),
	datab => \debounce_KEY0|s_debounceCnt\(14),
	datac => \debounce_KEY0|LessThan0~1_combout\,
	datad => \debounce_KEY0|s_debounceCnt\(15),
	combout => \debounce_KEY0|LessThan0~2_combout\);

-- Location: LCCOMB_X107_Y45_N18
\debounce_KEY0|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~3_combout\ = (\debounce_KEY0|s_debounceCnt\(19) & (\debounce_KEY0|s_debounceCnt\(18) & ((\debounce_KEY0|s_debounceCnt\(17)) # (\debounce_KEY0|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(19),
	datab => \debounce_KEY0|s_debounceCnt\(18),
	datac => \debounce_KEY0|s_debounceCnt\(17),
	datad => \debounce_KEY0|LessThan0~2_combout\,
	combout => \debounce_KEY0|LessThan0~3_combout\);

-- Location: LCCOMB_X107_Y45_N6
\debounce_KEY0|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~7_combout\ = (\debounce_KEY0|LessThan0~3_combout\) # ((\debounce_KEY0|LessThan0~5_combout\ & ((\debounce_KEY0|s_debounceCnt\(7)) # (\debounce_KEY0|LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|LessThan0~5_combout\,
	datab => \debounce_KEY0|s_debounceCnt\(7),
	datac => \debounce_KEY0|LessThan0~6_combout\,
	datad => \debounce_KEY0|LessThan0~3_combout\,
	combout => \debounce_KEY0|LessThan0~7_combout\);

-- Location: LCCOMB_X107_Y45_N12
\debounce_KEY0|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~2_combout\ = (!\debounce_KEY0|s_debounceCnt\(9) & (!\debounce_KEY0|s_debounceCnt\(10) & (!\debounce_KEY0|s_debounceCnt\(7) & !\debounce_KEY0|s_debounceCnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(9),
	datab => \debounce_KEY0|s_debounceCnt\(10),
	datac => \debounce_KEY0|s_debounceCnt\(7),
	datad => \debounce_KEY0|s_debounceCnt\(8),
	combout => \debounce_KEY0|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X107_Y45_N14
\debounce_KEY0|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~3_combout\ = (!\debounce_KEY0|s_debounceCnt\(11) & (!\debounce_KEY0|s_debounceCnt\(19) & (!\debounce_KEY0|s_debounceCnt\(14) & !\debounce_KEY0|s_debounceCnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(11),
	datab => \debounce_KEY0|s_debounceCnt\(19),
	datac => \debounce_KEY0|s_debounceCnt\(14),
	datad => \debounce_KEY0|s_debounceCnt\(18),
	combout => \debounce_KEY0|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X107_Y45_N4
\debounce_KEY0|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~1_combout\ = (!\debounce_KEY0|s_debounceCnt\(12) & (!\debounce_KEY0|s_debounceCnt\(13) & (!\debounce_KEY0|s_debounceCnt\(21) & !\debounce_KEY0|s_debounceCnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(12),
	datab => \debounce_KEY0|s_debounceCnt\(13),
	datac => \debounce_KEY0|s_debounceCnt\(21),
	datad => \debounce_KEY0|s_debounceCnt\(20),
	combout => \debounce_KEY0|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X107_Y45_N20
\debounce_KEY0|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~0_combout\ = (!\debounce_KEY0|s_debounceCnt\(16) & (!\debounce_KEY0|s_debounceCnt\(17) & (!\debounce_KEY0|s_debounceCnt\(6) & !\debounce_KEY0|s_debounceCnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(16),
	datab => \debounce_KEY0|s_debounceCnt\(17),
	datac => \debounce_KEY0|s_debounceCnt\(6),
	datad => \debounce_KEY0|s_debounceCnt\(15),
	combout => \debounce_KEY0|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X107_Y45_N28
\debounce_KEY0|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~4_combout\ = (\debounce_KEY0|s_pulsedOut~2_combout\ & (\debounce_KEY0|s_pulsedOut~3_combout\ & (\debounce_KEY0|s_pulsedOut~1_combout\ & \debounce_KEY0|s_pulsedOut~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_pulsedOut~2_combout\,
	datab => \debounce_KEY0|s_pulsedOut~3_combout\,
	datac => \debounce_KEY0|s_pulsedOut~1_combout\,
	datad => \debounce_KEY0|s_pulsedOut~0_combout\,
	combout => \debounce_KEY0|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X108_Y45_N10
\debounce_KEY0|s_debounceCnt[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[14]~2_combout\ = (\debounce_KEY0|s_debounceCnt\(5)) # ((\debounce_KEY0|s_debounceCnt\(0)) # ((!\debounce_KEY0|s_pulsedOut~4_combout\) # (!\debounce_KEY0|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(5),
	datab => \debounce_KEY0|s_debounceCnt\(0),
	datac => \debounce_KEY0|s_pulsedOut~5_combout\,
	datad => \debounce_KEY0|s_pulsedOut~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt[14]~2_combout\);

-- Location: LCCOMB_X108_Y45_N24
\debounce_KEY0|s_debounceCnt[22]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[22]~24_combout\ = (\debounce_KEY0|s_debounceCnt\(22) & (\debounce_KEY0|LessThan0~0_combout\ & (!\debounce_KEY0|LessThan0~7_combout\))) # (!\debounce_KEY0|s_debounceCnt\(22) & (((\debounce_KEY0|s_debounceCnt[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(22),
	datab => \debounce_KEY0|LessThan0~0_combout\,
	datac => \debounce_KEY0|LessThan0~7_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~2_combout\,
	combout => \debounce_KEY0|s_debounceCnt[22]~24_combout\);

-- Location: LCCOMB_X108_Y45_N2
\debounce_KEY0|s_debounceCnt[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[22]~25_combout\ = (\debounce_KEY0|s_dirtyIn~q\ & \debounce_KEY0|s_debounceCnt[22]~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_KEY0|s_dirtyIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[22]~24_combout\,
	combout => \debounce_KEY0|s_debounceCnt[22]~25_combout\);

-- Location: LCCOMB_X108_Y45_N28
\debounce_KEY0|s_debounceCnt[22]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[22]~26_combout\ = (\debounce_KEY0|s_previousIn~q\ & (((\debounce_KEY0|Add0~44_combout\ & \debounce_KEY0|s_debounceCnt[22]~25_combout\)))) # (!\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datab => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datac => \debounce_KEY0|Add0~44_combout\,
	datad => \debounce_KEY0|s_debounceCnt[22]~25_combout\,
	combout => \debounce_KEY0|s_debounceCnt[22]~26_combout\);

-- Location: FF_X108_Y45_N29
\debounce_KEY0|s_debounceCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[22]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(22));

-- Location: LCCOMB_X108_Y45_N30
\debounce_KEY0|s_debounceCnt[14]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[14]~3_combout\ = ((\debounce_KEY0|s_debounceCnt\(22)) # ((\debounce_KEY0|s_debounceCnt[14]~2_combout\) # (!\debounce_KEY0|s_previousIn~q\))) # (!\debounce_KEY0|s_dirtyIn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_dirtyIn~q\,
	datab => \debounce_KEY0|s_debounceCnt\(22),
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~2_combout\,
	combout => \debounce_KEY0|s_debounceCnt[14]~3_combout\);

-- Location: LCCOMB_X109_Y44_N16
\debounce_KEY0|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~38_combout\ = (\debounce_KEY0|s_debounceCnt\(19) & (\debounce_KEY0|Add0~37\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(19) & (!\debounce_KEY0|Add0~37\))
-- \debounce_KEY0|Add0~39\ = CARRY((!\debounce_KEY0|s_debounceCnt\(19) & !\debounce_KEY0|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(19),
	datad => VCC,
	cin => \debounce_KEY0|Add0~37\,
	combout => \debounce_KEY0|Add0~38_combout\,
	cout => \debounce_KEY0|Add0~39\);

-- Location: LCCOMB_X107_Y45_N24
\debounce_KEY0|s_debounceCnt[19]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[19]~18_combout\ = (\debounce_KEY0|s_debounceCnt[14]~3_combout\ & (\debounce_KEY0|s_debounceCnt[14]~0_combout\ & ((\debounce_KEY0|Add0~38_combout\) # (!\debounce_KEY0|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	datad => \debounce_KEY0|Add0~38_combout\,
	combout => \debounce_KEY0|s_debounceCnt[19]~18_combout\);

-- Location: FF_X107_Y45_N25
\debounce_KEY0|s_debounceCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[19]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(19));

-- Location: LCCOMB_X109_Y44_N24
\debounce_KEY0|s_debounceCnt[20]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[20]~9_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~40_combout\ & (\debounce_KEY0|s_debounceCnt[14]~3_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datab => \debounce_KEY0|Add0~40_combout\,
	datac => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt[20]~9_combout\);

-- Location: FF_X109_Y44_N25
\debounce_KEY0|s_debounceCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[20]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(20));

-- Location: LCCOMB_X108_Y44_N0
\debounce_KEY0|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~0_combout\ = (!\debounce_KEY0|s_debounceCnt\(20) & !\debounce_KEY0|s_debounceCnt\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_KEY0|s_debounceCnt\(20),
	datad => \debounce_KEY0|s_debounceCnt\(21),
	combout => \debounce_KEY0|LessThan0~0_combout\);

-- Location: LCCOMB_X108_Y45_N20
\debounce_KEY0|s_debounceCnt[14]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[14]~0_combout\ = (\debounce_KEY0|s_dirtyIn~q\ & (((\debounce_KEY0|LessThan0~0_combout\ & !\debounce_KEY0|LessThan0~7_combout\)) # (!\debounce_KEY0|s_debounceCnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_dirtyIn~q\,
	datab => \debounce_KEY0|LessThan0~0_combout\,
	datac => \debounce_KEY0|LessThan0~7_combout\,
	datad => \debounce_KEY0|s_debounceCnt\(22),
	combout => \debounce_KEY0|s_debounceCnt[14]~0_combout\);

-- Location: LCCOMB_X108_Y45_N16
\debounce_KEY0|s_debounceCnt~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~23_combout\ = (\debounce_KEY0|Add0~0_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~0_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~23_combout\);

-- Location: FF_X108_Y45_N17
\debounce_KEY0|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~23_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(0));

-- Location: LCCOMB_X109_Y45_N12
\debounce_KEY0|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~2_combout\ = (\debounce_KEY0|s_debounceCnt\(1) & (\debounce_KEY0|Add0~1\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(1) & (!\debounce_KEY0|Add0~1\))
-- \debounce_KEY0|Add0~3\ = CARRY((!\debounce_KEY0|s_debounceCnt\(1) & !\debounce_KEY0|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(1),
	datad => VCC,
	cin => \debounce_KEY0|Add0~1\,
	combout => \debounce_KEY0|Add0~2_combout\,
	cout => \debounce_KEY0|Add0~3\);

-- Location: LCCOMB_X109_Y45_N8
\debounce_KEY0|s_debounceCnt~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~19_combout\ = (\debounce_KEY0|Add0~2_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~2_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~19_combout\);

-- Location: FF_X109_Y45_N9
\debounce_KEY0|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~19_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(1));

-- Location: LCCOMB_X109_Y45_N14
\debounce_KEY0|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~4_combout\ = (\debounce_KEY0|s_debounceCnt\(2) & ((GND) # (!\debounce_KEY0|Add0~3\))) # (!\debounce_KEY0|s_debounceCnt\(2) & (\debounce_KEY0|Add0~3\ $ (GND)))
-- \debounce_KEY0|Add0~5\ = CARRY((\debounce_KEY0|s_debounceCnt\(2)) # (!\debounce_KEY0|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(2),
	datad => VCC,
	cin => \debounce_KEY0|Add0~3\,
	combout => \debounce_KEY0|Add0~4_combout\,
	cout => \debounce_KEY0|Add0~5\);

-- Location: LCCOMB_X109_Y45_N2
\debounce_KEY0|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~20_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~4_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~4_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~20_combout\);

-- Location: FF_X109_Y45_N3
\debounce_KEY0|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~20_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(2));

-- Location: LCCOMB_X109_Y45_N16
\debounce_KEY0|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~6_combout\ = (\debounce_KEY0|s_debounceCnt\(3) & (\debounce_KEY0|Add0~5\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(3) & (!\debounce_KEY0|Add0~5\))
-- \debounce_KEY0|Add0~7\ = CARRY((!\debounce_KEY0|s_debounceCnt\(3) & !\debounce_KEY0|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(3),
	datad => VCC,
	cin => \debounce_KEY0|Add0~5\,
	combout => \debounce_KEY0|Add0~6_combout\,
	cout => \debounce_KEY0|Add0~7\);

-- Location: LCCOMB_X109_Y45_N4
\debounce_KEY0|s_debounceCnt~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~21_combout\ = (\debounce_KEY0|Add0~6_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~6_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~21_combout\);

-- Location: FF_X109_Y45_N5
\debounce_KEY0|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~21_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(3));

-- Location: LCCOMB_X109_Y45_N18
\debounce_KEY0|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~8_combout\ = (\debounce_KEY0|s_debounceCnt\(4) & ((GND) # (!\debounce_KEY0|Add0~7\))) # (!\debounce_KEY0|s_debounceCnt\(4) & (\debounce_KEY0|Add0~7\ $ (GND)))
-- \debounce_KEY0|Add0~9\ = CARRY((\debounce_KEY0|s_debounceCnt\(4)) # (!\debounce_KEY0|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(4),
	datad => VCC,
	cin => \debounce_KEY0|Add0~7\,
	combout => \debounce_KEY0|Add0~8_combout\,
	cout => \debounce_KEY0|Add0~9\);

-- Location: LCCOMB_X109_Y45_N6
\debounce_KEY0|s_debounceCnt~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~22_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|Add0~8_combout\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~8_combout\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~22_combout\);

-- Location: FF_X109_Y45_N7
\debounce_KEY0|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~22_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(4));

-- Location: LCCOMB_X108_Y45_N6
\debounce_KEY0|s_debounceCnt~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~27_combout\ = (\debounce_KEY0|Add0~10_combout\ & (\debounce_KEY0|s_previousIn~q\ & \debounce_KEY0|s_debounceCnt[14]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~10_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[14]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~27_combout\);

-- Location: FF_X108_Y45_N7
\debounce_KEY0|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~27_combout\,
	ena => \debounce_KEY0|s_debounceCnt[14]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(5));

-- Location: LCCOMB_X110_Y45_N0
\debounce_KEY0|s_pulsedOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~6_combout\ = (\debounce_KEY0|s_previousIn~q\ & (!\debounce_KEY0|s_debounceCnt\(22) & (\debounce_KEY0|s_debounceCnt\(0) & \debounce_KEY0|s_dirtyIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_previousIn~q\,
	datab => \debounce_KEY0|s_debounceCnt\(22),
	datac => \debounce_KEY0|s_debounceCnt\(0),
	datad => \debounce_KEY0|s_dirtyIn~q\,
	combout => \debounce_KEY0|s_pulsedOut~6_combout\);

-- Location: LCCOMB_X114_Y45_N4
\debounce_KEY0|s_pulsedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~7_combout\ = (!\debounce_KEY0|s_debounceCnt\(5) & (\debounce_KEY0|s_pulsedOut~5_combout\ & (\debounce_KEY0|s_pulsedOut~4_combout\ & \debounce_KEY0|s_pulsedOut~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(5),
	datab => \debounce_KEY0|s_pulsedOut~5_combout\,
	datac => \debounce_KEY0|s_pulsedOut~4_combout\,
	datad => \debounce_KEY0|s_pulsedOut~6_combout\,
	combout => \debounce_KEY0|s_pulsedOut~7_combout\);

-- Location: FF_X114_Y45_N5
\debounce_KEY0|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_pulsedOut~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_pulsedOut~q\);

-- Location: LCCOMB_X114_Y45_N20
\s_enable~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_enable~0_combout\ = !\s_enable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \s_enable~q\,
	combout => \s_enable~0_combout\);

-- Location: FF_X114_Y45_N21
s_enable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce_KEY0|s_pulsedOut~q\,
	d => \s_enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_enable~q\);

-- Location: LCCOMB_X114_Y45_N24
\TimerN|count[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \TimerN|count[0]~4_combout\ = \s_enable~q\ $ (!\TimerN|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_enable~q\,
	datad => \TimerN|count\(0),
	combout => \TimerN|count[0]~4_combout\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: FF_X114_Y45_N29
\TimerN|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \TimerN|count[0]~4_combout\,
	clrn => \KEY[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TimerN|count\(0));

-- Location: LCCOMB_X114_Y45_N26
\TimerN|count[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \TimerN|count[1]~3_combout\ = \TimerN|count\(1) $ (((!\s_enable~q\ & \TimerN|count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_enable~q\,
	datab => \TimerN|count\(0),
	datad => \TimerN|count\(1),
	combout => \TimerN|count[1]~3_combout\);

-- Location: FF_X114_Y45_N17
\TimerN|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \TimerN|count[1]~3_combout\,
	clrn => \KEY[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TimerN|count\(1));

-- Location: LCCOMB_X114_Y45_N18
\TimerN|count[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \TimerN|count[2]~2_combout\ = \TimerN|count\(2) $ (((!\s_enable~q\ & (\TimerN|count\(0) & \TimerN|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_enable~q\,
	datab => \TimerN|count\(0),
	datac => \TimerN|count\(2),
	datad => \TimerN|count\(1),
	combout => \TimerN|count[2]~2_combout\);

-- Location: FF_X114_Y45_N23
\TimerN|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \TimerN|count[2]~2_combout\,
	clrn => \KEY[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TimerN|count\(2));

-- Location: LCCOMB_X114_Y45_N14
\TimerN|count[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TimerN|count[3]~0_combout\ = (\TimerN|count\(2) & (\TimerN|count\(0) & (\TimerN|count\(1) & !\s_enable~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TimerN|count\(2),
	datab => \TimerN|count\(0),
	datac => \TimerN|count\(1),
	datad => \s_enable~q\,
	combout => \TimerN|count[3]~0_combout\);

-- Location: LCCOMB_X114_Y45_N30
\TimerN|count[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \TimerN|count[3]~1_combout\ = \TimerN|count[3]~0_combout\ $ (\TimerN|count\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TimerN|count[3]~0_combout\,
	datac => \TimerN|count\(3),
	combout => \TimerN|count[3]~1_combout\);

-- Location: FF_X114_Y45_N31
\TimerN|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \TimerN|count[3]~1_combout\,
	clrn => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TimerN|count\(3));

-- Location: LCCOMB_X114_Y45_N6
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \TimerN|count\(1) $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\TimerN|count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TimerN|count\(1),
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X114_Y45_N8
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\TimerN|count\(2) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\TimerN|count\(2) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\TimerN|count\(2) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TimerN|count\(2),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X114_Y45_N10
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\TimerN|count\(3) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\TimerN|count\(3) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\TimerN|count\(3) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TimerN|count\(3),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X114_Y45_N12
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X114_Y45_N16
\Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\TimerN|count\(3)))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datab => \TimerN|count\(3),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

-- Location: LCCOMB_X114_Y45_N22
\Mod0|auto_generated|divider|divider|StageOut[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\TimerN|count\(1)))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \TimerN|count\(1),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\);

-- Location: LCCOMB_X114_Y45_N28
\Mod0|auto_generated|divider|divider|StageOut[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\TimerN|count\(2))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TimerN|count\(2),
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\);

-- Location: LCCOMB_X114_Y53_N4
\bin7segdecoder_inst1|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[0]~0_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\TimerN|count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\TimerN|count\(0) $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[0]~0_combout\);

-- Location: LCCOMB_X114_Y53_N6
\bin7segdecoder_inst1|decOut_n[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[1]~1_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & ((\TimerN|count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\)) # (!\TimerN|count\(0) & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (\TimerN|count\(0) $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[1]~1_combout\);

-- Location: LCCOMB_X114_Y53_N8
\bin7segdecoder_inst1|decOut_n[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\) # 
-- (!\TimerN|count\(0))))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[2]~2_combout\);

-- Location: LCCOMB_X114_Y53_N14
\bin7segdecoder_inst1|decOut_n[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[3]~3_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & ((\TimerN|count\(0) & ((\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))) # (!\TimerN|count\(0) & 
-- (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\TimerN|count\(0) $ (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[3]~3_combout\);

-- Location: LCCOMB_X114_Y53_N0
\bin7segdecoder_inst1|decOut_n[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[4]~4_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & ((\TimerN|count\(0)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\)))) # (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (((\TimerN|count\(0) & !\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[4]~4_combout\);

-- Location: LCCOMB_X114_Y53_N22
\bin7segdecoder_inst1|decOut_n[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[5]~5_combout\ = (\TimerN|count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ $ (((\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))) # (!\TimerN|count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[5]~5_combout\);

-- Location: LCCOMB_X114_Y53_N12
\bin7segdecoder_inst1|decOut_n[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst1|decOut_n[6]~6_combout\ = (\TimerN|count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\TimerN|count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \TimerN|count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder_inst1|decOut_n[6]~6_combout\);

-- Location: LCCOMB_X114_Y45_N2
\bin7segdecoder_inst0|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder_inst0|decOut_n[0]~0_combout\ = (\TimerN|count\(3) & ((\TimerN|count\(2)) # (\TimerN|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TimerN|count\(3),
	datac => \TimerN|count\(2),
	datad => \TimerN|count\(1),
	combout => \bin7segdecoder_inst0|decOut_n[0]~0_combout\);

ww_Hex0(0) <= \Hex0[0]~output_o\;

ww_Hex0(1) <= \Hex0[1]~output_o\;

ww_Hex0(2) <= \Hex0[2]~output_o\;

ww_Hex0(3) <= \Hex0[3]~output_o\;

ww_Hex0(4) <= \Hex0[4]~output_o\;

ww_Hex0(5) <= \Hex0[5]~output_o\;

ww_Hex0(6) <= \Hex0[6]~output_o\;

ww_Hex1(0) <= \Hex1[0]~output_o\;

ww_Hex1(1) <= \Hex1[1]~output_o\;

ww_Hex1(2) <= \Hex1[2]~output_o\;

ww_Hex1(3) <= \Hex1[3]~output_o\;

ww_Hex1(4) <= \Hex1[4]~output_o\;

ww_Hex1(5) <= \Hex1[5]~output_o\;

ww_Hex1(6) <= \Hex1[6]~output_o\;
END structure;


