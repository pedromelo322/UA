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

-- DATE "04/11/2023 14:01:13"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MiniProjeto_Demo IS
    PORT (
	CLOCK_50 : IN std_logic;
	LEDR : OUT std_logic_vector(3 DOWNTO 0);
	Hex0 : OUT std_logic_vector(6 DOWNTO 0);
	Hex1 : OUT std_logic_vector(6 DOWNTO 0);
	Key : IN std_logic_vector(1 DOWNTO 0)
	);
END MiniProjeto_Demo;

ARCHITECTURE structure OF MiniProjeto_Demo IS
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
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Key : std_logic_vector(1 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
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
SIGNAL \freqdivider_inst|s_counter[0]~32_combout\ : std_logic;
SIGNAL \Key[1]~input_o\ : std_logic;
SIGNAL \speedselecter_inst|output[7]~33_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[14]~36_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[22]~38_combout\ : std_logic;
SIGNAL \speedselecter_inst|Equal0~1_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[10]~34_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[11]~35_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[18]~37_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[25]~39_combout\ : std_logic;
SIGNAL \speedselecter_inst|Equal0~0_combout\ : std_logic;
SIGNAL \speedselecter_inst|output[5]~32_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~0_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~1\ : std_logic;
SIGNAL \freqdivider_inst|Add2~2_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[0]~33\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[1]~34_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[1]~35\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[2]~36_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[2]~37\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[3]~38_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[3]~39\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[4]~40_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[4]~41\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[5]~42_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[5]~43\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[6]~44_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~4_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~3\ : std_logic;
SIGNAL \freqdivider_inst|Add2~4_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~5\ : std_logic;
SIGNAL \freqdivider_inst|Add2~6_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[6]~45\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[7]~46_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[7]~47\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[8]~48_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~5_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~7\ : std_logic;
SIGNAL \freqdivider_inst|Add2~8_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~9\ : std_logic;
SIGNAL \freqdivider_inst|Add2~10_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[8]~49\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[9]~50_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[9]~51\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[10]~52_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~6_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~11\ : std_logic;
SIGNAL \freqdivider_inst|Add2~12_combout\ : std_logic;
SIGNAL \freqdivider_inst|Add2~13\ : std_logic;
SIGNAL \freqdivider_inst|Add2~14_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[10]~53\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[11]~54_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[11]~55\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[12]~56_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~7_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[12]~57\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[13]~58_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[13]~59\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[14]~60_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[14]~61\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[15]~62_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[15]~63\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[16]~64_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[16]~65\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[17]~66_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[17]~67\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[18]~68_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~8_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~9_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[18]~69\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[19]~70_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[19]~71\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[20]~72_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[20]~73\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[21]~74_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[21]~75\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[22]~76_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[22]~77\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[23]~78_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[23]~79\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[24]~80_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[24]~81\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[25]~82_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~10_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~11_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~12_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~13_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~14_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~0_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[25]~83\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[26]~84_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[26]~85\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[27]~86_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~1_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[27]~87\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[28]~88_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[28]~89\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[29]~90_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[29]~91\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[30]~92_combout\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[30]~93\ : std_logic;
SIGNAL \freqdivider_inst|s_counter[31]~94_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~2_combout\ : std_logic;
SIGNAL \freqdivider_inst|Equal0~3_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~0_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~1_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~2_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~3_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~4_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~5_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~6_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~7_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~8_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~9_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~10_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~11_combout\ : std_logic;
SIGNAL \freqdivider_inst|clkOut~q\ : std_logic;
SIGNAL \Key[0]~input_o\ : std_logic;
SIGNAL \CUD|s_count~3_combout\ : std_logic;
SIGNAL \CUD|s_count[1]~5_cout\ : std_logic;
SIGNAL \CUD|s_count[1]~7\ : std_logic;
SIGNAL \CUD|s_count[2]~8_combout\ : std_logic;
SIGNAL \CUD|s_count[2]~9\ : std_logic;
SIGNAL \CUD|s_count[3]~10_combout\ : std_logic;
SIGNAL \sel|output~1_combout\ : std_logic;
SIGNAL \sel|output~2_combout\ : std_logic;
SIGNAL \CUD|s_count[1]~6_combout\ : std_logic;
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
SIGNAL \bin7segdecoder1_inst|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[1]~1_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[2]~2_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[3]~3_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[4]~4_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[5]~5_combout\ : std_logic;
SIGNAL \bin7segdecoder1_inst|decOut_n[6]~6_combout\ : std_logic;
SIGNAL \bin7segdecoder0_inst|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \CUD|s_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \freqdivider_inst|s_counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Key[0]~input_o\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
LEDR <= ww_LEDR;
Hex0 <= ww_Hex0;
Hex1 <= ww_Hex1;
ww_Key <= Key;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Key[0]~input_o\ <= NOT \Key[0]~input_o\;

\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CUD|s_count\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CUD|s_count\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CUD|s_count\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CUD|s_count\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

\Hex0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex0[0]~output_o\);

\Hex0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[1]~1_combout\,
	devoe => ww_devoe,
	o => \Hex0[1]~output_o\);

\Hex0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[2]~2_combout\,
	devoe => ww_devoe,
	o => \Hex0[2]~output_o\);

\Hex0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[3]~3_combout\,
	devoe => ww_devoe,
	o => \Hex0[3]~output_o\);

\Hex0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[4]~4_combout\,
	devoe => ww_devoe,
	o => \Hex0[4]~output_o\);

\Hex0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[5]~5_combout\,
	devoe => ww_devoe,
	o => \Hex0[5]~output_o\);

\Hex0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder1_inst|decOut_n[6]~6_combout\,
	devoe => ww_devoe,
	o => \Hex0[6]~output_o\);

\Hex1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder0_inst|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[0]~output_o\);

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

\Hex1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder0_inst|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[3]~output_o\);

\Hex1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder0_inst|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[4]~output_o\);

\Hex1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7segdecoder0_inst|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \Hex1[5]~output_o\);

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

\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

\freqdivider_inst|s_counter[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[0]~32_combout\ = \freqdivider_inst|s_counter\(0) $ (VCC)
-- \freqdivider_inst|s_counter[0]~33\ = CARRY(\freqdivider_inst|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(0),
	datad => VCC,
	combout => \freqdivider_inst|s_counter[0]~32_combout\,
	cout => \freqdivider_inst|s_counter[0]~33\);

\Key[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Key(1),
	o => \Key[1]~input_o\);

\speedselecter_inst|output[7]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[7]~33_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[7]~33_combout\)) # (!\Key[1]~input_o\ & (((\speedselecter_inst|Equal0~0_combout\) # (\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[7]~33_combout\,
	datab => \speedselecter_inst|Equal0~0_combout\,
	datac => \speedselecter_inst|Equal0~1_combout\,
	datad => \Key[1]~input_o\,
	combout => \speedselecter_inst|output[7]~33_combout\);

\speedselecter_inst|output[14]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[14]~36_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[14]~36_combout\)) # (!\Key[1]~input_o\ & (((\speedselecter_inst|Equal0~0_combout\) # (\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[14]~36_combout\,
	datab => \speedselecter_inst|Equal0~0_combout\,
	datac => \speedselecter_inst|Equal0~1_combout\,
	datad => \Key[1]~input_o\,
	combout => \speedselecter_inst|output[14]~36_combout\);

\speedselecter_inst|output[22]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[22]~38_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[22]~38_combout\)) # (!\Key[1]~input_o\ & (((\speedselecter_inst|Equal0~0_combout\) # (\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[22]~38_combout\,
	datab => \speedselecter_inst|Equal0~0_combout\,
	datac => \speedselecter_inst|Equal0~1_combout\,
	datad => \Key[1]~input_o\,
	combout => \speedselecter_inst|output[22]~38_combout\);

\speedselecter_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|Equal0~1_combout\ = (\speedselecter_inst|output[5]~32_combout\) # (((!\speedselecter_inst|output[22]~38_combout\) # (!\speedselecter_inst|output[14]~36_combout\)) # (!\speedselecter_inst|output[7]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[5]~32_combout\,
	datab => \speedselecter_inst|output[7]~33_combout\,
	datac => \speedselecter_inst|output[14]~36_combout\,
	datad => \speedselecter_inst|output[22]~38_combout\,
	combout => \speedselecter_inst|Equal0~1_combout\);

\speedselecter_inst|output[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[10]~34_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[10]~34_combout\)) # (!\Key[1]~input_o\ & (((!\speedselecter_inst|Equal0~0_combout\ & !\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[10]~34_combout\,
	datab => \Key[1]~input_o\,
	datac => \speedselecter_inst|Equal0~0_combout\,
	datad => \speedselecter_inst|Equal0~1_combout\,
	combout => \speedselecter_inst|output[10]~34_combout\);

\speedselecter_inst|output[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[11]~35_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[11]~35_combout\)) # (!\Key[1]~input_o\ & (((!\speedselecter_inst|Equal0~0_combout\ & !\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[11]~35_combout\,
	datab => \Key[1]~input_o\,
	datac => \speedselecter_inst|Equal0~0_combout\,
	datad => \speedselecter_inst|Equal0~1_combout\,
	combout => \speedselecter_inst|output[11]~35_combout\);

\speedselecter_inst|output[18]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[18]~37_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[18]~37_combout\)) # (!\Key[1]~input_o\ & (((!\speedselecter_inst|Equal0~0_combout\ & !\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[18]~37_combout\,
	datab => \Key[1]~input_o\,
	datac => \speedselecter_inst|Equal0~0_combout\,
	datad => \speedselecter_inst|Equal0~1_combout\,
	combout => \speedselecter_inst|output[18]~37_combout\);

\speedselecter_inst|output[25]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[25]~39_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[25]~39_combout\)) # (!\Key[1]~input_o\ & (((\speedselecter_inst|Equal0~0_combout\) # (\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[25]~39_combout\,
	datab => \speedselecter_inst|Equal0~0_combout\,
	datac => \speedselecter_inst|Equal0~1_combout\,
	datad => \Key[1]~input_o\,
	combout => \speedselecter_inst|output[25]~39_combout\);

\speedselecter_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|Equal0~0_combout\ = (\speedselecter_inst|output[10]~34_combout\) # ((\speedselecter_inst|output[11]~35_combout\) # ((\speedselecter_inst|output[18]~37_combout\) # (!\speedselecter_inst|output[25]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[10]~34_combout\,
	datab => \speedselecter_inst|output[11]~35_combout\,
	datac => \speedselecter_inst|output[18]~37_combout\,
	datad => \speedselecter_inst|output[25]~39_combout\,
	combout => \speedselecter_inst|Equal0~0_combout\);

\speedselecter_inst|output[5]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \speedselecter_inst|output[5]~32_combout\ = (\Key[1]~input_o\ & (\speedselecter_inst|output[5]~32_combout\)) # (!\Key[1]~input_o\ & (((!\speedselecter_inst|Equal0~0_combout\ & !\speedselecter_inst|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[5]~32_combout\,
	datab => \Key[1]~input_o\,
	datac => \speedselecter_inst|Equal0~0_combout\,
	datad => \speedselecter_inst|Equal0~1_combout\,
	combout => \speedselecter_inst|output[5]~32_combout\);

\freqdivider_inst|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~0_combout\ = \speedselecter_inst|output[5]~32_combout\ $ (VCC)
-- \freqdivider_inst|Add2~1\ = CARRY(\speedselecter_inst|output[5]~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[5]~32_combout\,
	datad => VCC,
	combout => \freqdivider_inst|Add2~0_combout\,
	cout => \freqdivider_inst|Add2~1\);

\freqdivider_inst|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~2_combout\ = !\freqdivider_inst|Add2~1\
-- \freqdivider_inst|Add2~3\ = CARRY(!\freqdivider_inst|Add2~1\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \freqdivider_inst|Add2~1\,
	combout => \freqdivider_inst|Add2~2_combout\,
	cout => \freqdivider_inst|Add2~3\);

\freqdivider_inst|s_counter[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[1]~34_combout\ = (\freqdivider_inst|s_counter\(1) & (!\freqdivider_inst|s_counter[0]~33\)) # (!\freqdivider_inst|s_counter\(1) & ((\freqdivider_inst|s_counter[0]~33\) # (GND)))
-- \freqdivider_inst|s_counter[1]~35\ = CARRY((!\freqdivider_inst|s_counter[0]~33\) # (!\freqdivider_inst|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(1),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[0]~33\,
	combout => \freqdivider_inst|s_counter[1]~34_combout\,
	cout => \freqdivider_inst|s_counter[1]~35\);

\freqdivider_inst|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[1]~34_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(1));

\freqdivider_inst|s_counter[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[2]~36_combout\ = (\freqdivider_inst|s_counter\(2) & (\freqdivider_inst|s_counter[1]~35\ $ (GND))) # (!\freqdivider_inst|s_counter\(2) & (!\freqdivider_inst|s_counter[1]~35\ & VCC))
-- \freqdivider_inst|s_counter[2]~37\ = CARRY((\freqdivider_inst|s_counter\(2) & !\freqdivider_inst|s_counter[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(2),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[1]~35\,
	combout => \freqdivider_inst|s_counter[2]~36_combout\,
	cout => \freqdivider_inst|s_counter[2]~37\);

\freqdivider_inst|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[2]~36_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(2));

\freqdivider_inst|s_counter[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[3]~38_combout\ = (\freqdivider_inst|s_counter\(3) & (!\freqdivider_inst|s_counter[2]~37\)) # (!\freqdivider_inst|s_counter\(3) & ((\freqdivider_inst|s_counter[2]~37\) # (GND)))
-- \freqdivider_inst|s_counter[3]~39\ = CARRY((!\freqdivider_inst|s_counter[2]~37\) # (!\freqdivider_inst|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(3),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[2]~37\,
	combout => \freqdivider_inst|s_counter[3]~38_combout\,
	cout => \freqdivider_inst|s_counter[3]~39\);

\freqdivider_inst|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[3]~38_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(3));

\freqdivider_inst|s_counter[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[4]~40_combout\ = (\freqdivider_inst|s_counter\(4) & (\freqdivider_inst|s_counter[3]~39\ $ (GND))) # (!\freqdivider_inst|s_counter\(4) & (!\freqdivider_inst|s_counter[3]~39\ & VCC))
-- \freqdivider_inst|s_counter[4]~41\ = CARRY((\freqdivider_inst|s_counter\(4) & !\freqdivider_inst|s_counter[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(4),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[3]~39\,
	combout => \freqdivider_inst|s_counter[4]~40_combout\,
	cout => \freqdivider_inst|s_counter[4]~41\);

\freqdivider_inst|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[4]~40_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(4));

\freqdivider_inst|s_counter[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[5]~42_combout\ = (\freqdivider_inst|s_counter\(5) & (!\freqdivider_inst|s_counter[4]~41\)) # (!\freqdivider_inst|s_counter\(5) & ((\freqdivider_inst|s_counter[4]~41\) # (GND)))
-- \freqdivider_inst|s_counter[5]~43\ = CARRY((!\freqdivider_inst|s_counter[4]~41\) # (!\freqdivider_inst|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(5),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[4]~41\,
	combout => \freqdivider_inst|s_counter[5]~42_combout\,
	cout => \freqdivider_inst|s_counter[5]~43\);

\freqdivider_inst|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[5]~42_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(5));

\freqdivider_inst|s_counter[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[6]~44_combout\ = (\freqdivider_inst|s_counter\(6) & (\freqdivider_inst|s_counter[5]~43\ $ (GND))) # (!\freqdivider_inst|s_counter\(6) & (!\freqdivider_inst|s_counter[5]~43\ & VCC))
-- \freqdivider_inst|s_counter[6]~45\ = CARRY((\freqdivider_inst|s_counter\(6) & !\freqdivider_inst|s_counter[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(6),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[5]~43\,
	combout => \freqdivider_inst|s_counter[6]~44_combout\,
	cout => \freqdivider_inst|s_counter[6]~45\);

\freqdivider_inst|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[6]~44_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(6));

\freqdivider_inst|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~4_combout\ = (\freqdivider_inst|Add2~0_combout\ & (\freqdivider_inst|s_counter\(5) & (\freqdivider_inst|Add2~2_combout\ $ (!\freqdivider_inst|s_counter\(6))))) # (!\freqdivider_inst|Add2~0_combout\ & 
-- (!\freqdivider_inst|s_counter\(5) & (\freqdivider_inst|Add2~2_combout\ $ (!\freqdivider_inst|s_counter\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~0_combout\,
	datab => \freqdivider_inst|Add2~2_combout\,
	datac => \freqdivider_inst|s_counter\(6),
	datad => \freqdivider_inst|s_counter\(5),
	combout => \freqdivider_inst|Equal0~4_combout\);

\freqdivider_inst|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~4_combout\ = (\speedselecter_inst|output[7]~33_combout\ & ((GND) # (!\freqdivider_inst|Add2~3\))) # (!\speedselecter_inst|output[7]~33_combout\ & (\freqdivider_inst|Add2~3\ $ (GND)))
-- \freqdivider_inst|Add2~5\ = CARRY((\speedselecter_inst|output[7]~33_combout\) # (!\freqdivider_inst|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[7]~33_combout\,
	datad => VCC,
	cin => \freqdivider_inst|Add2~3\,
	combout => \freqdivider_inst|Add2~4_combout\,
	cout => \freqdivider_inst|Add2~5\);

\freqdivider_inst|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~6_combout\ = !\freqdivider_inst|Add2~5\
-- \freqdivider_inst|Add2~7\ = CARRY(!\freqdivider_inst|Add2~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \freqdivider_inst|Add2~5\,
	combout => \freqdivider_inst|Add2~6_combout\,
	cout => \freqdivider_inst|Add2~7\);

\freqdivider_inst|s_counter[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[7]~46_combout\ = (\freqdivider_inst|s_counter\(7) & (!\freqdivider_inst|s_counter[6]~45\)) # (!\freqdivider_inst|s_counter\(7) & ((\freqdivider_inst|s_counter[6]~45\) # (GND)))
-- \freqdivider_inst|s_counter[7]~47\ = CARRY((!\freqdivider_inst|s_counter[6]~45\) # (!\freqdivider_inst|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(7),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[6]~45\,
	combout => \freqdivider_inst|s_counter[7]~46_combout\,
	cout => \freqdivider_inst|s_counter[7]~47\);

\freqdivider_inst|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[7]~46_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(7));

\freqdivider_inst|s_counter[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[8]~48_combout\ = (\freqdivider_inst|s_counter\(8) & (\freqdivider_inst|s_counter[7]~47\ $ (GND))) # (!\freqdivider_inst|s_counter\(8) & (!\freqdivider_inst|s_counter[7]~47\ & VCC))
-- \freqdivider_inst|s_counter[8]~49\ = CARRY((\freqdivider_inst|s_counter\(8) & !\freqdivider_inst|s_counter[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(8),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[7]~47\,
	combout => \freqdivider_inst|s_counter[8]~48_combout\,
	cout => \freqdivider_inst|s_counter[8]~49\);

\freqdivider_inst|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[8]~48_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(8));

\freqdivider_inst|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~5_combout\ = (\freqdivider_inst|Add2~4_combout\ & (\freqdivider_inst|s_counter\(7) & (\freqdivider_inst|Add2~6_combout\ $ (!\freqdivider_inst|s_counter\(8))))) # (!\freqdivider_inst|Add2~4_combout\ & 
-- (!\freqdivider_inst|s_counter\(7) & (\freqdivider_inst|Add2~6_combout\ $ (!\freqdivider_inst|s_counter\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~4_combout\,
	datab => \freqdivider_inst|Add2~6_combout\,
	datac => \freqdivider_inst|s_counter\(8),
	datad => \freqdivider_inst|s_counter\(7),
	combout => \freqdivider_inst|Equal0~5_combout\);

\freqdivider_inst|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~8_combout\ = \freqdivider_inst|Add2~7\ $ (GND)
-- \freqdivider_inst|Add2~9\ = CARRY(!\freqdivider_inst|Add2~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \freqdivider_inst|Add2~7\,
	combout => \freqdivider_inst|Add2~8_combout\,
	cout => \freqdivider_inst|Add2~9\);

\freqdivider_inst|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~10_combout\ = (\speedselecter_inst|output[10]~34_combout\ & (\freqdivider_inst|Add2~9\ & VCC)) # (!\speedselecter_inst|output[10]~34_combout\ & (!\freqdivider_inst|Add2~9\))
-- \freqdivider_inst|Add2~11\ = CARRY((!\speedselecter_inst|output[10]~34_combout\ & !\freqdivider_inst|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[10]~34_combout\,
	datad => VCC,
	cin => \freqdivider_inst|Add2~9\,
	combout => \freqdivider_inst|Add2~10_combout\,
	cout => \freqdivider_inst|Add2~11\);

\freqdivider_inst|s_counter[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[9]~50_combout\ = (\freqdivider_inst|s_counter\(9) & (!\freqdivider_inst|s_counter[8]~49\)) # (!\freqdivider_inst|s_counter\(9) & ((\freqdivider_inst|s_counter[8]~49\) # (GND)))
-- \freqdivider_inst|s_counter[9]~51\ = CARRY((!\freqdivider_inst|s_counter[8]~49\) # (!\freqdivider_inst|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(9),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[8]~49\,
	combout => \freqdivider_inst|s_counter[9]~50_combout\,
	cout => \freqdivider_inst|s_counter[9]~51\);

\freqdivider_inst|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[9]~50_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(9));

\freqdivider_inst|s_counter[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[10]~52_combout\ = (\freqdivider_inst|s_counter\(10) & (\freqdivider_inst|s_counter[9]~51\ $ (GND))) # (!\freqdivider_inst|s_counter\(10) & (!\freqdivider_inst|s_counter[9]~51\ & VCC))
-- \freqdivider_inst|s_counter[10]~53\ = CARRY((\freqdivider_inst|s_counter\(10) & !\freqdivider_inst|s_counter[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(10),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[9]~51\,
	combout => \freqdivider_inst|s_counter[10]~52_combout\,
	cout => \freqdivider_inst|s_counter[10]~53\);

\freqdivider_inst|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[10]~52_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(10));

\freqdivider_inst|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~6_combout\ = (\freqdivider_inst|Add2~8_combout\ & (\freqdivider_inst|s_counter\(9) & (\freqdivider_inst|Add2~10_combout\ $ (!\freqdivider_inst|s_counter\(10))))) # (!\freqdivider_inst|Add2~8_combout\ & 
-- (!\freqdivider_inst|s_counter\(9) & (\freqdivider_inst|Add2~10_combout\ $ (!\freqdivider_inst|s_counter\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~8_combout\,
	datab => \freqdivider_inst|Add2~10_combout\,
	datac => \freqdivider_inst|s_counter\(10),
	datad => \freqdivider_inst|s_counter\(9),
	combout => \freqdivider_inst|Equal0~6_combout\);

\freqdivider_inst|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~12_combout\ = (\speedselecter_inst|output[11]~35_combout\ & ((GND) # (!\freqdivider_inst|Add2~11\))) # (!\speedselecter_inst|output[11]~35_combout\ & (\freqdivider_inst|Add2~11\ $ (GND)))
-- \freqdivider_inst|Add2~13\ = CARRY((\speedselecter_inst|output[11]~35_combout\) # (!\freqdivider_inst|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[11]~35_combout\,
	datad => VCC,
	cin => \freqdivider_inst|Add2~11\,
	combout => \freqdivider_inst|Add2~12_combout\,
	cout => \freqdivider_inst|Add2~13\);

\freqdivider_inst|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Add2~14_combout\ = \freqdivider_inst|Add2~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \freqdivider_inst|Add2~13\,
	combout => \freqdivider_inst|Add2~14_combout\);

\freqdivider_inst|s_counter[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[11]~54_combout\ = (\freqdivider_inst|s_counter\(11) & (!\freqdivider_inst|s_counter[10]~53\)) # (!\freqdivider_inst|s_counter\(11) & ((\freqdivider_inst|s_counter[10]~53\) # (GND)))
-- \freqdivider_inst|s_counter[11]~55\ = CARRY((!\freqdivider_inst|s_counter[10]~53\) # (!\freqdivider_inst|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(11),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[10]~53\,
	combout => \freqdivider_inst|s_counter[11]~54_combout\,
	cout => \freqdivider_inst|s_counter[11]~55\);

\freqdivider_inst|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[11]~54_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(11));

\freqdivider_inst|s_counter[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[12]~56_combout\ = (\freqdivider_inst|s_counter\(12) & (\freqdivider_inst|s_counter[11]~55\ $ (GND))) # (!\freqdivider_inst|s_counter\(12) & (!\freqdivider_inst|s_counter[11]~55\ & VCC))
-- \freqdivider_inst|s_counter[12]~57\ = CARRY((\freqdivider_inst|s_counter\(12) & !\freqdivider_inst|s_counter[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(12),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[11]~55\,
	combout => \freqdivider_inst|s_counter[12]~56_combout\,
	cout => \freqdivider_inst|s_counter[12]~57\);

\freqdivider_inst|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[12]~56_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(12));

\freqdivider_inst|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~7_combout\ = (\freqdivider_inst|Add2~12_combout\ & (\freqdivider_inst|s_counter\(11) & (\freqdivider_inst|Add2~14_combout\ $ (!\freqdivider_inst|s_counter\(12))))) # (!\freqdivider_inst|Add2~12_combout\ & 
-- (!\freqdivider_inst|s_counter\(11) & (\freqdivider_inst|Add2~14_combout\ $ (!\freqdivider_inst|s_counter\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~12_combout\,
	datab => \freqdivider_inst|Add2~14_combout\,
	datac => \freqdivider_inst|s_counter\(12),
	datad => \freqdivider_inst|s_counter\(11),
	combout => \freqdivider_inst|Equal0~7_combout\);

\freqdivider_inst|s_counter[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[13]~58_combout\ = (\freqdivider_inst|s_counter\(13) & (!\freqdivider_inst|s_counter[12]~57\)) # (!\freqdivider_inst|s_counter\(13) & ((\freqdivider_inst|s_counter[12]~57\) # (GND)))
-- \freqdivider_inst|s_counter[13]~59\ = CARRY((!\freqdivider_inst|s_counter[12]~57\) # (!\freqdivider_inst|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(13),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[12]~57\,
	combout => \freqdivider_inst|s_counter[13]~58_combout\,
	cout => \freqdivider_inst|s_counter[13]~59\);

\freqdivider_inst|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[13]~58_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(13));

\freqdivider_inst|s_counter[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[14]~60_combout\ = (\freqdivider_inst|s_counter\(14) & (\freqdivider_inst|s_counter[13]~59\ $ (GND))) # (!\freqdivider_inst|s_counter\(14) & (!\freqdivider_inst|s_counter[13]~59\ & VCC))
-- \freqdivider_inst|s_counter[14]~61\ = CARRY((\freqdivider_inst|s_counter\(14) & !\freqdivider_inst|s_counter[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(14),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[13]~59\,
	combout => \freqdivider_inst|s_counter[14]~60_combout\,
	cout => \freqdivider_inst|s_counter[14]~61\);

\freqdivider_inst|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[14]~60_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(14));

\freqdivider_inst|s_counter[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[15]~62_combout\ = (\freqdivider_inst|s_counter\(15) & (!\freqdivider_inst|s_counter[14]~61\)) # (!\freqdivider_inst|s_counter\(15) & ((\freqdivider_inst|s_counter[14]~61\) # (GND)))
-- \freqdivider_inst|s_counter[15]~63\ = CARRY((!\freqdivider_inst|s_counter[14]~61\) # (!\freqdivider_inst|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(15),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[14]~61\,
	combout => \freqdivider_inst|s_counter[15]~62_combout\,
	cout => \freqdivider_inst|s_counter[15]~63\);

\freqdivider_inst|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[15]~62_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(15));

\freqdivider_inst|s_counter[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[16]~64_combout\ = (\freqdivider_inst|s_counter\(16) & (\freqdivider_inst|s_counter[15]~63\ $ (GND))) # (!\freqdivider_inst|s_counter\(16) & (!\freqdivider_inst|s_counter[15]~63\ & VCC))
-- \freqdivider_inst|s_counter[16]~65\ = CARRY((\freqdivider_inst|s_counter\(16) & !\freqdivider_inst|s_counter[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(16),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[15]~63\,
	combout => \freqdivider_inst|s_counter[16]~64_combout\,
	cout => \freqdivider_inst|s_counter[16]~65\);

\freqdivider_inst|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[16]~64_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(16));

\freqdivider_inst|s_counter[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[17]~66_combout\ = (\freqdivider_inst|s_counter\(17) & (!\freqdivider_inst|s_counter[16]~65\)) # (!\freqdivider_inst|s_counter\(17) & ((\freqdivider_inst|s_counter[16]~65\) # (GND)))
-- \freqdivider_inst|s_counter[17]~67\ = CARRY((!\freqdivider_inst|s_counter[16]~65\) # (!\freqdivider_inst|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(17),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[16]~65\,
	combout => \freqdivider_inst|s_counter[17]~66_combout\,
	cout => \freqdivider_inst|s_counter[17]~67\);

\freqdivider_inst|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[17]~66_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(17));

\freqdivider_inst|s_counter[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[18]~68_combout\ = (\freqdivider_inst|s_counter\(18) & (\freqdivider_inst|s_counter[17]~67\ $ (GND))) # (!\freqdivider_inst|s_counter\(18) & (!\freqdivider_inst|s_counter[17]~67\ & VCC))
-- \freqdivider_inst|s_counter[18]~69\ = CARRY((\freqdivider_inst|s_counter\(18) & !\freqdivider_inst|s_counter[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(18),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[17]~67\,
	combout => \freqdivider_inst|s_counter[18]~68_combout\,
	cout => \freqdivider_inst|s_counter[18]~69\);

\freqdivider_inst|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[18]~68_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(18));

\freqdivider_inst|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~8_combout\ = (\speedselecter_inst|output[14]~36_combout\ & (\freqdivider_inst|s_counter\(14) & (\speedselecter_inst|output[18]~37_combout\ $ (!\freqdivider_inst|s_counter\(18))))) # (!\speedselecter_inst|output[14]~36_combout\ & 
-- (!\freqdivider_inst|s_counter\(14) & (\speedselecter_inst|output[18]~37_combout\ $ (!\freqdivider_inst|s_counter\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[14]~36_combout\,
	datab => \speedselecter_inst|output[18]~37_combout\,
	datac => \freqdivider_inst|s_counter\(18),
	datad => \freqdivider_inst|s_counter\(14),
	combout => \freqdivider_inst|Equal0~8_combout\);

\freqdivider_inst|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~9_combout\ = (\freqdivider_inst|Equal0~5_combout\ & (\freqdivider_inst|Equal0~6_combout\ & (\freqdivider_inst|Equal0~7_combout\ & \freqdivider_inst|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Equal0~5_combout\,
	datab => \freqdivider_inst|Equal0~6_combout\,
	datac => \freqdivider_inst|Equal0~7_combout\,
	datad => \freqdivider_inst|Equal0~8_combout\,
	combout => \freqdivider_inst|Equal0~9_combout\);

\freqdivider_inst|s_counter[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[19]~70_combout\ = (\freqdivider_inst|s_counter\(19) & (!\freqdivider_inst|s_counter[18]~69\)) # (!\freqdivider_inst|s_counter\(19) & ((\freqdivider_inst|s_counter[18]~69\) # (GND)))
-- \freqdivider_inst|s_counter[19]~71\ = CARRY((!\freqdivider_inst|s_counter[18]~69\) # (!\freqdivider_inst|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(19),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[18]~69\,
	combout => \freqdivider_inst|s_counter[19]~70_combout\,
	cout => \freqdivider_inst|s_counter[19]~71\);

\freqdivider_inst|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[19]~70_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(19));

\freqdivider_inst|s_counter[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[20]~72_combout\ = (\freqdivider_inst|s_counter\(20) & (\freqdivider_inst|s_counter[19]~71\ $ (GND))) # (!\freqdivider_inst|s_counter\(20) & (!\freqdivider_inst|s_counter[19]~71\ & VCC))
-- \freqdivider_inst|s_counter[20]~73\ = CARRY((\freqdivider_inst|s_counter\(20) & !\freqdivider_inst|s_counter[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(20),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[19]~71\,
	combout => \freqdivider_inst|s_counter[20]~72_combout\,
	cout => \freqdivider_inst|s_counter[20]~73\);

\freqdivider_inst|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[20]~72_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(20));

\freqdivider_inst|s_counter[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[21]~74_combout\ = (\freqdivider_inst|s_counter\(21) & (!\freqdivider_inst|s_counter[20]~73\)) # (!\freqdivider_inst|s_counter\(21) & ((\freqdivider_inst|s_counter[20]~73\) # (GND)))
-- \freqdivider_inst|s_counter[21]~75\ = CARRY((!\freqdivider_inst|s_counter[20]~73\) # (!\freqdivider_inst|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(21),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[20]~73\,
	combout => \freqdivider_inst|s_counter[21]~74_combout\,
	cout => \freqdivider_inst|s_counter[21]~75\);

\freqdivider_inst|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[21]~74_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(21));

\freqdivider_inst|s_counter[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[22]~76_combout\ = (\freqdivider_inst|s_counter\(22) & (\freqdivider_inst|s_counter[21]~75\ $ (GND))) # (!\freqdivider_inst|s_counter\(22) & (!\freqdivider_inst|s_counter[21]~75\ & VCC))
-- \freqdivider_inst|s_counter[22]~77\ = CARRY((\freqdivider_inst|s_counter\(22) & !\freqdivider_inst|s_counter[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(22),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[21]~75\,
	combout => \freqdivider_inst|s_counter[22]~76_combout\,
	cout => \freqdivider_inst|s_counter[22]~77\);

\freqdivider_inst|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[22]~76_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(22));

\freqdivider_inst|s_counter[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[23]~78_combout\ = (\freqdivider_inst|s_counter\(23) & (!\freqdivider_inst|s_counter[22]~77\)) # (!\freqdivider_inst|s_counter\(23) & ((\freqdivider_inst|s_counter[22]~77\) # (GND)))
-- \freqdivider_inst|s_counter[23]~79\ = CARRY((!\freqdivider_inst|s_counter[22]~77\) # (!\freqdivider_inst|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(23),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[22]~77\,
	combout => \freqdivider_inst|s_counter[23]~78_combout\,
	cout => \freqdivider_inst|s_counter[23]~79\);

\freqdivider_inst|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[23]~78_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(23));

\freqdivider_inst|s_counter[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[24]~80_combout\ = (\freqdivider_inst|s_counter\(24) & (\freqdivider_inst|s_counter[23]~79\ $ (GND))) # (!\freqdivider_inst|s_counter\(24) & (!\freqdivider_inst|s_counter[23]~79\ & VCC))
-- \freqdivider_inst|s_counter[24]~81\ = CARRY((\freqdivider_inst|s_counter\(24) & !\freqdivider_inst|s_counter[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(24),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[23]~79\,
	combout => \freqdivider_inst|s_counter[24]~80_combout\,
	cout => \freqdivider_inst|s_counter[24]~81\);

\freqdivider_inst|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[24]~80_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(24));

\freqdivider_inst|s_counter[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[25]~82_combout\ = (\freqdivider_inst|s_counter\(25) & (!\freqdivider_inst|s_counter[24]~81\)) # (!\freqdivider_inst|s_counter\(25) & ((\freqdivider_inst|s_counter[24]~81\) # (GND)))
-- \freqdivider_inst|s_counter[25]~83\ = CARRY((!\freqdivider_inst|s_counter[24]~81\) # (!\freqdivider_inst|s_counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(25),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[24]~81\,
	combout => \freqdivider_inst|s_counter[25]~82_combout\,
	cout => \freqdivider_inst|s_counter[25]~83\);

\freqdivider_inst|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[25]~82_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(25));

\freqdivider_inst|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~10_combout\ = (\speedselecter_inst|output[22]~38_combout\ & (\freqdivider_inst|s_counter\(22) & (\speedselecter_inst|output[25]~39_combout\ $ (!\freqdivider_inst|s_counter\(25))))) # (!\speedselecter_inst|output[22]~38_combout\ & 
-- (!\freqdivider_inst|s_counter\(22) & (\speedselecter_inst|output[25]~39_combout\ $ (!\freqdivider_inst|s_counter\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[22]~38_combout\,
	datab => \speedselecter_inst|output[25]~39_combout\,
	datac => \freqdivider_inst|s_counter\(25),
	datad => \freqdivider_inst|s_counter\(22),
	combout => \freqdivider_inst|Equal0~10_combout\);

\freqdivider_inst|Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~11_combout\ = (\freqdivider_inst|s_counter\(4) & (\freqdivider_inst|s_counter\(13) & (\freqdivider_inst|s_counter\(17) & \freqdivider_inst|s_counter\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(4),
	datab => \freqdivider_inst|s_counter\(13),
	datac => \freqdivider_inst|s_counter\(17),
	datad => \freqdivider_inst|s_counter\(21),
	combout => \freqdivider_inst|Equal0~11_combout\);

\freqdivider_inst|Equal0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~12_combout\ = (\freqdivider_inst|s_counter\(15) & (\freqdivider_inst|s_counter\(23) & (!\freqdivider_inst|s_counter\(24) & !\freqdivider_inst|s_counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(15),
	datab => \freqdivider_inst|s_counter\(23),
	datac => \freqdivider_inst|s_counter\(24),
	datad => \freqdivider_inst|s_counter\(16),
	combout => \freqdivider_inst|Equal0~12_combout\);

\freqdivider_inst|Equal0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~13_combout\ = (\freqdivider_inst|Equal0~10_combout\ & (\freqdivider_inst|Equal0~11_combout\ & \freqdivider_inst|Equal0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Equal0~10_combout\,
	datab => \freqdivider_inst|Equal0~11_combout\,
	datac => \freqdivider_inst|Equal0~12_combout\,
	combout => \freqdivider_inst|Equal0~13_combout\);

\freqdivider_inst|Equal0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~14_combout\ = (\freqdivider_inst|Equal0~3_combout\ & (\freqdivider_inst|Equal0~4_combout\ & (\freqdivider_inst|Equal0~9_combout\ & \freqdivider_inst|Equal0~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Equal0~3_combout\,
	datab => \freqdivider_inst|Equal0~4_combout\,
	datac => \freqdivider_inst|Equal0~9_combout\,
	datad => \freqdivider_inst|Equal0~13_combout\,
	combout => \freqdivider_inst|Equal0~14_combout\);

\freqdivider_inst|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[0]~32_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(0));

\freqdivider_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~0_combout\ = (\freqdivider_inst|s_counter\(0) & (\freqdivider_inst|s_counter\(1) & (\freqdivider_inst|s_counter\(2) & \freqdivider_inst|s_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(0),
	datab => \freqdivider_inst|s_counter\(1),
	datac => \freqdivider_inst|s_counter\(2),
	datad => \freqdivider_inst|s_counter\(3),
	combout => \freqdivider_inst|Equal0~0_combout\);

\freqdivider_inst|s_counter[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[26]~84_combout\ = (\freqdivider_inst|s_counter\(26) & (\freqdivider_inst|s_counter[25]~83\ $ (GND))) # (!\freqdivider_inst|s_counter\(26) & (!\freqdivider_inst|s_counter[25]~83\ & VCC))
-- \freqdivider_inst|s_counter[26]~85\ = CARRY((\freqdivider_inst|s_counter\(26) & !\freqdivider_inst|s_counter[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(26),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[25]~83\,
	combout => \freqdivider_inst|s_counter[26]~84_combout\,
	cout => \freqdivider_inst|s_counter[26]~85\);

\freqdivider_inst|s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[26]~84_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(26));

\freqdivider_inst|s_counter[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[27]~86_combout\ = (\freqdivider_inst|s_counter\(27) & (!\freqdivider_inst|s_counter[26]~85\)) # (!\freqdivider_inst|s_counter\(27) & ((\freqdivider_inst|s_counter[26]~85\) # (GND)))
-- \freqdivider_inst|s_counter[27]~87\ = CARRY((!\freqdivider_inst|s_counter[26]~85\) # (!\freqdivider_inst|s_counter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(27),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[26]~85\,
	combout => \freqdivider_inst|s_counter[27]~86_combout\,
	cout => \freqdivider_inst|s_counter[27]~87\);

\freqdivider_inst|s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[27]~86_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(27));

\freqdivider_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~1_combout\ = (\freqdivider_inst|s_counter\(19) & (\freqdivider_inst|s_counter\(20) & (!\freqdivider_inst|s_counter\(26) & !\freqdivider_inst|s_counter\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(19),
	datab => \freqdivider_inst|s_counter\(20),
	datac => \freqdivider_inst|s_counter\(26),
	datad => \freqdivider_inst|s_counter\(27),
	combout => \freqdivider_inst|Equal0~1_combout\);

\freqdivider_inst|s_counter[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[28]~88_combout\ = (\freqdivider_inst|s_counter\(28) & (\freqdivider_inst|s_counter[27]~87\ $ (GND))) # (!\freqdivider_inst|s_counter\(28) & (!\freqdivider_inst|s_counter[27]~87\ & VCC))
-- \freqdivider_inst|s_counter[28]~89\ = CARRY((\freqdivider_inst|s_counter\(28) & !\freqdivider_inst|s_counter[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(28),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[27]~87\,
	combout => \freqdivider_inst|s_counter[28]~88_combout\,
	cout => \freqdivider_inst|s_counter[28]~89\);

\freqdivider_inst|s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[28]~88_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(28));

\freqdivider_inst|s_counter[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[29]~90_combout\ = (\freqdivider_inst|s_counter\(29) & (!\freqdivider_inst|s_counter[28]~89\)) # (!\freqdivider_inst|s_counter\(29) & ((\freqdivider_inst|s_counter[28]~89\) # (GND)))
-- \freqdivider_inst|s_counter[29]~91\ = CARRY((!\freqdivider_inst|s_counter[28]~89\) # (!\freqdivider_inst|s_counter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(29),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[28]~89\,
	combout => \freqdivider_inst|s_counter[29]~90_combout\,
	cout => \freqdivider_inst|s_counter[29]~91\);

\freqdivider_inst|s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[29]~90_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(29));

\freqdivider_inst|s_counter[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[30]~92_combout\ = (\freqdivider_inst|s_counter\(30) & (\freqdivider_inst|s_counter[29]~91\ $ (GND))) # (!\freqdivider_inst|s_counter\(30) & (!\freqdivider_inst|s_counter[29]~91\ & VCC))
-- \freqdivider_inst|s_counter[30]~93\ = CARRY((\freqdivider_inst|s_counter\(30) & !\freqdivider_inst|s_counter[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(30),
	datad => VCC,
	cin => \freqdivider_inst|s_counter[29]~91\,
	combout => \freqdivider_inst|s_counter[30]~92_combout\,
	cout => \freqdivider_inst|s_counter[30]~93\);

\freqdivider_inst|s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[30]~92_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(30));

\freqdivider_inst|s_counter[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|s_counter[31]~94_combout\ = \freqdivider_inst|s_counter\(31) $ (\freqdivider_inst|s_counter[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(31),
	cin => \freqdivider_inst|s_counter[30]~93\,
	combout => \freqdivider_inst|s_counter[31]~94_combout\);

\freqdivider_inst|s_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|s_counter[31]~94_combout\,
	sclr => \freqdivider_inst|Equal0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|s_counter\(31));

\freqdivider_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~2_combout\ = (!\freqdivider_inst|s_counter\(28) & (!\freqdivider_inst|s_counter\(29) & (!\freqdivider_inst|s_counter\(30) & !\freqdivider_inst|s_counter\(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(28),
	datab => \freqdivider_inst|s_counter\(29),
	datac => \freqdivider_inst|s_counter\(30),
	datad => \freqdivider_inst|s_counter\(31),
	combout => \freqdivider_inst|Equal0~2_combout\);

\freqdivider_inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|Equal0~3_combout\ = (\freqdivider_inst|Equal0~0_combout\ & (\freqdivider_inst|Equal0~1_combout\ & \freqdivider_inst|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Equal0~0_combout\,
	datab => \freqdivider_inst|Equal0~1_combout\,
	datac => \freqdivider_inst|Equal0~2_combout\,
	combout => \freqdivider_inst|Equal0~3_combout\);

\freqdivider_inst|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~0_combout\ = (\freqdivider_inst|Add2~0_combout\ & (\freqdivider_inst|s_counter\(4) & (\freqdivider_inst|Add2~2_combout\ $ (!\freqdivider_inst|s_counter\(5))))) # (!\freqdivider_inst|Add2~0_combout\ & 
-- (!\freqdivider_inst|s_counter\(4) & (\freqdivider_inst|Add2~2_combout\ $ (!\freqdivider_inst|s_counter\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~0_combout\,
	datab => \freqdivider_inst|Add2~2_combout\,
	datac => \freqdivider_inst|s_counter\(5),
	datad => \freqdivider_inst|s_counter\(4),
	combout => \freqdivider_inst|clkOut~0_combout\);

\freqdivider_inst|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~1_combout\ = (\freqdivider_inst|Add2~4_combout\ & (\freqdivider_inst|s_counter\(6) & (\freqdivider_inst|Add2~6_combout\ $ (!\freqdivider_inst|s_counter\(7))))) # (!\freqdivider_inst|Add2~4_combout\ & 
-- (!\freqdivider_inst|s_counter\(6) & (\freqdivider_inst|Add2~6_combout\ $ (!\freqdivider_inst|s_counter\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~4_combout\,
	datab => \freqdivider_inst|Add2~6_combout\,
	datac => \freqdivider_inst|s_counter\(7),
	datad => \freqdivider_inst|s_counter\(6),
	combout => \freqdivider_inst|clkOut~1_combout\);

\freqdivider_inst|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~2_combout\ = (\freqdivider_inst|Add2~8_combout\ & (\freqdivider_inst|s_counter\(8) & (\freqdivider_inst|Add2~10_combout\ $ (!\freqdivider_inst|s_counter\(9))))) # (!\freqdivider_inst|Add2~8_combout\ & 
-- (!\freqdivider_inst|s_counter\(8) & (\freqdivider_inst|Add2~10_combout\ $ (!\freqdivider_inst|s_counter\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~8_combout\,
	datab => \freqdivider_inst|Add2~10_combout\,
	datac => \freqdivider_inst|s_counter\(9),
	datad => \freqdivider_inst|s_counter\(8),
	combout => \freqdivider_inst|clkOut~2_combout\);

\freqdivider_inst|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~3_combout\ = (\freqdivider_inst|Add2~12_combout\ & (\freqdivider_inst|s_counter\(10) & (\freqdivider_inst|Add2~14_combout\ $ (!\freqdivider_inst|s_counter\(11))))) # (!\freqdivider_inst|Add2~12_combout\ & 
-- (!\freqdivider_inst|s_counter\(10) & (\freqdivider_inst|Add2~14_combout\ $ (!\freqdivider_inst|s_counter\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Add2~12_combout\,
	datab => \freqdivider_inst|Add2~14_combout\,
	datac => \freqdivider_inst|s_counter\(11),
	datad => \freqdivider_inst|s_counter\(10),
	combout => \freqdivider_inst|clkOut~3_combout\);

\freqdivider_inst|clkOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~4_combout\ = (\speedselecter_inst|output[14]~36_combout\ & (\freqdivider_inst|s_counter\(13) & (\speedselecter_inst|output[18]~37_combout\ $ (!\freqdivider_inst|s_counter\(17))))) # (!\speedselecter_inst|output[14]~36_combout\ & 
-- (!\freqdivider_inst|s_counter\(13) & (\speedselecter_inst|output[18]~37_combout\ $ (!\freqdivider_inst|s_counter\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[14]~36_combout\,
	datab => \speedselecter_inst|output[18]~37_combout\,
	datac => \freqdivider_inst|s_counter\(17),
	datad => \freqdivider_inst|s_counter\(13),
	combout => \freqdivider_inst|clkOut~4_combout\);

\freqdivider_inst|clkOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~5_combout\ = (\freqdivider_inst|clkOut~1_combout\ & (\freqdivider_inst|clkOut~2_combout\ & (\freqdivider_inst|clkOut~3_combout\ & \freqdivider_inst|clkOut~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|clkOut~1_combout\,
	datab => \freqdivider_inst|clkOut~2_combout\,
	datac => \freqdivider_inst|clkOut~3_combout\,
	datad => \freqdivider_inst|clkOut~4_combout\,
	combout => \freqdivider_inst|clkOut~5_combout\);

\freqdivider_inst|clkOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~6_combout\ = (\speedselecter_inst|output[22]~38_combout\ & (\freqdivider_inst|s_counter\(21) & (\speedselecter_inst|output[25]~39_combout\ $ (!\freqdivider_inst|s_counter\(24))))) # (!\speedselecter_inst|output[22]~38_combout\ & 
-- (!\freqdivider_inst|s_counter\(21) & (\speedselecter_inst|output[25]~39_combout\ $ (!\freqdivider_inst|s_counter\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \speedselecter_inst|output[22]~38_combout\,
	datab => \speedselecter_inst|output[25]~39_combout\,
	datac => \freqdivider_inst|s_counter\(24),
	datad => \freqdivider_inst|s_counter\(21),
	combout => \freqdivider_inst|clkOut~6_combout\);

\freqdivider_inst|clkOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~7_combout\ = (\freqdivider_inst|s_counter\(12) & (\freqdivider_inst|s_counter\(14) & (\freqdivider_inst|s_counter\(16) & !\freqdivider_inst|s_counter\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(12),
	datab => \freqdivider_inst|s_counter\(14),
	datac => \freqdivider_inst|s_counter\(16),
	datad => \freqdivider_inst|s_counter\(15),
	combout => \freqdivider_inst|clkOut~7_combout\);

\freqdivider_inst|clkOut~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~8_combout\ = (\freqdivider_inst|s_counter\(18) & (\freqdivider_inst|s_counter\(22) & (!\freqdivider_inst|s_counter\(23) & !\freqdivider_inst|s_counter\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|s_counter\(18),
	datab => \freqdivider_inst|s_counter\(22),
	datac => \freqdivider_inst|s_counter\(23),
	datad => \freqdivider_inst|s_counter\(25),
	combout => \freqdivider_inst|clkOut~8_combout\);

\freqdivider_inst|clkOut~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~9_combout\ = (\freqdivider_inst|clkOut~6_combout\ & (\freqdivider_inst|clkOut~7_combout\ & \freqdivider_inst|clkOut~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|clkOut~6_combout\,
	datab => \freqdivider_inst|clkOut~7_combout\,
	datac => \freqdivider_inst|clkOut~8_combout\,
	combout => \freqdivider_inst|clkOut~9_combout\);

\freqdivider_inst|clkOut~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~10_combout\ = (\freqdivider_inst|Equal0~3_combout\ & (\freqdivider_inst|clkOut~0_combout\ & (\freqdivider_inst|clkOut~5_combout\ & \freqdivider_inst|clkOut~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|Equal0~3_combout\,
	datab => \freqdivider_inst|clkOut~0_combout\,
	datac => \freqdivider_inst|clkOut~5_combout\,
	datad => \freqdivider_inst|clkOut~9_combout\,
	combout => \freqdivider_inst|clkOut~10_combout\);

\freqdivider_inst|clkOut~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \freqdivider_inst|clkOut~11_combout\ = (!\freqdivider_inst|Equal0~14_combout\ & ((\freqdivider_inst|clkOut~q\) # (\freqdivider_inst|clkOut~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freqdivider_inst|clkOut~q\,
	datab => \freqdivider_inst|clkOut~10_combout\,
	datad => \freqdivider_inst|Equal0~14_combout\,
	combout => \freqdivider_inst|clkOut~11_combout\);

\freqdivider_inst|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \freqdivider_inst|clkOut~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freqdivider_inst|clkOut~q\);

\Key[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Key(0),
	o => \Key[0]~input_o\);

\CUD|s_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CUD|s_count~3_combout\ = (!\CUD|s_count\(0) & \Key[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(0),
	datad => \Key[0]~input_o\,
	combout => \CUD|s_count~3_combout\);

\CUD|s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \freqdivider_inst|clkOut~q\,
	d => \CUD|s_count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CUD|s_count\(0));

\CUD|s_count[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CUD|s_count[1]~5_cout\ = CARRY(\CUD|s_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(0),
	datad => VCC,
	cout => \CUD|s_count[1]~5_cout\);

\CUD|s_count[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CUD|s_count[1]~6_combout\ = (\sel|output~2_combout\ & ((\CUD|s_count\(1) & (!\CUD|s_count[1]~5_cout\)) # (!\CUD|s_count\(1) & ((\CUD|s_count[1]~5_cout\) # (GND))))) # (!\sel|output~2_combout\ & ((\CUD|s_count\(1) & (\CUD|s_count[1]~5_cout\ & VCC)) # 
-- (!\CUD|s_count\(1) & (!\CUD|s_count[1]~5_cout\))))
-- \CUD|s_count[1]~7\ = CARRY((\sel|output~2_combout\ & ((!\CUD|s_count[1]~5_cout\) # (!\CUD|s_count\(1)))) # (!\sel|output~2_combout\ & (!\CUD|s_count\(1) & !\CUD|s_count[1]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sel|output~2_combout\,
	datab => \CUD|s_count\(1),
	datad => VCC,
	cin => \CUD|s_count[1]~5_cout\,
	combout => \CUD|s_count[1]~6_combout\,
	cout => \CUD|s_count[1]~7\);

\CUD|s_count[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CUD|s_count[2]~8_combout\ = ((\sel|output~2_combout\ $ (\CUD|s_count\(2) $ (\CUD|s_count[1]~7\)))) # (GND)
-- \CUD|s_count[2]~9\ = CARRY((\sel|output~2_combout\ & (\CUD|s_count\(2) & !\CUD|s_count[1]~7\)) # (!\sel|output~2_combout\ & ((\CUD|s_count\(2)) # (!\CUD|s_count[1]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sel|output~2_combout\,
	datab => \CUD|s_count\(2),
	datad => VCC,
	cin => \CUD|s_count[1]~7\,
	combout => \CUD|s_count[2]~8_combout\,
	cout => \CUD|s_count[2]~9\);

\CUD|s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \freqdivider_inst|clkOut~q\,
	d => \CUD|s_count[2]~8_combout\,
	sclr => \ALT_INV_Key[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CUD|s_count\(2));

\CUD|s_count[3]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CUD|s_count[3]~10_combout\ = \sel|output~2_combout\ $ (\CUD|s_count\(3) $ (!\CUD|s_count[2]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sel|output~2_combout\,
	datab => \CUD|s_count\(3),
	cin => \CUD|s_count[2]~9\,
	combout => \CUD|s_count[3]~10_combout\);

\CUD|s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \freqdivider_inst|clkOut~q\,
	d => \CUD|s_count[3]~10_combout\,
	sclr => \ALT_INV_Key[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CUD|s_count\(3));

\sel|output~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sel|output~1_combout\ = (\CUD|s_count\(1) & (\CUD|s_count\(2) & \CUD|s_count\(3))) # (!\CUD|s_count\(1) & ((\CUD|s_count\(2)) # (\CUD|s_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(1),
	datab => \CUD|s_count\(2),
	datac => \CUD|s_count\(3),
	combout => \sel|output~1_combout\);

\sel|output~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sel|output~2_combout\ = (\CUD|s_count\(0) & (\sel|output~2_combout\ & ((!\sel|output~1_combout\) # (!\CUD|s_count\(1))))) # (!\CUD|s_count\(0) & ((\sel|output~2_combout\) # ((!\CUD|s_count\(1) & !\sel|output~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(0),
	datab => \sel|output~2_combout\,
	datac => \CUD|s_count\(1),
	datad => \sel|output~1_combout\,
	combout => \sel|output~2_combout\);

\CUD|s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \freqdivider_inst|clkOut~q\,
	d => \CUD|s_count[1]~6_combout\,
	sclr => \ALT_INV_Key[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CUD|s_count\(1));

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \CUD|s_count\(1) $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\CUD|s_count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(1),
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\CUD|s_count\(2) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\CUD|s_count\(2) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\CUD|s_count\(2) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(2),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\CUD|s_count\(3) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\CUD|s_count\(3) & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\CUD|s_count\(3) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(3),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

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

\Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\CUD|s_count\(3))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(3),
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

\Mod0|auto_generated|divider|divider|StageOut[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\CUD|s_count\(1))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(1),
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\);

\Mod0|auto_generated|divider|divider|StageOut[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\CUD|s_count\(2))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(2),
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\);

\bin7segdecoder1_inst|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[0]~0_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\CUD|s_count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\CUD|s_count\(0) $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \CUD|s_count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	combout => \bin7segdecoder1_inst|decOut_n[0]~0_combout\);

\bin7segdecoder1_inst|decOut_n[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[1]~1_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & ((\CUD|s_count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\)) # (!\CUD|s_count\(0) & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ (\CUD|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \CUD|s_count\(0),
	combout => \bin7segdecoder1_inst|decOut_n[1]~1_combout\);

\bin7segdecoder1_inst|decOut_n[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\) # 
-- (!\CUD|s_count\(0))))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & !\CUD|s_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \CUD|s_count\(0),
	combout => \bin7segdecoder1_inst|decOut_n[2]~2_combout\);

\bin7segdecoder1_inst|decOut_n[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[3]~3_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & ((\CUD|s_count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)) # (!\CUD|s_count\(0) & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\)))) # (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\CUD|s_count\(0) $ (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \CUD|s_count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	combout => \bin7segdecoder1_inst|decOut_n[3]~3_combout\);

\bin7segdecoder1_inst|decOut_n[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[4]~4_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\CUD|s_count\(0) & ((!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & ((!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (\CUD|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(0),
	datab => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	combout => \bin7segdecoder1_inst|decOut_n[4]~4_combout\);

\bin7segdecoder1_inst|decOut_n[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[5]~5_combout\ = (\CUD|s_count\(0) & (\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ $ (((\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))) # (!\CUD|s_count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(0),
	datab => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	combout => \bin7segdecoder1_inst|decOut_n[5]~5_combout\);

\bin7segdecoder1_inst|decOut_n[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder1_inst|decOut_n[6]~6_combout\ = (\CUD|s_count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\)))) # (!\CUD|s_count\(0) & (!\Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datab => \CUD|s_count\(0),
	datac => \Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	combout => \bin7segdecoder1_inst|decOut_n[6]~6_combout\);

\bin7segdecoder0_inst|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7segdecoder0_inst|decOut_n[0]~0_combout\ = (\CUD|s_count\(3) & ((\CUD|s_count\(1)) # (\CUD|s_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CUD|s_count\(3),
	datab => \CUD|s_count\(1),
	datac => \CUD|s_count\(2),
	combout => \bin7segdecoder0_inst|decOut_n[0]~0_combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

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


