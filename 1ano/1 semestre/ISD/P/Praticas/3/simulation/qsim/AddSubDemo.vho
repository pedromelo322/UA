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

-- DATE "11/25/2022 12:17:06"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	AddSubDemo IS
    PORT (
	Cout : OUT std_logic;
	A0 : IN std_logic;
	A1 : IN std_logic;
	A2 : IN std_logic;
	A3 : IN std_logic;
	K : IN std_logic;
	B3 : IN std_logic;
	B2 : IN std_logic;
	B1 : IN std_logic;
	B0 : IN std_logic;
	S2 : OUT std_logic;
	S3 : OUT std_logic;
	S1 : OUT std_logic;
	S0 : OUT std_logic;
	Overflow : OUT std_logic
	);
END AddSubDemo;

ARCHITECTURE structure OF AddSubDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Cout : std_logic;
SIGNAL ww_A0 : std_logic;
SIGNAL ww_A1 : std_logic;
SIGNAL ww_A2 : std_logic;
SIGNAL ww_A3 : std_logic;
SIGNAL ww_K : std_logic;
SIGNAL ww_B3 : std_logic;
SIGNAL ww_B2 : std_logic;
SIGNAL ww_B1 : std_logic;
SIGNAL ww_B0 : std_logic;
SIGNAL ww_S2 : std_logic;
SIGNAL ww_S3 : std_logic;
SIGNAL ww_S1 : std_logic;
SIGNAL ww_S0 : std_logic;
SIGNAL ww_Overflow : std_logic;
SIGNAL \Cout~output_o\ : std_logic;
SIGNAL \S2~output_o\ : std_logic;
SIGNAL \S3~output_o\ : std_logic;
SIGNAL \S1~output_o\ : std_logic;
SIGNAL \S0~output_o\ : std_logic;
SIGNAL \Overflow~output_o\ : std_logic;
SIGNAL \A3~input_o\ : std_logic;
SIGNAL \A2~input_o\ : std_logic;
SIGNAL \A1~input_o\ : std_logic;
SIGNAL \A0~input_o\ : std_logic;
SIGNAL \K~input_o\ : std_logic;
SIGNAL \B0~input_o\ : std_logic;
SIGNAL \inst|inst|inst1~0_combout\ : std_logic;
SIGNAL \B1~input_o\ : std_logic;
SIGNAL \inst|inst1|inst1~combout\ : std_logic;
SIGNAL \B2~input_o\ : std_logic;
SIGNAL \inst|inst2|inst1~combout\ : std_logic;
SIGNAL \B3~input_o\ : std_logic;
SIGNAL \inst|inst3|inst1~combout\ : std_logic;
SIGNAL \inst|inst2|inst4~combout\ : std_logic;
SIGNAL \inst|inst3|inst4~combout\ : std_logic;
SIGNAL \inst|inst1|inst4~combout\ : std_logic;
SIGNAL \inst|inst|inst~combout\ : std_logic;
SIGNAL \inst|inst8~combout\ : std_logic;

BEGIN

Cout <= ww_Cout;
ww_A0 <= A0;
ww_A1 <= A1;
ww_A2 <= A2;
ww_A3 <= A3;
ww_K <= K;
ww_B3 <= B3;
ww_B2 <= B2;
ww_B1 <= B1;
ww_B0 <= B0;
S2 <= ww_S2;
S3 <= ww_S3;
S1 <= ww_S1;
S0 <= ww_S0;
Overflow <= ww_Overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Cout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst1~combout\,
	devoe => ww_devoe,
	o => \Cout~output_o\);

\S2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst4~combout\,
	devoe => ww_devoe,
	o => \S2~output_o\);

\S3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst4~combout\,
	devoe => ww_devoe,
	o => \S3~output_o\);

\S1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~combout\,
	devoe => ww_devoe,
	o => \S1~output_o\);

\S0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst~combout\,
	devoe => ww_devoe,
	o => \S0~output_o\);

\Overflow~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst8~combout\,
	devoe => ww_devoe,
	o => \Overflow~output_o\);

\A3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A3,
	o => \A3~input_o\);

\A2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A2,
	o => \A2~input_o\);

\A1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A1,
	o => \A1~input_o\);

\A0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A0,
	o => \A0~input_o\);

\K~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_K,
	o => \K~input_o\);

\B0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B0,
	o => \B0~input_o\);

\inst|inst|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst|inst1~0_combout\ = (\B0~input_o\ & (\A0~input_o\)) # (!\B0~input_o\ & ((\K~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datab => \K~input_o\,
	datad => \B0~input_o\,
	combout => \inst|inst|inst1~0_combout\);

\B1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B1,
	o => \B1~input_o\);

\inst|inst1|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1~combout\ = (\A1~input_o\ & ((\inst|inst|inst1~0_combout\) # (\K~input_o\ $ (\B1~input_o\)))) # (!\A1~input_o\ & (\inst|inst|inst1~0_combout\ & (\K~input_o\ $ (\B1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \inst|inst|inst1~0_combout\,
	datac => \K~input_o\,
	datad => \B1~input_o\,
	combout => \inst|inst1|inst1~combout\);

\B2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B2,
	o => \B2~input_o\);

\inst|inst2|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst1~combout\ = (\A2~input_o\ & ((\inst|inst1|inst1~combout\) # (\K~input_o\ $ (\B2~input_o\)))) # (!\A2~input_o\ & (\inst|inst1|inst1~combout\ & (\K~input_o\ $ (\B2~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A2~input_o\,
	datab => \inst|inst1|inst1~combout\,
	datac => \K~input_o\,
	datad => \B2~input_o\,
	combout => \inst|inst2|inst1~combout\);

\B3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B3,
	o => \B3~input_o\);

\inst|inst3|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst1~combout\ = (\A3~input_o\ & ((\inst|inst2|inst1~combout\) # (\K~input_o\ $ (\B3~input_o\)))) # (!\A3~input_o\ & (\inst|inst2|inst1~combout\ & (\K~input_o\ $ (\B3~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A3~input_o\,
	datab => \inst|inst2|inst1~combout\,
	datac => \K~input_o\,
	datad => \B3~input_o\,
	combout => \inst|inst3|inst1~combout\);

\inst|inst2|inst4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst4~combout\ = \K~input_o\ $ (\A2~input_o\ $ (\B2~input_o\ $ (\inst|inst1|inst1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \K~input_o\,
	datab => \A2~input_o\,
	datac => \B2~input_o\,
	datad => \inst|inst1|inst1~combout\,
	combout => \inst|inst2|inst4~combout\);

\inst|inst3|inst4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst4~combout\ = \A3~input_o\ $ (\K~input_o\ $ (\B3~input_o\ $ (\inst|inst2|inst1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A3~input_o\,
	datab => \K~input_o\,
	datac => \B3~input_o\,
	datad => \inst|inst2|inst1~combout\,
	combout => \inst|inst3|inst4~combout\);

\inst|inst1|inst4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~combout\ = \K~input_o\ $ (\A1~input_o\ $ (\B1~input_o\ $ (\inst|inst|inst1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \K~input_o\,
	datab => \A1~input_o\,
	datac => \B1~input_o\,
	datad => \inst|inst|inst1~0_combout\,
	combout => \inst|inst1|inst4~combout\);

\inst|inst|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst|inst~combout\ = \A0~input_o\ $ (\B0~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A0~input_o\,
	datad => \B0~input_o\,
	combout => \inst|inst|inst~combout\);

\inst|inst8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst8~combout\ = (\inst|inst2|inst1~combout\ & (!\A3~input_o\ & (\K~input_o\ $ (!\B3~input_o\)))) # (!\inst|inst2|inst1~combout\ & (\A3~input_o\ & (\K~input_o\ $ (\B3~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \K~input_o\,
	datab => \B3~input_o\,
	datac => \inst|inst2|inst1~combout\,
	datad => \A3~input_o\,
	combout => \inst|inst8~combout\);

ww_Cout <= \Cout~output_o\;

ww_S2 <= \S2~output_o\;

ww_S3 <= \S3~output_o\;

ww_S1 <= \S1~output_o\;

ww_S0 <= \S0~output_o\;

ww_Overflow <= \Overflow~output_o\;
END structure;


