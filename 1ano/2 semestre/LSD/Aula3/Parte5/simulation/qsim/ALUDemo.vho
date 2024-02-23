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

-- DATE "04/07/2023 16:35:08"

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

ENTITY 	ALU4 IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Sel : IN std_logic_vector(2 DOWNTO 0);
	Z : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ALU4;

ARCHITECTURE structure OF ALU4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Sel : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Z : std_logic_vector(7 DOWNTO 0);
SIGNAL \Z[0]~output_o\ : std_logic;
SIGNAL \Z[1]~output_o\ : std_logic;
SIGNAL \Z[2]~output_o\ : std_logic;
SIGNAL \Z[3]~output_o\ : std_logic;
SIGNAL \Z[4]~output_o\ : std_logic;
SIGNAL \Z[5]~output_o\ : std_logic;
SIGNAL \Z[6]~output_o\ : std_logic;
SIGNAL \Z[7]~output_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[5]~2_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ : std_logic;
SIGNAL \Add3~1_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ : std_logic;
SIGNAL \Add2~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~11_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~7_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \s_z~0_combout\ : std_logic;
SIGNAL \Sel[2]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Sel[0]~input_o\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~3_cout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Sel[1]~input_o\ : std_logic;
SIGNAL \Z~1_combout\ : std_logic;
SIGNAL \Z~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_1|_~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[5]~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[10]~3_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[9]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[8]~5_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|quotient[0]~5_combout\ : std_logic;
SIGNAL \Z~21_combout\ : std_logic;
SIGNAL \Z~22_combout\ : std_logic;
SIGNAL \Z~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Z~3_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[0]~0_combout\ : std_logic;
SIGNAL \Z~4_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \Z~19_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|diff_signs~combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|quotient[1]~2_combout\ : std_logic;
SIGNAL \Z~20_combout\ : std_logic;
SIGNAL \Z~5_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[0]~1\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[1]~2_combout\ : std_logic;
SIGNAL \Z~6_combout\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|quotient[2]~3_combout\ : std_logic;
SIGNAL \Z~17_combout\ : std_logic;
SIGNAL \Z~18_combout\ : std_logic;
SIGNAL \Z~7_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[0]~0_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|cs3a[1]~0_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[1]~3\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[2]~4_combout\ : std_logic;
SIGNAL \Z~8_combout\ : std_logic;
SIGNAL \Z~9_combout\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~23_combout\ : std_logic;
SIGNAL \Z~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|op_1~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|quotient[3]~4_combout\ : std_logic;
SIGNAL \RESULT~0_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[0]~1\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[1]~2_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[2]~5\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[3]~6_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Z~11_combout\ : std_logic;
SIGNAL \Z~12_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[1]~3\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[2]~4_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[3]~7\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[4]~8_combout\ : std_logic;
SIGNAL \Z~13_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[2]~5\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[3]~6_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[4]~9\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[5]~10_combout\ : std_logic;
SIGNAL \Z~14_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[3]~7\ : std_logic;
SIGNAL \Mult0|auto_generated|add10_result[4]~8_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[5]~11\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[6]~12_combout\ : std_logic;
SIGNAL \Z~15_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[6]~13\ : std_logic;
SIGNAL \Mult0|auto_generated|add6_result[7]~14_combout\ : std_logic;
SIGNAL \Z~16_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|le4a\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Div0|auto_generated|divider|divider|sel\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \Mult0|auto_generated|le5a\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mult0|auto_generated|le2a\ : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_A <= A;
ww_B <= B;
ww_Sel <= Sel;
Z <= ww_Z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Z[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~4_combout\,
	devoe => ww_devoe,
	o => \Z[0]~output_o\);

\Z[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~6_combout\,
	devoe => ww_devoe,
	o => \Z[1]~output_o\);

\Z[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~8_combout\,
	devoe => ww_devoe,
	o => \Z[2]~output_o\);

\Z[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~12_combout\,
	devoe => ww_devoe,
	o => \Z[3]~output_o\);

\Z[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~13_combout\,
	devoe => ww_devoe,
	o => \Z[4]~output_o\);

\Z[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~14_combout\,
	devoe => ww_devoe,
	o => \Z[5]~output_o\);

\Z[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~15_combout\,
	devoe => ww_devoe,
	o => \Z[6]~output_o\);

\Z[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Z~16_combout\,
	devoe => ww_devoe,
	o => \Z[7]~output_o\);

\B[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

\B[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

\B[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

\B[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \B[2]~input_o\ $ ((((!\B[1]~input_o\ & !\B[0]~input_o\)) # (!\B[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Add3~0_combout\);

\Mod0|auto_generated|divider|divider|StageOut[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[5]~2_combout\ = ((\B[1]~input_o\ & ((!\B[3]~input_o\) # (!\B[2]~input_o\))) # (!\B[1]~input_o\ & ((\B[2]~input_o\) # (\B[3]~input_o\)))) # (!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[5]~2_combout\);

\A[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

\A[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

\A[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

\A[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

\Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\ = (\A[3]~input_o\ & (!\A[0]~input_o\ & (!\A[1]~input_o\ & !\A[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \A[0]~input_o\,
	datac => \A[1]~input_o\,
	datad => \A[2]~input_o\,
	combout => \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\);

\Mod0|auto_generated|divider|divider|StageOut[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[5]~2_combout\ & \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[5]~2_combout\,
	datab => \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\);

\Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~1_combout\ = \B[1]~input_o\ $ (((\B[3]~input_o\ & \B[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B[1]~input_o\,
	datac => \B[3]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Add3~1_combout\);

\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = \A[2]~input_o\ $ ((((!\A[0]~input_o\ & !\A[1]~input_o\)) # (!\A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \A[2]~input_o\,
	datac => \A[0]~input_o\,
	datad => \A[1]~input_o\,
	combout => \Add2~0_combout\);

\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\Add2~0_combout\ $ (GND))) # (!\B[0]~input_o\ & ((GND) # (!\Add2~0_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ = CARRY((!\Add2~0_combout\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \Add2~0_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ & ((\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)) # (!\Add3~1_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ & ((\Add3~1_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\) # (GND))) # 
-- (!\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ & (\Add3~1_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\ & ((\Add3~1_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\,
	datab => \Add3~1_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ = (\Add3~0_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ $ (GND))) # (!\Add3~0_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ = CARRY((\Add3~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add3~0_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\);

\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\B[3]~input_o\ & (!\B[1]~input_o\ & (!\B[2]~input_o\ & !\B[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \B[1]~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Add3~2_combout\);

\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\);

\Mod0|auto_generated|divider|divider|StageOut[12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ & (!\Add3~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	datac => \Add3~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\);

\Mod0|auto_generated|divider|divider|StageOut[11]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\ = (\Add3~2_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\)) # (!\Add3~2_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\)) # (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[5]~3_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	datac => \Add3~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\);

\Mod0|auto_generated|divider|divider|StageOut[10]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ = (\Add3~2_combout\ & (((!\Add2~0_combout\)))) # (!\Add3~2_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((!\Add2~0_combout\))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	datad => \Add2~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\);

\Add2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~1_combout\ = \A[1]~input_o\ $ (((\A[0]~input_o\ & \A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[1]~input_o\,
	datac => \A[0]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Add2~1_combout\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\Add2~1_combout\ $ (VCC))) # (!\B[0]~input_o\ & ((\Add2~1_combout\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ = CARRY((\Add2~1_combout\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \Add2~1_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ & ((\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\)) # (!\Add3~1_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ & ((\Add3~1_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\) # (GND))) # 
-- (!\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ & (\Add3~1_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\ & ((\Add3~1_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\,
	datab => \Add3~1_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\ $ (\Add3~0_combout\ $ (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\ & ((\Add3~0_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\ & (\Add3~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\,
	datab => \Add3~0_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ & ((\Add3~2_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\)) # (!\Add3~2_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ & ((\Add3~2_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\) # (GND))) # 
-- (!\Add3~2_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ & (\Add3~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\ & ((\Add3~2_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[12]~4_combout\,
	datab => \Add3~2_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\);

\Mod0|auto_generated|divider|divider|StageOut[18]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~11_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ & (!\Add3~2_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	datab => \Add3~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~11_combout\);

\Mod0|auto_generated|divider|divider|StageOut[18]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~7_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~7_combout\);

\Mod0|auto_generated|divider|divider|StageOut[17]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[11]~5_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\);

\Mod0|auto_generated|divider|divider|StageOut[16]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[10]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\);

\Mod0|auto_generated|divider|divider|StageOut[15]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\Add2~1_combout\)) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~1_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[0]~input_o\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ & ((\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # (!\Add3~1_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ & ((\Add3~1_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\) # (GND))) # 
-- (!\Add3~1_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ & (\Add3~1_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\ & ((\Add3~1_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\,
	datab => \Add3~1_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ $ (\Add3~0_combout\ $ (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ & ((\Add3~0_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ & (\Add3~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\,
	datab => \Add3~0_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ & ((\Add3~2_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # (!\Add3~2_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ & ((\Add3~2_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\) # (GND))) # 
-- (!\Add3~2_combout\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ & (\Add3~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\ & ((\Add3~2_combout\) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	datab => \Add3~2_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[18]~11_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[18]~7_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[18]~11_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[18]~7_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

\s_z~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_z~0_combout\ = \A[3]~input_o\ $ (((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\A[0]~input_o\))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	datac => \A[0]~input_o\,
	datad => \A[3]~input_o\,
	combout => \s_z~0_combout\);

\Sel[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sel(2),
	o => \Sel[2]~input_o\);

\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\Sel[2]~input_o\ & (\s_z~0_combout\)) # (!\Sel[2]~input_o\ & ((\A[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_z~0_combout\,
	datab => \A[0]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~0_combout\);

\Sel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sel(0),
	o => \Sel[0]~input_o\);

\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = (\Sel[2]~input_o\ & (\A[3]~input_o\)) # (!\Sel[2]~input_o\ & ((\Sel[0]~input_o\ $ (\B[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \Sel[2]~input_o\,
	datac => \Sel[0]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Add0~1_combout\);

\Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~3_cout\ = CARRY(\Sel[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[0]~input_o\,
	datad => VCC,
	cout => \Add0~3_cout\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\Add0~0_combout\ & ((\Add0~1_combout\ & (\Add0~3_cout\ & VCC)) # (!\Add0~1_combout\ & (!\Add0~3_cout\)))) # (!\Add0~0_combout\ & ((\Add0~1_combout\ & (!\Add0~3_cout\)) # (!\Add0~1_combout\ & ((\Add0~3_cout\) # (GND)))))
-- \Add0~5\ = CARRY((\Add0~0_combout\ & (!\Add0~1_combout\ & !\Add0~3_cout\)) # (!\Add0~0_combout\ & ((!\Add0~3_cout\) # (!\Add0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~1_combout\,
	datad => VCC,
	cin => \Add0~3_cout\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

\Sel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sel(1),
	o => \Sel[1]~input_o\);

\Z~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~1_combout\ = (\Sel[1]~input_o\ & \Sel[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[2]~input_o\,
	combout => \Z~1_combout\);

\Z~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~0_combout\ = (\Sel[1]~input_o\ & ((\Sel[0]~input_o\) # (!\Sel[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[0]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Z~0_combout\);

\Div0|auto_generated|divider|divider|sel[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|sel\(5) = (\B[2]~input_o\ & (((!\B[1]~input_o\ & !\B[0]~input_o\)) # (!\B[3]~input_o\))) # (!\B[2]~input_o\ & (((\B[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[0]~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[3]~input_o\,
	combout => \Div0|auto_generated|divider|divider|sel\(5));

\Div0|auto_generated|divider|divider|StageOut[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ = (\Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\ & ((\Div0|auto_generated|divider|divider|sel\(5)) # ((\Add3~1_combout\) # (!\B[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|sel\(5),
	datac => \Add3~1_combout\,
	datad => \B[0]~input_o\,
	combout => \Div0|auto_generated|divider|divider|StageOut[0]~0_combout\);

\Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\ = \A[2]~input_o\ $ (((\A[3]~input_o\ & ((\A[0]~input_o\) # (\A[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \A[1]~input_o\,
	datac => \A[2]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\);

\Div0|auto_generated|divider|divider|add_sub_1|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_1|_~0_combout\ = (\Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\) # (!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\,
	datad => \B[0]~input_o\,
	combout => \Div0|auto_generated|divider|divider|add_sub_1|_~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[5]~1_combout\ = (\Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ & ((\Div0|auto_generated|divider|divider|sel\(5)) # (\Div0|auto_generated|divider|divider|add_sub_1|_~0_combout\ $ 
-- (\Add3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[0]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|sel\(5),
	datac => \Div0|auto_generated|divider|divider|add_sub_1|_~0_combout\,
	datad => \Add3~1_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[5]~1_combout\);

\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ = \B[2]~input_o\ $ (((\B[3]~input_o\ & ((\B[1]~input_o\) # (\B[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[0]~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[3]~input_o\,
	combout => \Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\);

\Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\ = (\Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ & ((\Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\) # ((!\Add3~1_combout\) # (!\B[0]~input_o\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[0]~0_combout\ & (!\Add3~1_combout\ & ((\Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\) # (!\B[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[0]~0_combout\,
	datab => \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\,
	datac => \B[0]~input_o\,
	datad => \Add3~1_combout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ = \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\ $ (((!\Div0|auto_generated|divider|divider|sel\(5) & (\B[0]~input_o\ & 
-- \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_num|result_tmp[2]~1_combout\,
	datab => \Div0|auto_generated|divider|divider|sel\(5),
	datac => \B[0]~input_o\,
	datad => \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[4]~2_combout\);

\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ = (\Add2~1_combout\ & ((GND) # (!\B[0]~input_o\))) # (!\Add2~1_combout\ & (\B[0]~input_o\ $ (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ = CARRY((\Add2~1_combout\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~1_combout\,
	datab => \B[0]~input_o\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\);

\Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ = (\Add3~1_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\) # (GND))))) # (!\Add3~1_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ & VCC)) # (!\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\))))
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ = CARRY((\Add3~1_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\) # (!\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\))) # (!\Add3~1_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~1_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[4]~2_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\);

\Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ = ((\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ $ (\Div0|auto_generated|divider|divider|StageOut[5]~1_combout\ $ 
-- (\Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\)))) # (GND)
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ = CARRY((\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ & (\Div0|auto_generated|divider|divider|StageOut[5]~1_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\)) # (!\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[5]~1_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[5]~1_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\);

\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ = !\Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\);

\Div0|auto_generated|divider|divider|StageOut[10]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[10]~3_combout\ = (\Add3~2_combout\ & (\Div0|auto_generated|divider|divider|StageOut[5]~1_combout\)) # (!\Add3~2_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[5]~1_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[5]~1_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	datac => \Add3~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[10]~3_combout\);

\Div0|auto_generated|divider|divider|StageOut[9]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[9]~4_combout\ = (\Add3~2_combout\ & (\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\)) # (!\Add3~2_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[4]~2_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[4]~2_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	datac => \Add3~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[9]~4_combout\);

\Div0|auto_generated|divider|divider|StageOut[8]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[8]~5_combout\ = (\Add3~2_combout\ & (\Add2~1_combout\)) # (!\Add3~2_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & (\Add2~1_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~1_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	datac => \Add3~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[8]~5_combout\);

\Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\);

\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\ = CARRY((\Add3~1_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\) # (!\Div0|auto_generated|divider|divider|StageOut[8]~5_combout\))) # 
-- (!\Add3~1_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[8]~5_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~1_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[8]~5_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\);

\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\ = CARRY((\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ & (\Div0|auto_generated|divider|divider|StageOut[9]~4_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\)) # (!\Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[9]~4_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_den|result_tmp[2]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[9]~4_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\);

\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7_cout\ = CARRY((\Add3~2_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\) # (!\Div0|auto_generated|divider|divider|StageOut[10]~3_combout\))) # 
-- (!\Add3~2_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[10]~3_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[10]~3_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7_cout\);

\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\);

\Div0|auto_generated|divider|op_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|op_1~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ $ (VCC)
-- \Div0|auto_generated|divider|op_1~1\ = CARRY(\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|op_1~0_combout\,
	cout => \Div0|auto_generated|divider|op_1~1\);

\Div0|auto_generated|divider|quotient[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|quotient[0]~5_combout\ = (\B[3]~input_o\ & ((\A[3]~input_o\ & ((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\))) # (!\A[3]~input_o\ & (\Div0|auto_generated|divider|op_1~0_combout\)))) # 
-- (!\B[3]~input_o\ & ((\A[3]~input_o\ & (\Div0|auto_generated|divider|op_1~0_combout\)) # (!\A[3]~input_o\ & ((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Div0|auto_generated|divider|op_1~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \Div0|auto_generated|divider|quotient[0]~5_combout\);

\Z~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~21_combout\ = (\Z~1_combout\ & (((\B[0]~input_o\)))) # (!\Z~1_combout\ & ((\Z~0_combout\ & ((\Div0|auto_generated|divider|quotient[0]~5_combout\))) # (!\Z~0_combout\ & (\B[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~1_combout\,
	datab => \Z~0_combout\,
	datac => \B[0]~input_o\,
	datad => \Div0|auto_generated|divider|quotient[0]~5_combout\,
	combout => \Z~21_combout\);

\Z~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~22_combout\ = (\Z~1_combout\ & ((\Z~21_combout\ & ((!\A[0]~input_o\) # (!\Z~0_combout\))) # (!\Z~21_combout\ & ((\A[0]~input_o\))))) # (!\Z~1_combout\ & (\Z~21_combout\ & ((\Z~0_combout\) # (\A[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~1_combout\,
	datab => \Z~21_combout\,
	datac => \Z~0_combout\,
	datad => \A[0]~input_o\,
	combout => \Z~22_combout\);

\Z~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~2_combout\ = (!\Sel[1]~input_o\ & ((!\Sel[2]~input_o\) # (!\Sel[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Sel[0]~input_o\,
	datac => \Sel[2]~input_o\,
	datad => \Sel[1]~input_o\,
	combout => \Z~2_combout\);

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\Sel[1]~input_o\ & (!\Sel[0]~input_o\ & !\Sel[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datac => \Sel[0]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Equal0~0_combout\);

\Z~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~3_combout\ = (!\Equal0~0_combout\ & ((\Z~2_combout\ & (\Add0~4_combout\)) # (!\Z~2_combout\ & ((\Z~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Z~22_combout\,
	datac => \Z~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Z~3_combout\);

\Mult0|auto_generated|le5a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(0) = LCELL(\B[1]~input_o\ $ (((\B[0]~input_o\ & \A[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B[1]~input_o\,
	datac => \B[0]~input_o\,
	datad => \A[0]~input_o\,
	combout => \Mult0|auto_generated|le5a\(0));

\Mult0|auto_generated|add6_result[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[0]~0_combout\ = (\B[1]~input_o\ & (\Mult0|auto_generated|le5a\(0) $ (VCC))) # (!\B[1]~input_o\ & (\Mult0|auto_generated|le5a\(0) & VCC))
-- \Mult0|auto_generated|add6_result[0]~1\ = CARRY((\B[1]~input_o\ & \Mult0|auto_generated|le5a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \Mult0|auto_generated|le5a\(0),
	datad => VCC,
	combout => \Mult0|auto_generated|add6_result[0]~0_combout\,
	cout => \Mult0|auto_generated|add6_result[0]~1\);

\Z~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~4_combout\ = (\Z~3_combout\) # ((\Mult0|auto_generated|add6_result[0]~0_combout\ & \Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~3_combout\,
	datab => \Mult0|auto_generated|add6_result[0]~0_combout\,
	datac => \Equal0~0_combout\,
	combout => \Z~4_combout\);

\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\A[1]~input_o\ & !\Sel[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~6_combout\);

\Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (\Sel[2]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Add0~7_combout\);

\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\Add0~7_combout\) # ((!\Sel[2]~input_o\ & (\B[1]~input_o\ $ (\Sel[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~7_combout\,
	datab => \B[1]~input_o\,
	datac => \Sel[0]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~8_combout\);

\Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = (\Sel[2]~input_o\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Add0~9_combout\);

\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\Add0~8_combout\) # ((\Add0~9_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Add0~9_combout\,
	datac => \A[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[15]~10_combout\,
	combout => \Add0~10_combout\);

\Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = ((\Add0~6_combout\ $ (\Add0~10_combout\ $ (!\Add0~5\)))) # (GND)
-- \Add0~12\ = CARRY((\Add0~6_combout\ & ((\Add0~10_combout\) # (!\Add0~5\))) # (!\Add0~6_combout\ & (\Add0~10_combout\ & !\Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \Add0~10_combout\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~11_combout\,
	cout => \Add0~12\);

\Z~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~19_combout\ = (\Z~1_combout\ & ((\A[1]~input_o\ & ((!\B[1]~input_o\) # (!\Z~0_combout\))) # (!\A[1]~input_o\ & ((\B[1]~input_o\))))) # (!\Z~1_combout\ & ((\Z~0_combout\) # ((\A[1]~input_o\ & \B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~0_combout\,
	datab => \Z~1_combout\,
	datac => \A[1]~input_o\,
	datad => \B[1]~input_o\,
	combout => \Z~19_combout\);

\Div0|auto_generated|divider|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|op_1~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & (((!\Div0|auto_generated|divider|op_1~1\)))) # (!\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- ((\Add3~2_combout\ & (!\Div0|auto_generated|divider|op_1~1\)) # (!\Add3~2_combout\ & ((\Div0|auto_generated|divider|op_1~1\) # (GND)))))
-- \Div0|auto_generated|divider|op_1~3\ = CARRY(((!\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & !\Add3~2_combout\)) # (!\Div0|auto_generated|divider|op_1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	datab => \Add3~2_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|op_1~1\,
	combout => \Div0|auto_generated|divider|op_1~2_combout\,
	cout => \Div0|auto_generated|divider|op_1~3\);

\Div0|auto_generated|divider|diff_signs\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|diff_signs~combout\ = \B[3]~input_o\ $ (\A[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[3]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Div0|auto_generated|divider|diff_signs~combout\);

\Div0|auto_generated|divider|quotient[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|quotient[1]~2_combout\ = (\Div0|auto_generated|divider|diff_signs~combout\ & (\Div0|auto_generated|divider|op_1~2_combout\)) # (!\Div0|auto_generated|divider|diff_signs~combout\ & (((!\Add3~2_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|op_1~2_combout\,
	datab => \Div0|auto_generated|divider|diff_signs~combout\,
	datac => \Add3~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \Div0|auto_generated|divider|quotient[1]~2_combout\);

\Z~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~20_combout\ = (\Z~19_combout\ & (((\Z~1_combout\) # (\Div0|auto_generated|divider|quotient[1]~2_combout\)) # (!\Z~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~0_combout\,
	datab => \Z~19_combout\,
	datac => \Z~1_combout\,
	datad => \Div0|auto_generated|divider|quotient[1]~2_combout\,
	combout => \Z~20_combout\);

\Z~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~5_combout\ = (!\Equal0~0_combout\ & ((\Z~2_combout\ & (\Add0~11_combout\)) # (!\Z~2_combout\ & ((\Z~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~11_combout\,
	datab => \Z~20_combout\,
	datac => \Z~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Z~5_combout\);

\Mult0|auto_generated|le5a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(1) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[1]~input_o\)))) # (!\B[0]~input_o\ & (!\A[0]~input_o\ & (\B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datac => \B[1]~input_o\,
	datad => \A[1]~input_o\,
	combout => \Mult0|auto_generated|le5a\(1));

\Mult0|auto_generated|add6_result[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[1]~2_combout\ = (\Mult0|auto_generated|le5a\(1) & (!\Mult0|auto_generated|add6_result[0]~1\)) # (!\Mult0|auto_generated|le5a\(1) & ((\Mult0|auto_generated|add6_result[0]~1\) # (GND)))
-- \Mult0|auto_generated|add6_result[1]~3\ = CARRY((!\Mult0|auto_generated|add6_result[0]~1\) # (!\Mult0|auto_generated|le5a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le5a\(1),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[0]~1\,
	combout => \Mult0|auto_generated|add6_result[1]~2_combout\,
	cout => \Mult0|auto_generated|add6_result[1]~3\);

\Z~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~6_combout\ = (\Z~5_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[1]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~5_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[1]~2_combout\,
	combout => \Z~6_combout\);

\Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (\A[2]~input_o\ & !\Sel[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~13_combout\);

\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\Sel[2]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Add0~14_combout\);

\Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = (\Add0~14_combout\) # ((!\Sel[2]~input_o\ & (\Sel[0]~input_o\ $ (\B[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datab => \Sel[0]~input_o\,
	datac => \B[2]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~15_combout\);

\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\Add0~15_combout\) # ((\Add0~9_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => \Add0~9_combout\,
	datac => \A[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\,
	combout => \Add0~16_combout\);

\Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (\Add0~13_combout\ & ((\Add0~16_combout\ & (\Add0~12\ & VCC)) # (!\Add0~16_combout\ & (!\Add0~12\)))) # (!\Add0~13_combout\ & ((\Add0~16_combout\ & (!\Add0~12\)) # (!\Add0~16_combout\ & ((\Add0~12\) # (GND)))))
-- \Add0~18\ = CARRY((\Add0~13_combout\ & (!\Add0~16_combout\ & !\Add0~12\)) # (!\Add0~13_combout\ & ((!\Add0~12\) # (!\Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \Add0~12\,
	combout => \Add0~17_combout\,
	cout => \Add0~18\);

\Div0|auto_generated|divider|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|op_1~4_combout\ = (\Div0|auto_generated|divider|op_1~3\ & (((\Div0|auto_generated|divider|divider|sel\(5)) # (!\Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\)))) # (!\Div0|auto_generated|divider|op_1~3\ 
-- & ((((\Div0|auto_generated|divider|divider|sel\(5)) # (!\Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\)))))
-- \Div0|auto_generated|divider|op_1~5\ = CARRY((!\Div0|auto_generated|divider|op_1~3\ & ((\Div0|auto_generated|divider|divider|sel\(5)) # (!\Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|sel\(5),
	datab => \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|op_1~3\,
	combout => \Div0|auto_generated|divider|op_1~4_combout\,
	cout => \Div0|auto_generated|divider|op_1~5\);

\Div0|auto_generated|divider|quotient[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|quotient[2]~3_combout\ = (\Div0|auto_generated|divider|diff_signs~combout\ & (\Div0|auto_generated|divider|op_1~4_combout\)) # (!\Div0|auto_generated|divider|diff_signs~combout\ & 
-- (((\Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\ & !\Div0|auto_generated|divider|divider|sel\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|op_1~4_combout\,
	datab => \Div0|auto_generated|divider|diff_signs~combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_1|carry_eqn[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|sel\(5),
	combout => \Div0|auto_generated|divider|quotient[2]~3_combout\);

\Z~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~17_combout\ = (\Z~1_combout\ & (((\B[2]~input_o\)))) # (!\Z~1_combout\ & ((\Z~0_combout\ & ((\Div0|auto_generated|divider|quotient[2]~3_combout\))) # (!\Z~0_combout\ & (\B[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~1_combout\,
	datab => \Z~0_combout\,
	datac => \B[2]~input_o\,
	datad => \Div0|auto_generated|divider|quotient[2]~3_combout\,
	combout => \Z~17_combout\);

\Z~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~18_combout\ = (\Z~1_combout\ & ((\Z~17_combout\ & ((!\A[2]~input_o\) # (!\Z~0_combout\))) # (!\Z~17_combout\ & ((\A[2]~input_o\))))) # (!\Z~1_combout\ & (\Z~17_combout\ & ((\Z~0_combout\) # (\A[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~1_combout\,
	datab => \Z~17_combout\,
	datac => \Z~0_combout\,
	datad => \A[2]~input_o\,
	combout => \Z~18_combout\);

\Z~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~7_combout\ = (!\Equal0~0_combout\ & ((\Z~2_combout\ & (\Add0~17_combout\)) # (!\Z~2_combout\ & ((\Z~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~17_combout\,
	datab => \Z~18_combout\,
	datac => \Z~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Z~7_combout\);

\Mult0|auto_generated|le5a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(2) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[2]~input_o\)))) # (!\B[0]~input_o\ & (!\A[1]~input_o\ & (\B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[1]~input_o\,
	datac => \B[1]~input_o\,
	datad => \A[2]~input_o\,
	combout => \Mult0|auto_generated|le5a\(2));

\Mult0|auto_generated|add10_result[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add10_result[0]~0_combout\ = (\B[3]~input_o\ & (\Mult0|auto_generated|le5a\(2) $ (VCC))) # (!\B[3]~input_o\ & (\Mult0|auto_generated|le5a\(2) & VCC))
-- \Mult0|auto_generated|add10_result[0]~1\ = CARRY((\B[3]~input_o\ & \Mult0|auto_generated|le5a\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \Mult0|auto_generated|le5a\(2),
	datad => VCC,
	combout => \Mult0|auto_generated|add10_result[0]~0_combout\,
	cout => \Mult0|auto_generated|add10_result[0]~1\);

\Mult0|auto_generated|le2a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le2a\(0) = LCELL((\B[3]~input_o\ & (\B[1]~input_o\ $ (!\B[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \B[1]~input_o\,
	datac => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le2a\(0));

\Mult0|auto_generated|cs3a[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|cs3a[1]~0_combout\ = \B[1]~input_o\ $ (\B[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|cs3a[1]~0_combout\);

\Mult0|auto_generated|le4a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(0) = LCELL((\Mult0|auto_generated|le2a\(0)) # ((\Mult0|auto_generated|cs3a[1]~0_combout\ & (\B[3]~input_o\ $ (\A[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le2a\(0),
	datab => \Mult0|auto_generated|cs3a[1]~0_combout\,
	datac => \B[3]~input_o\,
	datad => \A[0]~input_o\,
	combout => \Mult0|auto_generated|le4a\(0));

\Mult0|auto_generated|add6_result[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[2]~4_combout\ = ((\Mult0|auto_generated|add10_result[0]~0_combout\ $ (\Mult0|auto_generated|le4a\(0) $ (!\Mult0|auto_generated|add6_result[1]~3\)))) # (GND)
-- \Mult0|auto_generated|add6_result[2]~5\ = CARRY((\Mult0|auto_generated|add10_result[0]~0_combout\ & ((\Mult0|auto_generated|le4a\(0)) # (!\Mult0|auto_generated|add6_result[1]~3\))) # (!\Mult0|auto_generated|add10_result[0]~0_combout\ & 
-- (\Mult0|auto_generated|le4a\(0) & !\Mult0|auto_generated|add6_result[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|add10_result[0]~0_combout\,
	datab => \Mult0|auto_generated|le4a\(0),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[1]~3\,
	combout => \Mult0|auto_generated|add6_result[2]~4_combout\,
	cout => \Mult0|auto_generated|add6_result[2]~5\);

\Z~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~8_combout\ = (\Z~7_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[2]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~7_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[2]~4_combout\,
	combout => \Z~8_combout\);

\Z~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~9_combout\ = (\Sel[0]~input_o\ & (\Sel[2]~input_o\ & (\B[3]~input_o\ & \A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[0]~input_o\,
	datab => \Sel[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Z~9_combout\);

\Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = (\A[3]~input_o\ & !\Sel[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~19_combout\);

\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (\Sel[2]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Add0~20_combout\);

\Add0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = (\Add0~20_combout\) # ((!\Sel[2]~input_o\ & (\Sel[0]~input_o\ $ (\B[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datab => \Sel[0]~input_o\,
	datac => \B[3]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Add0~21_combout\);

\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\Add0~21_combout\) # ((\Add0~9_combout\ & (\A[3]~input_o\ $ (\Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~21_combout\,
	datab => \Add0~9_combout\,
	datac => \A[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[17]~8_combout\,
	combout => \Add0~22_combout\);

\Add0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~23_combout\ = \Add0~19_combout\ $ (\Add0~22_combout\ $ (!\Add0~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~19_combout\,
	datab => \Add0~22_combout\,
	cin => \Add0~18\,
	combout => \Add0~23_combout\);

\Z~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~10_combout\ = (\Z~9_combout\) # ((\Add0~23_combout\ & ((!\Sel[2]~input_o\) # (!\Sel[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~9_combout\,
	datab => \Add0~23_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Z~10_combout\);

\Div0|auto_generated|divider|divider|sel[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|sel\(0) = (\B[1]~input_o\ & (((!\B[0]~input_o\) # (!\B[3]~input_o\)) # (!\B[2]~input_o\))) # (!\B[1]~input_o\ & ((\B[2]~input_o\) # ((\B[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \B[0]~input_o\,
	combout => \Div0|auto_generated|divider|divider|sel\(0));

\Div0|auto_generated|divider|divider|add_sub_0|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\ = (\Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\) # (!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|my_abs_num|result_tmp[3]~0_combout\,
	datad => \B[0]~input_o\,
	combout => \Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\);

\Div0|auto_generated|divider|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|op_1~6_combout\ = \Div0|auto_generated|divider|op_1~5\ $ (((\Div0|auto_generated|divider|divider|sel\(0)) # (!\Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101001011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|sel\(0),
	datab => \Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\,
	cin => \Div0|auto_generated|divider|op_1~5\,
	combout => \Div0|auto_generated|divider|op_1~6_combout\);

\Div0|auto_generated|divider|quotient[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|quotient[3]~4_combout\ = (\Div0|auto_generated|divider|diff_signs~combout\ & (\Div0|auto_generated|divider|op_1~6_combout\)) # (!\Div0|auto_generated|divider|diff_signs~combout\ & 
-- (((\Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\ & !\Div0|auto_generated|divider|divider|sel\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|op_1~6_combout\,
	datab => \Div0|auto_generated|divider|diff_signs~combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_0|_~0_combout\,
	datad => \Div0|auto_generated|divider|divider|sel\(0),
	combout => \Div0|auto_generated|divider|quotient[3]~4_combout\);

\RESULT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RESULT~0_combout\ = (\B[3]~input_o\) # (\A[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	combout => \RESULT~0_combout\);

\Mult0|auto_generated|le5a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(3) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[3]~input_o\)))) # (!\B[0]~input_o\ & (!\A[2]~input_o\ & (\B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[2]~input_o\,
	datac => \B[1]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Mult0|auto_generated|le5a\(3));

\Mult0|auto_generated|add10_result[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add10_result[1]~2_combout\ = (\Mult0|auto_generated|le5a\(3) & (!\Mult0|auto_generated|add10_result[0]~1\)) # (!\Mult0|auto_generated|le5a\(3) & ((\Mult0|auto_generated|add10_result[0]~1\) # (GND)))
-- \Mult0|auto_generated|add10_result[1]~3\ = CARRY((!\Mult0|auto_generated|add10_result[0]~1\) # (!\Mult0|auto_generated|le5a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le5a\(3),
	datad => VCC,
	cin => \Mult0|auto_generated|add10_result[0]~1\,
	combout => \Mult0|auto_generated|add10_result[1]~2_combout\,
	cout => \Mult0|auto_generated|add10_result[1]~3\);

\Mult0|auto_generated|le2a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le2a\(1) = LCELL((\A[0]~input_o\ & (\B[1]~input_o\ & (\B[2]~input_o\))) # (!\A[0]~input_o\ & (\B[3]~input_o\ & (\B[1]~input_o\ $ (!\B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \A[0]~input_o\,
	combout => \Mult0|auto_generated|le2a\(1));

\Mult0|auto_generated|le4a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(1) = LCELL((\Mult0|auto_generated|le2a\(1)) # ((\Mult0|auto_generated|cs3a[1]~0_combout\ & (\B[3]~input_o\ $ (\A[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le2a\(1),
	datab => \Mult0|auto_generated|cs3a[1]~0_combout\,
	datac => \B[3]~input_o\,
	datad => \A[1]~input_o\,
	combout => \Mult0|auto_generated|le4a\(1));

\Mult0|auto_generated|add6_result[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[3]~6_combout\ = (\Mult0|auto_generated|add10_result[1]~2_combout\ & ((\Mult0|auto_generated|le4a\(1) & (\Mult0|auto_generated|add6_result[2]~5\ & VCC)) # (!\Mult0|auto_generated|le4a\(1) & 
-- (!\Mult0|auto_generated|add6_result[2]~5\)))) # (!\Mult0|auto_generated|add10_result[1]~2_combout\ & ((\Mult0|auto_generated|le4a\(1) & (!\Mult0|auto_generated|add6_result[2]~5\)) # (!\Mult0|auto_generated|le4a\(1) & 
-- ((\Mult0|auto_generated|add6_result[2]~5\) # (GND)))))
-- \Mult0|auto_generated|add6_result[3]~7\ = CARRY((\Mult0|auto_generated|add10_result[1]~2_combout\ & (!\Mult0|auto_generated|le4a\(1) & !\Mult0|auto_generated|add6_result[2]~5\)) # (!\Mult0|auto_generated|add10_result[1]~2_combout\ & 
-- ((!\Mult0|auto_generated|add6_result[2]~5\) # (!\Mult0|auto_generated|le4a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|add10_result[1]~2_combout\,
	datab => \Mult0|auto_generated|le4a\(1),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[2]~5\,
	combout => \Mult0|auto_generated|add6_result[3]~6_combout\,
	cout => \Mult0|auto_generated|add6_result[3]~7\);

\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Sel[0]~input_o\ & (((\Sel[2]~input_o\)))) # (!\Sel[0]~input_o\ & ((\Sel[2]~input_o\ & (\RESULT~0_combout\)) # (!\Sel[2]~input_o\ & ((\Mult0|auto_generated|add6_result[3]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[0]~input_o\,
	datab => \RESULT~0_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Mult0|auto_generated|add6_result[3]~6_combout\,
	combout => \Mux0~0_combout\);

\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Sel[0]~input_o\ & ((\Mux0~0_combout\ & ((\Div0|auto_generated|divider|diff_signs~combout\))) # (!\Mux0~0_combout\ & (\Div0|auto_generated|divider|quotient[3]~4_combout\)))) # (!\Sel[0]~input_o\ & (((\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|quotient[3]~4_combout\,
	datab => \Sel[0]~input_o\,
	datac => \Mux0~0_combout\,
	datad => \Div0|auto_generated|divider|diff_signs~combout\,
	combout => \Mux0~1_combout\);

\Z~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~11_combout\ = (\Sel[1]~input_o\ & (((\Mux0~1_combout\ & !\Equal0~0_combout\)))) # (!\Sel[1]~input_o\ & (\Z~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~10_combout\,
	datab => \Mux0~1_combout\,
	datac => \Sel[1]~input_o\,
	datad => \Equal0~0_combout\,
	combout => \Z~11_combout\);

\Z~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~12_combout\ = (\Z~11_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~11_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[3]~6_combout\,
	combout => \Z~12_combout\);

\Mult0|auto_generated|le5a[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(4) = LCELL((\B[1]~input_o\ & ((!\A[3]~input_o\))) # (!\B[1]~input_o\ & (\B[0]~input_o\ & \A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datac => \B[1]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Mult0|auto_generated|le5a\(4));

\Mult0|auto_generated|add10_result[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add10_result[2]~4_combout\ = (\Mult0|auto_generated|le5a\(4) & (\Mult0|auto_generated|add10_result[1]~3\ $ (GND))) # (!\Mult0|auto_generated|le5a\(4) & ((GND) # (!\Mult0|auto_generated|add10_result[1]~3\)))
-- \Mult0|auto_generated|add10_result[2]~5\ = CARRY((!\Mult0|auto_generated|add10_result[1]~3\) # (!\Mult0|auto_generated|le5a\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le5a\(4),
	datad => VCC,
	cin => \Mult0|auto_generated|add10_result[1]~3\,
	combout => \Mult0|auto_generated|add10_result[2]~4_combout\,
	cout => \Mult0|auto_generated|add10_result[2]~5\);

\Mult0|auto_generated|le2a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le2a\(2) = LCELL((\A[1]~input_o\ & (\B[1]~input_o\ & (\B[2]~input_o\))) # (!\A[1]~input_o\ & (\B[3]~input_o\ & (\B[1]~input_o\ $ (!\B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \A[1]~input_o\,
	combout => \Mult0|auto_generated|le2a\(2));

\Mult0|auto_generated|le4a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(2) = LCELL((\Mult0|auto_generated|le2a\(2)) # ((\Mult0|auto_generated|cs3a[1]~0_combout\ & (\B[3]~input_o\ $ (\A[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le2a\(2),
	datab => \Mult0|auto_generated|cs3a[1]~0_combout\,
	datac => \B[3]~input_o\,
	datad => \A[2]~input_o\,
	combout => \Mult0|auto_generated|le4a\(2));

\Mult0|auto_generated|add6_result[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[4]~8_combout\ = ((\Mult0|auto_generated|add10_result[2]~4_combout\ $ (\Mult0|auto_generated|le4a\(2) $ (!\Mult0|auto_generated|add6_result[3]~7\)))) # (GND)
-- \Mult0|auto_generated|add6_result[4]~9\ = CARRY((\Mult0|auto_generated|add10_result[2]~4_combout\ & ((\Mult0|auto_generated|le4a\(2)) # (!\Mult0|auto_generated|add6_result[3]~7\))) # (!\Mult0|auto_generated|add10_result[2]~4_combout\ & 
-- (\Mult0|auto_generated|le4a\(2) & !\Mult0|auto_generated|add6_result[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|add10_result[2]~4_combout\,
	datab => \Mult0|auto_generated|le4a\(2),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[3]~7\,
	combout => \Mult0|auto_generated|add6_result[4]~8_combout\,
	cout => \Mult0|auto_generated|add6_result[4]~9\);

\Z~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~13_combout\ = (\Z~11_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~11_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[4]~8_combout\,
	combout => \Z~13_combout\);

\Mult0|auto_generated|add10_result[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add10_result[3]~6_combout\ = !\Mult0|auto_generated|add10_result[2]~5\
-- \Mult0|auto_generated|add10_result[3]~7\ = CARRY(!\Mult0|auto_generated|add10_result[2]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \Mult0|auto_generated|add10_result[2]~5\,
	combout => \Mult0|auto_generated|add10_result[3]~6_combout\,
	cout => \Mult0|auto_generated|add10_result[3]~7\);

\Mult0|auto_generated|le2a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le2a\(3) = LCELL((\A[2]~input_o\ & (\B[1]~input_o\ & (\B[2]~input_o\))) # (!\A[2]~input_o\ & (\B[3]~input_o\ & (\B[1]~input_o\ $ (!\B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \A[2]~input_o\,
	combout => \Mult0|auto_generated|le2a\(3));

\Mult0|auto_generated|le4a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(3) = LCELL((\Mult0|auto_generated|le2a\(3)) # ((\Mult0|auto_generated|cs3a[1]~0_combout\ & (\B[3]~input_o\ $ (\A[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Mult0|auto_generated|le2a\(3),
	datad => \Mult0|auto_generated|cs3a[1]~0_combout\,
	combout => \Mult0|auto_generated|le4a\(3));

\Mult0|auto_generated|add6_result[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[5]~10_combout\ = (\Mult0|auto_generated|add10_result[3]~6_combout\ & ((\Mult0|auto_generated|le4a\(3) & (\Mult0|auto_generated|add6_result[4]~9\ & VCC)) # (!\Mult0|auto_generated|le4a\(3) & 
-- (!\Mult0|auto_generated|add6_result[4]~9\)))) # (!\Mult0|auto_generated|add10_result[3]~6_combout\ & ((\Mult0|auto_generated|le4a\(3) & (!\Mult0|auto_generated|add6_result[4]~9\)) # (!\Mult0|auto_generated|le4a\(3) & 
-- ((\Mult0|auto_generated|add6_result[4]~9\) # (GND)))))
-- \Mult0|auto_generated|add6_result[5]~11\ = CARRY((\Mult0|auto_generated|add10_result[3]~6_combout\ & (!\Mult0|auto_generated|le4a\(3) & !\Mult0|auto_generated|add6_result[4]~9\)) # (!\Mult0|auto_generated|add10_result[3]~6_combout\ & 
-- ((!\Mult0|auto_generated|add6_result[4]~9\) # (!\Mult0|auto_generated|le4a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|add10_result[3]~6_combout\,
	datab => \Mult0|auto_generated|le4a\(3),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[4]~9\,
	combout => \Mult0|auto_generated|add6_result[5]~10_combout\,
	cout => \Mult0|auto_generated|add6_result[5]~11\);

\Z~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~14_combout\ = (\Z~11_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~11_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[5]~10_combout\,
	combout => \Z~14_combout\);

\Mult0|auto_generated|add10_result[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add10_result[4]~8_combout\ = !\Mult0|auto_generated|add10_result[3]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mult0|auto_generated|add10_result[3]~7\,
	combout => \Mult0|auto_generated|add10_result[4]~8_combout\);

\Mult0|auto_generated|le2a[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le2a\(4) = LCELL((\A[3]~input_o\ & (\B[1]~input_o\ & (\B[2]~input_o\))) # (!\A[3]~input_o\ & (\B[3]~input_o\ & (\B[1]~input_o\ $ (!\B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \B[3]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Mult0|auto_generated|le2a\(4));

\Mult0|auto_generated|le4a[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(4) = LCELL((\Mult0|auto_generated|le2a\(4)) # ((\Mult0|auto_generated|cs3a[1]~0_combout\ & (\B[3]~input_o\ $ (\A[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Mult0|auto_generated|le2a\(4),
	datad => \Mult0|auto_generated|cs3a[1]~0_combout\,
	combout => \Mult0|auto_generated|le4a\(4));

\Mult0|auto_generated|add6_result[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[6]~12_combout\ = ((\Mult0|auto_generated|add10_result[4]~8_combout\ $ (\Mult0|auto_generated|le4a\(4) $ (\Mult0|auto_generated|add6_result[5]~11\)))) # (GND)
-- \Mult0|auto_generated|add6_result[6]~13\ = CARRY((\Mult0|auto_generated|add10_result[4]~8_combout\ & ((!\Mult0|auto_generated|add6_result[5]~11\) # (!\Mult0|auto_generated|le4a\(4)))) # (!\Mult0|auto_generated|add10_result[4]~8_combout\ & 
-- (!\Mult0|auto_generated|le4a\(4) & !\Mult0|auto_generated|add6_result[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|add10_result[4]~8_combout\,
	datab => \Mult0|auto_generated|le4a\(4),
	datad => VCC,
	cin => \Mult0|auto_generated|add6_result[5]~11\,
	combout => \Mult0|auto_generated|add6_result[6]~12_combout\,
	cout => \Mult0|auto_generated|add6_result[6]~13\);

\Z~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~15_combout\ = (\Z~11_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~11_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[6]~12_combout\,
	combout => \Z~15_combout\);

\Mult0|auto_generated|add6_result[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|add6_result[7]~14_combout\ = !\Mult0|auto_generated|add6_result[6]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mult0|auto_generated|add6_result[6]~13\,
	combout => \Mult0|auto_generated|add6_result[7]~14_combout\);

\Z~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Z~16_combout\ = (\Z~11_combout\) # ((\Equal0~0_combout\ & \Mult0|auto_generated|add6_result[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z~11_combout\,
	datab => \Equal0~0_combout\,
	datac => \Mult0|auto_generated|add6_result[7]~14_combout\,
	combout => \Z~16_combout\);

ww_Z(0) <= \Z[0]~output_o\;

ww_Z(1) <= \Z[1]~output_o\;

ww_Z(2) <= \Z[2]~output_o\;

ww_Z(3) <= \Z[3]~output_o\;

ww_Z(4) <= \Z[4]~output_o\;

ww_Z(5) <= \Z[5]~output_o\;

ww_Z(6) <= \Z[6]~output_o\;

ww_Z(7) <= \Z[7]~output_o\;
END structure;


