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

-- DATE "04/04/2023 18:01:07"

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

ENTITY 	NAND2Gate IS
    PORT (
	InPort0 : IN std_logic;
	InPort1 : IN std_logic;
	OutPort : BUFFER std_logic
	);
END NAND2Gate;

ARCHITECTURE structure OF NAND2Gate IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_InPort0 : std_logic;
SIGNAL ww_InPort1 : std_logic;
SIGNAL ww_OutPort : std_logic;
SIGNAL \OutPort~output_o\ : std_logic;
SIGNAL \InPort0~input_o\ : std_logic;
SIGNAL \InPort1~input_o\ : std_logic;
SIGNAL \and_gate|OutPort~combout\ : std_logic;
SIGNAL \and_gate|ALT_INV_OutPort~combout\ : std_logic;

BEGIN

ww_InPort0 <= InPort0;
ww_InPort1 <= InPort1;
OutPort <= ww_OutPort;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\and_gate|ALT_INV_OutPort~combout\ <= NOT \and_gate|OutPort~combout\;

\OutPort~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \and_gate|ALT_INV_OutPort~combout\,
	devoe => ww_devoe,
	o => \OutPort~output_o\);

\InPort0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort0,
	o => \InPort0~input_o\);

\InPort1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort1,
	o => \InPort1~input_o\);

\and_gate|OutPort\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_gate|OutPort~combout\ = (\InPort0~input_o\ & \InPort1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort0~input_o\,
	datab => \InPort1~input_o\,
	combout => \and_gate|OutPort~combout\);

ww_OutPort <= \OutPort~output_o\;
END structure;


