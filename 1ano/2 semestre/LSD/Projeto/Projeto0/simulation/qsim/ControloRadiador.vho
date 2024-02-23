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

-- DATE "05/28/2023 17:11:04"

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

ENTITY 	SimulAmbiente IS
    PORT (
	clk : IN std_logic;
	up_down : IN std_logic;
	counter : OUT std_logic_vector(11 DOWNTO 0)
	);
END SimulAmbiente;

ARCHITECTURE structure OF SimulAmbiente IS
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
SIGNAL ww_up_down : std_logic;
SIGNAL ww_counter : std_logic_vector(11 DOWNTO 0);
SIGNAL \counter[0]~output_o\ : std_logic;
SIGNAL \counter[1]~output_o\ : std_logic;
SIGNAL \counter[2]~output_o\ : std_logic;
SIGNAL \counter[3]~output_o\ : std_logic;
SIGNAL \counter[4]~output_o\ : std_logic;
SIGNAL \counter[5]~output_o\ : std_logic;
SIGNAL \counter[6]~output_o\ : std_logic;
SIGNAL \counter[7]~output_o\ : std_logic;
SIGNAL \counter[8]~output_o\ : std_logic;
SIGNAL \counter[9]~output_o\ : std_logic;
SIGNAL \counter[10]~output_o\ : std_logic;
SIGNAL \counter[11]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \counter_int[0]~12_combout\ : std_logic;
SIGNAL \up_down~input_o\ : std_logic;
SIGNAL \counter_int[0]~13\ : std_logic;
SIGNAL \counter_int[1]~23_combout\ : std_logic;
SIGNAL \counter_int[1]~24\ : std_logic;
SIGNAL \counter_int[2]~25_combout\ : std_logic;
SIGNAL \counter_int[0]~14_combout\ : std_logic;
SIGNAL \counter_int[2]~26\ : std_logic;
SIGNAL \counter_int[3]~27_combout\ : std_logic;
SIGNAL \counter_int[3]~28\ : std_logic;
SIGNAL \counter_int[4]~29_combout\ : std_logic;
SIGNAL \counter_int[4]~30\ : std_logic;
SIGNAL \counter_int[5]~31_combout\ : std_logic;
SIGNAL \counter_int[5]~32\ : std_logic;
SIGNAL \counter_int[6]~33_combout\ : std_logic;
SIGNAL \counter_int[0]~15_combout\ : std_logic;
SIGNAL \counter_int[6]~34\ : std_logic;
SIGNAL \counter_int[7]~35_combout\ : std_logic;
SIGNAL \counter_int[7]~36\ : std_logic;
SIGNAL \counter_int[8]~37_combout\ : std_logic;
SIGNAL \counter_int[8]~38\ : std_logic;
SIGNAL \counter_int[9]~39_combout\ : std_logic;
SIGNAL \counter_int[9]~40\ : std_logic;
SIGNAL \counter_int[10]~41_combout\ : std_logic;
SIGNAL \counter_int[0]~16_combout\ : std_logic;
SIGNAL \counter_int[10]~42\ : std_logic;
SIGNAL \counter_int[11]~43_combout\ : std_logic;
SIGNAL \counter_int[0]~17_combout\ : std_logic;
SIGNAL \counter_int[0]~18_combout\ : std_logic;
SIGNAL \counter_int[0]~19_combout\ : std_logic;
SIGNAL \counter_int[0]~20_combout\ : std_logic;
SIGNAL \counter_int[0]~21_combout\ : std_logic;
SIGNAL \counter_int[0]~22_combout\ : std_logic;
SIGNAL \counter[0]~reg0_q\ : std_logic;
SIGNAL \counter[1]~reg0_q\ : std_logic;
SIGNAL \counter[2]~reg0_q\ : std_logic;
SIGNAL \counter[3]~reg0_q\ : std_logic;
SIGNAL \counter[4]~reg0_q\ : std_logic;
SIGNAL \counter[5]~reg0_q\ : std_logic;
SIGNAL \counter[6]~reg0_q\ : std_logic;
SIGNAL \counter[7]~reg0_q\ : std_logic;
SIGNAL \counter[8]~reg0_q\ : std_logic;
SIGNAL \counter[9]~reg0_q\ : std_logic;
SIGNAL \counter[10]~reg0_q\ : std_logic;
SIGNAL \counter[11]~reg0_q\ : std_logic;
SIGNAL counter_int : std_logic_vector(11 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_up_down <= up_down;
counter <= ww_counter;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\counter[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[0]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[0]~output_o\);

\counter[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[1]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[1]~output_o\);

\counter[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[2]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[2]~output_o\);

\counter[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[3]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[3]~output_o\);

\counter[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[4]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[4]~output_o\);

\counter[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[5]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[5]~output_o\);

\counter[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[6]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[6]~output_o\);

\counter[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[7]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[7]~output_o\);

\counter[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[8]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[8]~output_o\);

\counter[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[9]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[9]~output_o\);

\counter[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[10]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[10]~output_o\);

\counter[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \counter[11]~reg0_q\,
	devoe => ww_devoe,
	o => \counter[11]~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\counter_int[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~12_combout\ = counter_int(0) $ (VCC)
-- \counter_int[0]~13\ = CARRY(counter_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(0),
	datad => VCC,
	combout => \counter_int[0]~12_combout\,
	cout => \counter_int[0]~13\);

\up_down~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_up_down,
	o => \up_down~input_o\);

\counter_int[1]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[1]~23_combout\ = (\up_down~input_o\ & ((counter_int(1) & (!\counter_int[0]~13\)) # (!counter_int(1) & ((\counter_int[0]~13\) # (GND))))) # (!\up_down~input_o\ & ((counter_int(1) & (\counter_int[0]~13\ & VCC)) # (!counter_int(1) & 
-- (!\counter_int[0]~13\))))
-- \counter_int[1]~24\ = CARRY((\up_down~input_o\ & ((!\counter_int[0]~13\) # (!counter_int(1)))) # (!\up_down~input_o\ & (!counter_int(1) & !\counter_int[0]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(1),
	datad => VCC,
	cin => \counter_int[0]~13\,
	combout => \counter_int[1]~23_combout\,
	cout => \counter_int[1]~24\);

\counter_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[1]~23_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(1));

\counter_int[2]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[2]~25_combout\ = ((\up_down~input_o\ $ (counter_int(2) $ (\counter_int[1]~24\)))) # (GND)
-- \counter_int[2]~26\ = CARRY((\up_down~input_o\ & (counter_int(2) & !\counter_int[1]~24\)) # (!\up_down~input_o\ & ((counter_int(2)) # (!\counter_int[1]~24\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(2),
	datad => VCC,
	cin => \counter_int[1]~24\,
	combout => \counter_int[2]~25_combout\,
	cout => \counter_int[2]~26\);

\counter_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[2]~25_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(2));

\counter_int[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~14_combout\ = (!counter_int(0) & (!counter_int(1) & (!counter_int(2) & !\up_down~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(0),
	datab => counter_int(1),
	datac => counter_int(2),
	datad => \up_down~input_o\,
	combout => \counter_int[0]~14_combout\);

\counter_int[3]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[3]~27_combout\ = (\up_down~input_o\ & ((counter_int(3) & (!\counter_int[2]~26\)) # (!counter_int(3) & ((\counter_int[2]~26\) # (GND))))) # (!\up_down~input_o\ & ((counter_int(3) & (\counter_int[2]~26\ & VCC)) # (!counter_int(3) & 
-- (!\counter_int[2]~26\))))
-- \counter_int[3]~28\ = CARRY((\up_down~input_o\ & ((!\counter_int[2]~26\) # (!counter_int(3)))) # (!\up_down~input_o\ & (!counter_int(3) & !\counter_int[2]~26\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(3),
	datad => VCC,
	cin => \counter_int[2]~26\,
	combout => \counter_int[3]~27_combout\,
	cout => \counter_int[3]~28\);

\counter_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[3]~27_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(3));

\counter_int[4]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[4]~29_combout\ = ((\up_down~input_o\ $ (counter_int(4) $ (\counter_int[3]~28\)))) # (GND)
-- \counter_int[4]~30\ = CARRY((\up_down~input_o\ & (counter_int(4) & !\counter_int[3]~28\)) # (!\up_down~input_o\ & ((counter_int(4)) # (!\counter_int[3]~28\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(4),
	datad => VCC,
	cin => \counter_int[3]~28\,
	combout => \counter_int[4]~29_combout\,
	cout => \counter_int[4]~30\);

\counter_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[4]~29_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(4));

\counter_int[5]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[5]~31_combout\ = (\up_down~input_o\ & ((counter_int(5) & (!\counter_int[4]~30\)) # (!counter_int(5) & ((\counter_int[4]~30\) # (GND))))) # (!\up_down~input_o\ & ((counter_int(5) & (\counter_int[4]~30\ & VCC)) # (!counter_int(5) & 
-- (!\counter_int[4]~30\))))
-- \counter_int[5]~32\ = CARRY((\up_down~input_o\ & ((!\counter_int[4]~30\) # (!counter_int(5)))) # (!\up_down~input_o\ & (!counter_int(5) & !\counter_int[4]~30\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(5),
	datad => VCC,
	cin => \counter_int[4]~30\,
	combout => \counter_int[5]~31_combout\,
	cout => \counter_int[5]~32\);

\counter_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[5]~31_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(5));

\counter_int[6]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[6]~33_combout\ = ((\up_down~input_o\ $ (counter_int(6) $ (\counter_int[5]~32\)))) # (GND)
-- \counter_int[6]~34\ = CARRY((\up_down~input_o\ & (counter_int(6) & !\counter_int[5]~32\)) # (!\up_down~input_o\ & ((counter_int(6)) # (!\counter_int[5]~32\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(6),
	datad => VCC,
	cin => \counter_int[5]~32\,
	combout => \counter_int[6]~33_combout\,
	cout => \counter_int[6]~34\);

\counter_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[6]~33_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(6));

\counter_int[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~15_combout\ = (!counter_int(3) & (!counter_int(4) & (!counter_int(5) & !counter_int(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(3),
	datab => counter_int(4),
	datac => counter_int(5),
	datad => counter_int(6),
	combout => \counter_int[0]~15_combout\);

\counter_int[7]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[7]~35_combout\ = (\up_down~input_o\ & ((counter_int(7) & (!\counter_int[6]~34\)) # (!counter_int(7) & ((\counter_int[6]~34\) # (GND))))) # (!\up_down~input_o\ & ((counter_int(7) & (\counter_int[6]~34\ & VCC)) # (!counter_int(7) & 
-- (!\counter_int[6]~34\))))
-- \counter_int[7]~36\ = CARRY((\up_down~input_o\ & ((!\counter_int[6]~34\) # (!counter_int(7)))) # (!\up_down~input_o\ & (!counter_int(7) & !\counter_int[6]~34\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(7),
	datad => VCC,
	cin => \counter_int[6]~34\,
	combout => \counter_int[7]~35_combout\,
	cout => \counter_int[7]~36\);

\counter_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[7]~35_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(7));

\counter_int[8]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[8]~37_combout\ = ((\up_down~input_o\ $ (counter_int(8) $ (\counter_int[7]~36\)))) # (GND)
-- \counter_int[8]~38\ = CARRY((\up_down~input_o\ & (counter_int(8) & !\counter_int[7]~36\)) # (!\up_down~input_o\ & ((counter_int(8)) # (!\counter_int[7]~36\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(8),
	datad => VCC,
	cin => \counter_int[7]~36\,
	combout => \counter_int[8]~37_combout\,
	cout => \counter_int[8]~38\);

\counter_int[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[8]~37_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(8));

\counter_int[9]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[9]~39_combout\ = (\up_down~input_o\ & ((counter_int(9) & (!\counter_int[8]~38\)) # (!counter_int(9) & ((\counter_int[8]~38\) # (GND))))) # (!\up_down~input_o\ & ((counter_int(9) & (\counter_int[8]~38\ & VCC)) # (!counter_int(9) & 
-- (!\counter_int[8]~38\))))
-- \counter_int[9]~40\ = CARRY((\up_down~input_o\ & ((!\counter_int[8]~38\) # (!counter_int(9)))) # (!\up_down~input_o\ & (!counter_int(9) & !\counter_int[8]~38\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(9),
	datad => VCC,
	cin => \counter_int[8]~38\,
	combout => \counter_int[9]~39_combout\,
	cout => \counter_int[9]~40\);

\counter_int[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[9]~39_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(9));

\counter_int[10]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[10]~41_combout\ = ((\up_down~input_o\ $ (counter_int(10) $ (\counter_int[9]~40\)))) # (GND)
-- \counter_int[10]~42\ = CARRY((\up_down~input_o\ & (counter_int(10) & !\counter_int[9]~40\)) # (!\up_down~input_o\ & ((counter_int(10)) # (!\counter_int[9]~40\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(10),
	datad => VCC,
	cin => \counter_int[9]~40\,
	combout => \counter_int[10]~41_combout\,
	cout => \counter_int[10]~42\);

\counter_int[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[10]~41_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(10));

\counter_int[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~16_combout\ = (!counter_int(7) & (!counter_int(8) & (!counter_int(9) & !counter_int(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(7),
	datab => counter_int(8),
	datac => counter_int(9),
	datad => counter_int(10),
	combout => \counter_int[0]~16_combout\);

\counter_int[11]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[11]~43_combout\ = \up_down~input_o\ $ (counter_int(11) $ (!\counter_int[10]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(11),
	cin => \counter_int[10]~42\,
	combout => \counter_int[11]~43_combout\);

\counter_int[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[11]~43_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(11));

\counter_int[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~17_combout\ = (\counter_int[0]~14_combout\ & (\counter_int[0]~15_combout\ & (\counter_int[0]~16_combout\ & !counter_int(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter_int[0]~14_combout\,
	datab => \counter_int[0]~15_combout\,
	datac => \counter_int[0]~16_combout\,
	datad => counter_int(11),
	combout => \counter_int[0]~17_combout\);

\counter_int[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~18_combout\ = (counter_int(0) & (counter_int(1) & (counter_int(2) & \up_down~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(0),
	datab => counter_int(1),
	datac => counter_int(2),
	datad => \up_down~input_o\,
	combout => \counter_int[0]~18_combout\);

\counter_int[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~19_combout\ = (counter_int(3) & (counter_int(4) & (counter_int(5) & counter_int(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(3),
	datab => counter_int(4),
	datac => counter_int(5),
	datad => counter_int(6),
	combout => \counter_int[0]~19_combout\);

\counter_int[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~20_combout\ = (counter_int(7) & (counter_int(8) & (\counter_int[0]~18_combout\ & \counter_int[0]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_int(7),
	datab => counter_int(8),
	datac => \counter_int[0]~18_combout\,
	datad => \counter_int[0]~19_combout\,
	combout => \counter_int[0]~20_combout\);

\counter_int[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~21_combout\ = (\up_down~input_o\ & ((counter_int(9)) # ((counter_int(10)) # (counter_int(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \up_down~input_o\,
	datab => counter_int(9),
	datac => counter_int(10),
	datad => counter_int(11),
	combout => \counter_int[0]~21_combout\);

\counter_int[0]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_int[0]~22_combout\ = (\counter_int[0]~17_combout\) # ((\counter_int[0]~20_combout\) # (\counter_int[0]~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter_int[0]~17_combout\,
	datab => \counter_int[0]~20_combout\,
	datac => \counter_int[0]~21_combout\,
	combout => \counter_int[0]~22_combout\);

\counter_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counter_int[0]~12_combout\,
	sclr => \counter_int[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_int(0));

\counter[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[0]~reg0_q\);

\counter[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[1]~reg0_q\);

\counter[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[2]~reg0_q\);

\counter[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[3]~reg0_q\);

\counter[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[4]~reg0_q\);

\counter[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[5]~reg0_q\);

\counter[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[6]~reg0_q\);

\counter[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[7]~reg0_q\);

\counter[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[8]~reg0_q\);

\counter[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[9]~reg0_q\);

\counter[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[10]~reg0_q\);

\counter[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => counter_int(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter[11]~reg0_q\);

ww_counter(0) <= \counter[0]~output_o\;

ww_counter(1) <= \counter[1]~output_o\;

ww_counter(2) <= \counter[2]~output_o\;

ww_counter(3) <= \counter[3]~output_o\;

ww_counter(4) <= \counter[4]~output_o\;

ww_counter(5) <= \counter[5]~output_o\;

ww_counter(6) <= \counter[6]~output_o\;

ww_counter(7) <= \counter[7]~output_o\;

ww_counter(8) <= \counter[8]~output_o\;

ww_counter(9) <= \counter[9]~output_o\;

ww_counter(10) <= \counter[10]~output_o\;

ww_counter(11) <= \counter[11]~output_o\;
END structure;


