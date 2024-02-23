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

-- DATE "05/27/2023 19:23:09"

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

ENTITY 	ControloOnOff IS
    PORT (
	clk : IN std_logic;
	Tref : IN std_logic_vector(4 DOWNTO 0);
	Tamb : IN std_logic_vector(11 DOWNTO 0);
	OnOff : OUT std_logic
	);
END ControloOnOff;

ARCHITECTURE structure OF ControloOnOff IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_Tref : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Tamb : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_OnOff : std_logic;
SIGNAL \OnOff~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \Tamb[8]~input_o\ : std_logic;
SIGNAL \Tamb[9]~input_o\ : std_logic;
SIGNAL \Tamb[10]~input_o\ : std_logic;
SIGNAL \Tamb[11]~input_o\ : std_logic;
SIGNAL \s_onoff~0_combout\ : std_logic;
SIGNAL \Tamb[5]~input_o\ : std_logic;
SIGNAL \Tref[4]~input_o\ : std_logic;
SIGNAL \Tref[3]~input_o\ : std_logic;
SIGNAL \Tref[2]~input_o\ : std_logic;
SIGNAL \Tref[1]~input_o\ : std_logic;
SIGNAL \Tref[0]~input_o\ : std_logic;
SIGNAL \Toff[1]~6\ : std_logic;
SIGNAL \Toff[2]~8\ : std_logic;
SIGNAL \Toff[3]~10\ : std_logic;
SIGNAL \Toff[4]~12\ : std_logic;
SIGNAL \Toff[5]~13_combout\ : std_logic;
SIGNAL \Tamb[4]~input_o\ : std_logic;
SIGNAL \Toff[4]~11_combout\ : std_logic;
SIGNAL \Tamb[3]~input_o\ : std_logic;
SIGNAL \Toff[3]~9_combout\ : std_logic;
SIGNAL \Tamb[2]~input_o\ : std_logic;
SIGNAL \Toff[2]~7_combout\ : std_logic;
SIGNAL \Tamb[1]~input_o\ : std_logic;
SIGNAL \Toff[1]~5_combout\ : std_logic;
SIGNAL \Tamb[0]~input_o\ : std_logic;
SIGNAL \Toff[0]~15_combout\ : std_logic;
SIGNAL \LessThan1~1_cout\ : std_logic;
SIGNAL \LessThan1~3_cout\ : std_logic;
SIGNAL \LessThan1~5_cout\ : std_logic;
SIGNAL \LessThan1~7_cout\ : std_logic;
SIGNAL \LessThan1~9_cout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \Tamb[6]~input_o\ : std_logic;
SIGNAL \Tamb[7]~input_o\ : std_logic;
SIGNAL \s_onoff~1_combout\ : std_logic;
SIGNAL \Ton[1]~6_cout\ : std_logic;
SIGNAL \Ton[1]~8\ : std_logic;
SIGNAL \Ton[2]~10\ : std_logic;
SIGNAL \Ton[3]~12\ : std_logic;
SIGNAL \Ton[4]~14\ : std_logic;
SIGNAL \Ton[10]~15_combout\ : std_logic;
SIGNAL \Ton[4]~13_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Ton[3]~11_combout\ : std_logic;
SIGNAL \Ton[2]~9_combout\ : std_logic;
SIGNAL \Ton[1]~7_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \s_onoff~2_combout\ : std_logic;
SIGNAL \s_onoff~q\ : std_logic;
SIGNAL \OnOff~reg0_q\ : std_logic;
SIGNAL Toff : std_logic_vector(11 DOWNTO 0);
SIGNAL Ton : std_logic_vector(11 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_Tref <= Tref;
ww_Tamb <= Tamb;
OnOff <= ww_OnOff;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\OnOff~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \OnOff~reg0_q\,
	devoe => ww_devoe,
	o => \OnOff~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\Tamb[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(8),
	o => \Tamb[8]~input_o\);

\Tamb[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(9),
	o => \Tamb[9]~input_o\);

\Tamb[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(10),
	o => \Tamb[10]~input_o\);

\Tamb[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(11),
	o => \Tamb[11]~input_o\);

\s_onoff~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_onoff~0_combout\ = (!\Tamb[8]~input_o\ & (!\Tamb[9]~input_o\ & (!\Tamb[10]~input_o\ & !\Tamb[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[8]~input_o\,
	datab => \Tamb[9]~input_o\,
	datac => \Tamb[10]~input_o\,
	datad => \Tamb[11]~input_o\,
	combout => \s_onoff~0_combout\);

\Tamb[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(5),
	o => \Tamb[5]~input_o\);

\Tref[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tref(4),
	o => \Tref[4]~input_o\);

\Tref[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tref(3),
	o => \Tref[3]~input_o\);

\Tref[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tref(2),
	o => \Tref[2]~input_o\);

\Tref[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tref(1),
	o => \Tref[1]~input_o\);

\Tref[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tref(0),
	o => \Tref[0]~input_o\);

\Toff[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[1]~5_combout\ = (\Tref[1]~input_o\ & (\Tref[0]~input_o\ $ (VCC))) # (!\Tref[1]~input_o\ & (\Tref[0]~input_o\ & VCC))
-- \Toff[1]~6\ = CARRY((\Tref[1]~input_o\ & \Tref[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[1]~input_o\,
	datab => \Tref[0]~input_o\,
	datad => VCC,
	combout => \Toff[1]~5_combout\,
	cout => \Toff[1]~6\);

\Toff[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[2]~7_combout\ = (\Tref[2]~input_o\ & (\Toff[1]~6\ & VCC)) # (!\Tref[2]~input_o\ & (!\Toff[1]~6\))
-- \Toff[2]~8\ = CARRY((!\Tref[2]~input_o\ & !\Toff[1]~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[2]~input_o\,
	datad => VCC,
	cin => \Toff[1]~6\,
	combout => \Toff[2]~7_combout\,
	cout => \Toff[2]~8\);

\Toff[3]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[3]~9_combout\ = (\Tref[3]~input_o\ & (\Toff[2]~8\ $ (GND))) # (!\Tref[3]~input_o\ & (!\Toff[2]~8\ & VCC))
-- \Toff[3]~10\ = CARRY((\Tref[3]~input_o\ & !\Toff[2]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[3]~input_o\,
	datad => VCC,
	cin => \Toff[2]~8\,
	combout => \Toff[3]~9_combout\,
	cout => \Toff[3]~10\);

\Toff[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[4]~11_combout\ = (\Tref[4]~input_o\ & (!\Toff[3]~10\)) # (!\Tref[4]~input_o\ & ((\Toff[3]~10\) # (GND)))
-- \Toff[4]~12\ = CARRY((!\Toff[3]~10\) # (!\Tref[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[4]~input_o\,
	datad => VCC,
	cin => \Toff[3]~10\,
	combout => \Toff[4]~11_combout\,
	cout => \Toff[4]~12\);

\Toff[5]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[5]~13_combout\ = !\Toff[4]~12\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Toff[4]~12\,
	combout => \Toff[5]~13_combout\);

\Toff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(5));

\Tamb[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(4),
	o => \Tamb[4]~input_o\);

\Toff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[4]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(4));

\Tamb[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(3),
	o => \Tamb[3]~input_o\);

\Toff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(3));

\Tamb[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(2),
	o => \Tamb[2]~input_o\);

\Toff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(2));

\Tamb[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(1),
	o => \Tamb[1]~input_o\);

\Toff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(1));

\Tamb[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(0),
	o => \Tamb[0]~input_o\);

\Toff[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Toff[0]~15_combout\ = !\Tref[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[0]~input_o\,
	combout => \Toff[0]~15_combout\);

\Toff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Toff[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Toff(0));

\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_cout\ = CARRY((!\Tamb[0]~input_o\ & Toff(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[0]~input_o\,
	datab => Toff(0),
	datad => VCC,
	cout => \LessThan1~1_cout\);

\LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~3_cout\ = CARRY((\Tamb[1]~input_o\ & ((!\LessThan1~1_cout\) # (!Toff(1)))) # (!\Tamb[1]~input_o\ & (!Toff(1) & !\LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[1]~input_o\,
	datab => Toff(1),
	datad => VCC,
	cin => \LessThan1~1_cout\,
	cout => \LessThan1~3_cout\);

\LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~5_cout\ = CARRY((\Tamb[2]~input_o\ & (Toff(2) & !\LessThan1~3_cout\)) # (!\Tamb[2]~input_o\ & ((Toff(2)) # (!\LessThan1~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[2]~input_o\,
	datab => Toff(2),
	datad => VCC,
	cin => \LessThan1~3_cout\,
	cout => \LessThan1~5_cout\);

\LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~7_cout\ = CARRY((\Tamb[3]~input_o\ & ((!\LessThan1~5_cout\) # (!Toff(3)))) # (!\Tamb[3]~input_o\ & (!Toff(3) & !\LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[3]~input_o\,
	datab => Toff(3),
	datad => VCC,
	cin => \LessThan1~5_cout\,
	cout => \LessThan1~7_cout\);

\LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~9_cout\ = CARRY((\Tamb[4]~input_o\ & (Toff(4) & !\LessThan1~7_cout\)) # (!\Tamb[4]~input_o\ & ((Toff(4)) # (!\LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[4]~input_o\,
	datab => Toff(4),
	datad => VCC,
	cin => \LessThan1~7_cout\,
	cout => \LessThan1~9_cout\);

\LessThan1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (\Tamb[5]~input_o\ & (Toff(5) & \LessThan1~9_cout\)) # (!\Tamb[5]~input_o\ & ((Toff(5)) # (\LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[5]~input_o\,
	datab => Toff(5),
	cin => \LessThan1~9_cout\,
	combout => \LessThan1~10_combout\);

\Tamb[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(6),
	o => \Tamb[6]~input_o\);

\Tamb[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Tamb(7),
	o => \Tamb[7]~input_o\);

\s_onoff~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_onoff~1_combout\ = (\s_onoff~q\ & (\LessThan1~10_combout\ & (!\Tamb[6]~input_o\ & !\Tamb[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_onoff~q\,
	datab => \LessThan1~10_combout\,
	datac => \Tamb[6]~input_o\,
	datad => \Tamb[7]~input_o\,
	combout => \s_onoff~1_combout\);

\Ton[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[1]~6_cout\ = CARRY(\Tref[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[0]~input_o\,
	datad => VCC,
	cout => \Ton[1]~6_cout\);

\Ton[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[1]~7_combout\ = (\Tref[1]~input_o\ & (\Ton[1]~6_cout\ & VCC)) # (!\Tref[1]~input_o\ & (!\Ton[1]~6_cout\))
-- \Ton[1]~8\ = CARRY((!\Tref[1]~input_o\ & !\Ton[1]~6_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[1]~input_o\,
	datad => VCC,
	cin => \Ton[1]~6_cout\,
	combout => \Ton[1]~7_combout\,
	cout => \Ton[1]~8\);

\Ton[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[2]~9_combout\ = (\Tref[2]~input_o\ & (\Ton[1]~8\ $ (GND))) # (!\Tref[2]~input_o\ & (!\Ton[1]~8\ & VCC))
-- \Ton[2]~10\ = CARRY((\Tref[2]~input_o\ & !\Ton[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[2]~input_o\,
	datad => VCC,
	cin => \Ton[1]~8\,
	combout => \Ton[2]~9_combout\,
	cout => \Ton[2]~10\);

\Ton[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[3]~11_combout\ = (\Tref[3]~input_o\ & (\Ton[2]~10\ & VCC)) # (!\Tref[3]~input_o\ & (!\Ton[2]~10\))
-- \Ton[3]~12\ = CARRY((!\Tref[3]~input_o\ & !\Ton[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[3]~input_o\,
	datad => VCC,
	cin => \Ton[2]~10\,
	combout => \Ton[3]~11_combout\,
	cout => \Ton[3]~12\);

\Ton[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[4]~13_combout\ = (\Tref[4]~input_o\ & ((GND) # (!\Ton[3]~12\))) # (!\Tref[4]~input_o\ & (\Ton[3]~12\ $ (GND)))
-- \Ton[4]~14\ = CARRY((\Tref[4]~input_o\) # (!\Ton[3]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Tref[4]~input_o\,
	datad => VCC,
	cin => \Ton[3]~12\,
	combout => \Ton[4]~13_combout\,
	cout => \Ton[4]~14\);

\Ton[10]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ton[10]~15_combout\ = !\Ton[4]~14\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Ton[4]~14\,
	combout => \Ton[10]~15_combout\);

\Ton[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Ton[10]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Ton(10));

\Ton[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Ton[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Ton(4));

\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\Tamb[5]~input_o\ & (((\Tamb[4]~input_o\ & !Ton(4))) # (!Ton(10)))) # (!\Tamb[5]~input_o\ & (!Ton(10) & (\Tamb[4]~input_o\ & !Ton(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[5]~input_o\,
	datab => Ton(10),
	datac => \Tamb[4]~input_o\,
	datad => Ton(4),
	combout => \LessThan0~0_combout\);

\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (\Tamb[6]~input_o\ & (((\Tamb[7]~input_o\ & \LessThan0~0_combout\)) # (!Ton(10)))) # (!\Tamb[6]~input_o\ & (!Ton(10) & ((\Tamb[7]~input_o\) # (\LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[6]~input_o\,
	datab => \Tamb[7]~input_o\,
	datac => Ton(10),
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~1_combout\);

\Ton[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Ton[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Ton(3));

\Ton[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Ton[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Ton(2));

\Ton[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Ton[1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Ton(1));

\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (\Tamb[1]~input_o\ & (((\Tamb[0]~input_o\ & !Toff(0))) # (!Ton(1)))) # (!\Tamb[1]~input_o\ & (\Tamb[0]~input_o\ & (!Toff(0) & !Ton(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[1]~input_o\,
	datab => \Tamb[0]~input_o\,
	datac => Toff(0),
	datad => Ton(1),
	combout => \LessThan0~2_combout\);

\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\Tamb[2]~input_o\ & ((\LessThan0~2_combout\) # (!Ton(2)))) # (!\Tamb[2]~input_o\ & (!Ton(2) & \LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[2]~input_o\,
	datab => Ton(2),
	datac => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

\LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (Ton(10) & (((!\Tamb[7]~input_o\) # (!\Tamb[6]~input_o\)) # (!\Tamb[5]~input_o\))) # (!Ton(10) & ((\Tamb[5]~input_o\) # ((\Tamb[6]~input_o\) # (\Tamb[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Ton(10),
	datab => \Tamb[5]~input_o\,
	datac => \Tamb[6]~input_o\,
	datad => \Tamb[7]~input_o\,
	combout => \LessThan0~4_combout\);

\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!\LessThan0~4_combout\ & ((\Tamb[3]~input_o\ & ((\LessThan0~3_combout\) # (!Ton(3)))) # (!\Tamb[3]~input_o\ & (!Ton(3) & \LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[3]~input_o\,
	datab => Ton(3),
	datac => \LessThan0~3_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LessThan0~5_combout\);

\LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (\LessThan0~1_combout\) # ((\LessThan0~5_combout\ & (\Tamb[4]~input_o\ $ (!Ton(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[4]~input_o\,
	datab => Ton(4),
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~5_combout\,
	combout => \LessThan0~6_combout\);

\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (\Tamb[8]~input_o\ & (\Tamb[9]~input_o\ & (\Tamb[10]~input_o\ & \Tamb[11]~input_o\))) # (!\Tamb[8]~input_o\ & ((\Tamb[9]~input_o\) # ((\Tamb[10]~input_o\) # (\Tamb[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Tamb[8]~input_o\,
	datab => \Tamb[9]~input_o\,
	datac => \Tamb[10]~input_o\,
	datad => \Tamb[11]~input_o\,
	combout => \LessThan0~7_combout\);

\LessThan0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (\LessThan0~6_combout\ & ((Ton(10) & (\Tamb[8]~input_o\ & \LessThan0~7_combout\)) # (!Ton(10) & (!\Tamb[8]~input_o\ & !\LessThan0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Ton(10),
	datab => \LessThan0~6_combout\,
	datac => \Tamb[8]~input_o\,
	datad => \LessThan0~7_combout\,
	combout => \LessThan0~8_combout\);

\s_onoff~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_onoff~2_combout\ = (\s_onoff~0_combout\ & ((\s_onoff~1_combout\) # ((!\LessThan0~8_combout\)))) # (!\s_onoff~0_combout\ & (((Ton(10) & !\LessThan0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_onoff~0_combout\,
	datab => \s_onoff~1_combout\,
	datac => Ton(10),
	datad => \LessThan0~8_combout\,
	combout => \s_onoff~2_combout\);

s_onoff : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_onoff~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_onoff~q\);

\OnOff~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_onoff~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \OnOff~reg0_q\);

ww_OnOff <= \OnOff~output_o\;
END structure;


