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

-- DATE "11/22/2022 14:13:02"

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

ENTITY 	DecoderDemo2 IS
    PORT (
	y15 : OUT std_logic;
	E1 : IN std_logic;
	E0_L : IN std_logic;
	X3 : IN std_logic;
	X2 : IN std_logic;
	X1 : IN std_logic;
	X0 : IN std_logic;
	y14 : OUT std_logic;
	y13 : OUT std_logic;
	y12 : OUT std_logic;
	y11 : OUT std_logic;
	y10 : OUT std_logic;
	y9 : OUT std_logic;
	y8 : OUT std_logic;
	y7 : OUT std_logic;
	y6 : OUT std_logic;
	y4 : OUT std_logic;
	y3 : OUT std_logic;
	y2 : OUT std_logic;
	y1 : OUT std_logic;
	y0 : OUT std_logic;
	y5 : OUT std_logic
	);
END DecoderDemo2;

ARCHITECTURE structure OF DecoderDemo2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y15 : std_logic;
SIGNAL ww_E1 : std_logic;
SIGNAL ww_E0_L : std_logic;
SIGNAL ww_X3 : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_y14 : std_logic;
SIGNAL ww_y13 : std_logic;
SIGNAL ww_y12 : std_logic;
SIGNAL ww_y11 : std_logic;
SIGNAL ww_y10 : std_logic;
SIGNAL ww_y9 : std_logic;
SIGNAL ww_y8 : std_logic;
SIGNAL ww_y7 : std_logic;
SIGNAL ww_y6 : std_logic;
SIGNAL ww_y4 : std_logic;
SIGNAL ww_y3 : std_logic;
SIGNAL ww_y2 : std_logic;
SIGNAL ww_y1 : std_logic;
SIGNAL ww_y0 : std_logic;
SIGNAL ww_y5 : std_logic;
SIGNAL \y15~output_o\ : std_logic;
SIGNAL \y14~output_o\ : std_logic;
SIGNAL \y13~output_o\ : std_logic;
SIGNAL \y12~output_o\ : std_logic;
SIGNAL \y11~output_o\ : std_logic;
SIGNAL \y10~output_o\ : std_logic;
SIGNAL \y9~output_o\ : std_logic;
SIGNAL \y8~output_o\ : std_logic;
SIGNAL \y7~output_o\ : std_logic;
SIGNAL \y6~output_o\ : std_logic;
SIGNAL \y4~output_o\ : std_logic;
SIGNAL \y3~output_o\ : std_logic;
SIGNAL \y2~output_o\ : std_logic;
SIGNAL \y1~output_o\ : std_logic;
SIGNAL \y0~output_o\ : std_logic;
SIGNAL \y5~output_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \X0~input_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \inst|inst1|inst4~3_combout\ : std_logic;
SIGNAL \E0_L~input_o\ : std_logic;
SIGNAL \X3~input_o\ : std_logic;
SIGNAL \E1~input_o\ : std_logic;
SIGNAL \inst|inst1|inst4~192_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~15_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~193_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~27_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~194_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~39_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~195_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~51_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~196_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~63_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~197_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~75_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~198_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~87_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~199_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~200_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~201_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~202_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~203_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~204_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~205_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~206_combout\ : std_logic;
SIGNAL \inst|inst1|inst4~207_combout\ : std_logic;

BEGIN

y15 <= ww_y15;
ww_E1 <= E1;
ww_E0_L <= E0_L;
ww_X3 <= X3;
ww_X2 <= X2;
ww_X1 <= X1;
ww_X0 <= X0;
y14 <= ww_y14;
y13 <= ww_y13;
y12 <= ww_y12;
y11 <= ww_y11;
y10 <= ww_y10;
y9 <= ww_y9;
y8 <= ww_y8;
y7 <= ww_y7;
y6 <= ww_y6;
y4 <= ww_y4;
y3 <= ww_y3;
y2 <= ww_y2;
y1 <= ww_y1;
y0 <= ww_y0;
y5 <= ww_y5;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\y15~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~192_combout\,
	devoe => ww_devoe,
	o => \y15~output_o\);

\y14~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~193_combout\,
	devoe => ww_devoe,
	o => \y14~output_o\);

\y13~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~194_combout\,
	devoe => ww_devoe,
	o => \y13~output_o\);

\y12~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~195_combout\,
	devoe => ww_devoe,
	o => \y12~output_o\);

\y11~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~196_combout\,
	devoe => ww_devoe,
	o => \y11~output_o\);

\y10~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~197_combout\,
	devoe => ww_devoe,
	o => \y10~output_o\);

\y9~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~198_combout\,
	devoe => ww_devoe,
	o => \y9~output_o\);

\y8~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~199_combout\,
	devoe => ww_devoe,
	o => \y8~output_o\);

\y7~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~200_combout\,
	devoe => ww_devoe,
	o => \y7~output_o\);

\y6~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~201_combout\,
	devoe => ww_devoe,
	o => \y6~output_o\);

\y4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~202_combout\,
	devoe => ww_devoe,
	o => \y4~output_o\);

\y3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~203_combout\,
	devoe => ww_devoe,
	o => \y3~output_o\);

\y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~204_combout\,
	devoe => ww_devoe,
	o => \y2~output_o\);

\y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~205_combout\,
	devoe => ww_devoe,
	o => \y1~output_o\);

\y0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~206_combout\,
	devoe => ww_devoe,
	o => \y0~output_o\);

\y5~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst4~207_combout\,
	devoe => ww_devoe,
	o => \y5~output_o\);

\X1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

\X0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X0,
	o => \X0~input_o\);

\X2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

\inst|inst1|inst4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~3_combout\ = (\X1~input_o\ & (\X0~input_o\ & \X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~3_combout\);

\E0_L~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E0_L,
	o => \E0_L~input_o\);

\X3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X3,
	o => \X3~input_o\);

\E1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E1,
	o => \E1~input_o\);

\inst|inst1|inst4~192\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~192_combout\ = (\inst|inst1|inst4~3_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~3_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~192_combout\);

\inst|inst1|inst4~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~15_combout\ = (\X1~input_o\ & (!\X0~input_o\ & \X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~15_combout\);

\inst|inst1|inst4~193\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~193_combout\ = (\inst|inst1|inst4~15_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~15_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~193_combout\);

\inst|inst1|inst4~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~27_combout\ = (!\X1~input_o\ & (\X0~input_o\ & \X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~27_combout\);

\inst|inst1|inst4~194\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~194_combout\ = (\inst|inst1|inst4~27_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~27_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~194_combout\);

\inst|inst1|inst4~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~39_combout\ = (!\X1~input_o\ & (!\X0~input_o\ & \X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~39_combout\);

\inst|inst1|inst4~195\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~195_combout\ = (\inst|inst1|inst4~39_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~39_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~195_combout\);

\inst|inst1|inst4~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~51_combout\ = (\X1~input_o\ & (\X0~input_o\ & !\X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~51_combout\);

\inst|inst1|inst4~196\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~196_combout\ = (\inst|inst1|inst4~51_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~51_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~196_combout\);

\inst|inst1|inst4~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~63_combout\ = (\X1~input_o\ & (!\X0~input_o\ & !\X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~63_combout\);

\inst|inst1|inst4~197\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~197_combout\ = (\inst|inst1|inst4~63_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~63_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~197_combout\);

\inst|inst1|inst4~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~75_combout\ = (!\X1~input_o\ & (\X0~input_o\ & !\X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~75_combout\);

\inst|inst1|inst4~198\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~198_combout\ = (\inst|inst1|inst4~75_combout\ & (!\E0_L~input_o\ & (\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~75_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~198_combout\);

\inst|inst1|inst4~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~87_combout\ = (!\X1~input_o\ & (!\X0~input_o\ & !\X2~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	combout => \inst|inst1|inst4~87_combout\);

\inst|inst1|inst4~199\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~199_combout\ = (\E0_L~input_o\) # (((\inst|inst1|inst4~87_combout\ & \X3~input_o\)) # (!\E1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~87_combout\,
	datab => \X3~input_o\,
	datac => \E0_L~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~199_combout\);

\inst|inst1|inst4~200\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~200_combout\ = (\inst|inst1|inst4~3_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~3_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~200_combout\);

\inst|inst1|inst4~201\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~201_combout\ = (\inst|inst1|inst4~15_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~15_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~201_combout\);

\inst|inst1|inst4~202\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~202_combout\ = (\inst|inst1|inst4~39_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~39_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~202_combout\);

\inst|inst1|inst4~203\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~203_combout\ = (\inst|inst1|inst4~51_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~51_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~203_combout\);

\inst|inst1|inst4~204\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~204_combout\ = (\inst|inst1|inst4~63_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~63_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~204_combout\);

\inst|inst1|inst4~205\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~205_combout\ = (\inst|inst1|inst4~75_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~75_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~205_combout\);

\inst|inst1|inst4~206\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~206_combout\ = (\inst|inst1|inst4~87_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~87_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~206_combout\);

\inst|inst1|inst4~207\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst4~207_combout\ = (\inst|inst1|inst4~27_combout\ & (!\E0_L~input_o\ & (!\X3~input_o\ & \E1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1|inst4~27_combout\,
	datab => \E0_L~input_o\,
	datac => \X3~input_o\,
	datad => \E1~input_o\,
	combout => \inst|inst1|inst4~207_combout\);

ww_y15 <= \y15~output_o\;

ww_y14 <= \y14~output_o\;

ww_y13 <= \y13~output_o\;

ww_y12 <= \y12~output_o\;

ww_y11 <= \y11~output_o\;

ww_y10 <= \y10~output_o\;

ww_y9 <= \y9~output_o\;

ww_y8 <= \y8~output_o\;

ww_y7 <= \y7~output_o\;

ww_y6 <= \y6~output_o\;

ww_y4 <= \y4~output_o\;

ww_y3 <= \y3~output_o\;

ww_y2 <= \y2~output_o\;

ww_y1 <= \y1~output_o\;

ww_y0 <= \y0~output_o\;

ww_y5 <= \y5~output_o\;
END structure;


