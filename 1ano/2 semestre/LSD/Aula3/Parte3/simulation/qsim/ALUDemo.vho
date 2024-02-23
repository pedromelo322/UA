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

-- DATE "04/05/2023 19:58:06"

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
	m : OUT std_logic_vector(7 DOWNTO 0);
	Z : OUT std_logic_vector(3 DOWNTO 0)
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
SIGNAL ww_m : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Z : std_logic_vector(3 DOWNTO 0);
SIGNAL \m[0]~output_o\ : std_logic;
SIGNAL \m[1]~output_o\ : std_logic;
SIGNAL \m[2]~output_o\ : std_logic;
SIGNAL \m[3]~output_o\ : std_logic;
SIGNAL \m[4]~output_o\ : std_logic;
SIGNAL \m[5]~output_o\ : std_logic;
SIGNAL \m[6]~output_o\ : std_logic;
SIGNAL \m[7]~output_o\ : std_logic;
SIGNAL \Z[0]~output_o\ : std_logic;
SIGNAL \Z[1]~output_o\ : std_logic;
SIGNAL \Z[2]~output_o\ : std_logic;
SIGNAL \Z[3]~output_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \Mult0|auto_generated|cs2a[1]~0_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~1\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~3\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~2_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~1\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~3\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~5\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~7\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~8_combout\ : std_logic;
SIGNAL \Sel[0]~input_o\ : std_logic;
SIGNAL \Sel[1]~input_o\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_1~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~8_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Sel[2]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~1_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_1~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~1_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_2~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|selnose[0]~0_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~5\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~7\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~9\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~9\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~11\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~13\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~14_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[63]~46_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \Mux0~5_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[62]~47_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~22_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[61]~48_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[18]~34_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[18]~35_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[17]~36_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[16]~39_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[15]~40_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[15]~41_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[21]~44_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[21]~45_combout\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[59]~49_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~6_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~47_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~26_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_2~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[20]~46_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[20]~47_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[23]~63_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[23]~42_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[22]~64_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[22]~43_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[28]~58_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[28]~48_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[27]~65_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[27]~49_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[26]~50_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[26]~51_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[58]~50_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~4_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[36]~48_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[36]~30_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[35]~49_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[35]~31_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[25]~52_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[25]~53_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[33]~59_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[33]~54_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[32]~60_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[32]~55_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[31]~56_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[31]~57_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[57]~51_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~2_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[45]~51_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[45]~34_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[44]~52_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[44]~35_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[43]~53_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[43]~36_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[41]~38_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[30]~61_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[30]~62_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \RESULT~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|op_3~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[54]~54_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[54]~40_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[53]~55_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[53]~41_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[52]~56_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[52]~42_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[51]~57_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[51]~43_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[50]~44_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[49]~45_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[48]~46_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \Mux7~5_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~34_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~35_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[23]~66_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[23]~42_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[28]~61_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[28]~48_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[33]~64_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[33]~54_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[36]~58_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[37]~59_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\ : std_logic;
SIGNAL \Mult0|auto_generated|le4a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Mult0|auto_generated|le5a\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mult0|auto_generated|le3a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Div1|auto_generated|divider|divider|ALT_INV_add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|ALT_INV_add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|ALT_INV_add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|ALT_INV_add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|ALT_INV_add_sub_3_result_int[4]~6_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Sel <= Sel;
m <= ww_m;
Z <= ww_Z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Div1|auto_generated|divider|divider|ALT_INV_add_sub_7_result_int[5]~8_combout\ <= NOT \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\;
\Div1|auto_generated|divider|divider|ALT_INV_add_sub_6_result_int[5]~8_combout\ <= NOT \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\;
\Div1|auto_generated|divider|divider|ALT_INV_add_sub_5_result_int[5]~8_combout\ <= NOT \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\;
\Div1|auto_generated|divider|divider|ALT_INV_add_sub_4_result_int[5]~8_combout\ <= NOT \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\;
\Div1|auto_generated|divider|divider|ALT_INV_add_sub_3_result_int[4]~6_combout\ <= NOT \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\;

\m[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Div1|auto_generated|divider|divider|ALT_INV_add_sub_7_result_int[5]~8_combout\,
	devoe => ww_devoe,
	o => \m[0]~output_o\);

\m[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Div1|auto_generated|divider|divider|ALT_INV_add_sub_6_result_int[5]~8_combout\,
	devoe => ww_devoe,
	o => \m[1]~output_o\);

\m[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Div1|auto_generated|divider|divider|ALT_INV_add_sub_5_result_int[5]~8_combout\,
	devoe => ww_devoe,
	o => \m[2]~output_o\);

\m[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Div1|auto_generated|divider|divider|ALT_INV_add_sub_4_result_int[5]~8_combout\,
	devoe => ww_devoe,
	o => \m[3]~output_o\);

\m[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Div1|auto_generated|divider|divider|ALT_INV_add_sub_3_result_int[4]~6_combout\,
	devoe => ww_devoe,
	o => \m[4]~output_o\);

\m[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \m[5]~output_o\);

\m[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \m[6]~output_o\);

\m[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \m[7]~output_o\);

\Z[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~5_combout\,
	devoe => ww_devoe,
	o => \Z[0]~output_o\);

\Z[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mod1|auto_generated|divider|divider|StageOut[36]~58_combout\,
	devoe => ww_devoe,
	o => \Z[1]~output_o\);

\Z[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mod1|auto_generated|divider|divider|StageOut[37]~59_combout\,
	devoe => ww_devoe,
	o => \Z[2]~output_o\);

\Z[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\,
	devoe => ww_devoe,
	o => \Z[3]~output_o\);

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

\A[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

\Mult0|auto_generated|le3a[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(4) = LCELL((\B[1]~input_o\ & ((\B[0]~input_o\) # (!\A[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[0]~input_o\,
	datad => \A[3]~input_o\,
	combout => \Mult0|auto_generated|le3a\(4));

\B[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

\Mult0|auto_generated|cs2a[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|cs2a[1]~0_combout\ = \B[1]~input_o\ $ (\B[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|cs2a[1]~0_combout\);

\A[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

\B[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

\Mult0|auto_generated|le4a[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(5) = LCELL(\B[3]~input_o\ $ (((\B[1]~input_o\ & \B[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le4a\(5));

\A[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

\Mult0|auto_generated|le4a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(2) = LCELL((\Mult0|auto_generated|cs2a[1]~0_combout\ & ((\Mult0|auto_generated|le4a\(5) $ (\A[2]~input_o\)))) # (!\Mult0|auto_generated|cs2a[1]~0_combout\ & (!\A[1]~input_o\ & (\Mult0|auto_generated|le4a\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|cs2a[1]~0_combout\,
	datab => \A[1]~input_o\,
	datac => \Mult0|auto_generated|le4a\(5),
	datad => \A[2]~input_o\,
	combout => \Mult0|auto_generated|le4a\(2));

\Mult0|auto_generated|le3a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(3) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[3]~input_o\)))) # (!\B[0]~input_o\ & (!\A[2]~input_o\ & (\B[1]~input_o\))))

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
	combout => \Mult0|auto_generated|le3a\(3));

\Mult0|auto_generated|le3a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(2) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[2]~input_o\)))) # (!\B[0]~input_o\ & (!\A[1]~input_o\ & (\B[1]~input_o\))))

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
	combout => \Mult0|auto_generated|le3a\(2));

\Mult0|auto_generated|op_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~0_combout\ = (\Mult0|auto_generated|le4a\(5) & (\Mult0|auto_generated|le3a\(2) $ (VCC))) # (!\Mult0|auto_generated|le4a\(5) & (\Mult0|auto_generated|le3a\(2) & VCC))
-- \Mult0|auto_generated|op_1~1\ = CARRY((\Mult0|auto_generated|le4a\(5) & \Mult0|auto_generated|le3a\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le4a\(5),
	datab => \Mult0|auto_generated|le3a\(2),
	datad => VCC,
	combout => \Mult0|auto_generated|op_1~0_combout\,
	cout => \Mult0|auto_generated|op_1~1\);

\Mult0|auto_generated|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~2_combout\ = (\Mult0|auto_generated|le3a\(3) & (!\Mult0|auto_generated|op_1~1\)) # (!\Mult0|auto_generated|le3a\(3) & ((\Mult0|auto_generated|op_1~1\) # (GND)))
-- \Mult0|auto_generated|op_1~3\ = CARRY((!\Mult0|auto_generated|op_1~1\) # (!\Mult0|auto_generated|le3a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(3),
	datad => VCC,
	cin => \Mult0|auto_generated|op_1~1\,
	combout => \Mult0|auto_generated|op_1~2_combout\,
	cout => \Mult0|auto_generated|op_1~3\);

\Mult0|auto_generated|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~4_combout\ = ((\Mult0|auto_generated|le3a\(4) $ (\Mult0|auto_generated|le4a\(2) $ (!\Mult0|auto_generated|op_1~3\)))) # (GND)
-- \Mult0|auto_generated|op_1~5\ = CARRY((\Mult0|auto_generated|le3a\(4) & ((\Mult0|auto_generated|le4a\(2)) # (!\Mult0|auto_generated|op_1~3\))) # (!\Mult0|auto_generated|le3a\(4) & (\Mult0|auto_generated|le4a\(2) & !\Mult0|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(4),
	datab => \Mult0|auto_generated|le4a\(2),
	datad => VCC,
	cin => \Mult0|auto_generated|op_1~3\,
	combout => \Mult0|auto_generated|op_1~4_combout\,
	cout => \Mult0|auto_generated|op_1~5\);

\A[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

\Mult0|auto_generated|le5a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(0) = LCELL((\A[0]~input_o\ & ((\B[3]~input_o\) # ((\B[1]~input_o\ & \B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \B[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le5a\(0));

\Mult0|auto_generated|le4a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(1) = LCELL((\Mult0|auto_generated|cs2a[1]~0_combout\ & ((\Mult0|auto_generated|le4a\(5) $ (\A[1]~input_o\)))) # (!\Mult0|auto_generated|cs2a[1]~0_combout\ & (!\A[0]~input_o\ & (\Mult0|auto_generated|le4a\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|cs2a[1]~0_combout\,
	datab => \A[0]~input_o\,
	datac => \Mult0|auto_generated|le4a\(5),
	datad => \A[1]~input_o\,
	combout => \Mult0|auto_generated|le4a\(1));

\Mult0|auto_generated|le4a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(0) = LCELL(\B[3]~input_o\ $ (((\B[1]~input_o\ & ((\B[2]~input_o\) # (\A[0]~input_o\))) # (!\B[1]~input_o\ & (\B[2]~input_o\ & \A[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \B[2]~input_o\,
	datac => \A[0]~input_o\,
	datad => \B[3]~input_o\,
	combout => \Mult0|auto_generated|le4a\(0));

\Mult0|auto_generated|le3a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(1) = LCELL((\B[0]~input_o\ & ((\B[1]~input_o\ $ (\A[1]~input_o\)))) # (!\B[0]~input_o\ & (!\A[0]~input_o\ & (\B[1]~input_o\))))

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
	combout => \Mult0|auto_generated|le3a\(1));

\Mult0|auto_generated|le3a[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(0) = LCELL(\B[1]~input_o\ $ (((\B[0]~input_o\ & \A[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B[1]~input_o\,
	datac => \B[0]~input_o\,
	datad => \A[0]~input_o\,
	combout => \Mult0|auto_generated|le3a\(0));

\Mult0|auto_generated|op_3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~0_combout\ = (\B[1]~input_o\ & (\Mult0|auto_generated|le3a\(0) $ (VCC))) # (!\B[1]~input_o\ & (\Mult0|auto_generated|le3a\(0) & VCC))
-- \Mult0|auto_generated|op_3~1\ = CARRY((\B[1]~input_o\ & \Mult0|auto_generated|le3a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \Mult0|auto_generated|le3a\(0),
	datad => VCC,
	combout => \Mult0|auto_generated|op_3~0_combout\,
	cout => \Mult0|auto_generated|op_3~1\);

\Mult0|auto_generated|op_3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~2_combout\ = (\Mult0|auto_generated|le3a\(1) & (!\Mult0|auto_generated|op_3~1\)) # (!\Mult0|auto_generated|le3a\(1) & ((\Mult0|auto_generated|op_3~1\) # (GND)))
-- \Mult0|auto_generated|op_3~3\ = CARRY((!\Mult0|auto_generated|op_3~1\) # (!\Mult0|auto_generated|le3a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(1),
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~1\,
	combout => \Mult0|auto_generated|op_3~2_combout\,
	cout => \Mult0|auto_generated|op_3~3\);

\Mult0|auto_generated|op_3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~4_combout\ = ((\Mult0|auto_generated|op_1~0_combout\ $ (\Mult0|auto_generated|le4a\(0) $ (!\Mult0|auto_generated|op_3~3\)))) # (GND)
-- \Mult0|auto_generated|op_3~5\ = CARRY((\Mult0|auto_generated|op_1~0_combout\ & ((\Mult0|auto_generated|le4a\(0)) # (!\Mult0|auto_generated|op_3~3\))) # (!\Mult0|auto_generated|op_1~0_combout\ & (\Mult0|auto_generated|le4a\(0) & 
-- !\Mult0|auto_generated|op_3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_1~0_combout\,
	datab => \Mult0|auto_generated|le4a\(0),
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~3\,
	combout => \Mult0|auto_generated|op_3~4_combout\,
	cout => \Mult0|auto_generated|op_3~5\);

\Mult0|auto_generated|op_3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~6_combout\ = (\Mult0|auto_generated|op_1~2_combout\ & ((\Mult0|auto_generated|le4a\(1) & (\Mult0|auto_generated|op_3~5\ & VCC)) # (!\Mult0|auto_generated|le4a\(1) & (!\Mult0|auto_generated|op_3~5\)))) # 
-- (!\Mult0|auto_generated|op_1~2_combout\ & ((\Mult0|auto_generated|le4a\(1) & (!\Mult0|auto_generated|op_3~5\)) # (!\Mult0|auto_generated|le4a\(1) & ((\Mult0|auto_generated|op_3~5\) # (GND)))))
-- \Mult0|auto_generated|op_3~7\ = CARRY((\Mult0|auto_generated|op_1~2_combout\ & (!\Mult0|auto_generated|le4a\(1) & !\Mult0|auto_generated|op_3~5\)) # (!\Mult0|auto_generated|op_1~2_combout\ & ((!\Mult0|auto_generated|op_3~5\) # 
-- (!\Mult0|auto_generated|le4a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_1~2_combout\,
	datab => \Mult0|auto_generated|le4a\(1),
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~5\,
	combout => \Mult0|auto_generated|op_3~6_combout\,
	cout => \Mult0|auto_generated|op_3~7\);

\Mult0|auto_generated|op_3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~8_combout\ = ((\Mult0|auto_generated|op_1~4_combout\ $ (\Mult0|auto_generated|le5a\(0) $ (!\Mult0|auto_generated|op_3~7\)))) # (GND)
-- \Mult0|auto_generated|op_3~9\ = CARRY((\Mult0|auto_generated|op_1~4_combout\ & ((\Mult0|auto_generated|le5a\(0)) # (!\Mult0|auto_generated|op_3~7\))) # (!\Mult0|auto_generated|op_1~4_combout\ & (\Mult0|auto_generated|le5a\(0) & 
-- !\Mult0|auto_generated|op_3~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_1~4_combout\,
	datab => \Mult0|auto_generated|le5a\(0),
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~7\,
	combout => \Mult0|auto_generated|op_3~8_combout\,
	cout => \Mult0|auto_generated|op_3~9\);

\Sel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sel(0),
	o => \Sel[0]~input_o\);

\Sel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sel(1),
	o => \Sel[1]~input_o\);

\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[0]~input_o\) # (GND)))
-- \Add1~1\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\B[1]~input_o\ & ((\A[1]~input_o\ & (!\Add1~1\)) # (!\A[1]~input_o\ & ((\Add1~1\) # (GND))))) # (!\B[1]~input_o\ & ((\A[1]~input_o\ & (\Add1~1\ & VCC)) # (!\A[1]~input_o\ & (!\Add1~1\))))
-- \Add1~3\ = CARRY((\B[1]~input_o\ & ((!\Add1~1\) # (!\A[1]~input_o\))) # (!\B[1]~input_o\ & (!\A[1]~input_o\ & !\Add1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \A[1]~input_o\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\B[2]~input_o\ $ (\A[2]~input_o\ $ (\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\B[2]~input_o\ & (\A[2]~input_o\ & !\Add1~3\)) # (!\B[2]~input_o\ & ((\A[2]~input_o\) # (!\Add1~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datab => \A[2]~input_o\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\B[3]~input_o\ & ((\A[3]~input_o\ & (!\Add1~5\)) # (!\A[3]~input_o\ & ((\Add1~5\) # (GND))))) # (!\B[3]~input_o\ & ((\A[3]~input_o\ & (\Add1~5\ & VCC)) # (!\A[3]~input_o\ & (!\Add1~5\))))
-- \Add1~7\ = CARRY((\B[3]~input_o\ & ((!\Add1~5\) # (!\A[3]~input_o\))) # (!\B[3]~input_o\ & (!\A[3]~input_o\ & !\Add1~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = \Add1~7\ $ (GND)
-- \Add1~9\ = CARRY(!\Add1~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

\Div0|auto_generated|divider|divider|op_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_1~1_cout\ = CARRY(!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|op_1~1_cout\);

\Div0|auto_generated|divider|divider|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_1~2_combout\ = (\B[1]~input_o\ & ((\Div0|auto_generated|divider|divider|op_1~1_cout\) # (GND))) # (!\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|op_1~1_cout\))
-- \Div0|auto_generated|divider|divider|op_1~3\ = CARRY((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|op_1~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|op_1~1_cout\,
	combout => \Div0|auto_generated|divider|divider|op_1~2_combout\,
	cout => \Div0|auto_generated|divider|divider|op_1~3\);

\Div0|auto_generated|divider|divider|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_1~4_combout\ = (\B[2]~input_o\ & (!\Div0|auto_generated|divider|divider|op_1~3\ & VCC)) # (!\B[2]~input_o\ & (\Div0|auto_generated|divider|divider|op_1~3\ $ (GND)))
-- \Div0|auto_generated|divider|divider|op_1~5\ = CARRY((!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|op_1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|op_1~3\,
	combout => \Div0|auto_generated|divider|divider|op_1~4_combout\,
	cout => \Div0|auto_generated|divider|divider|op_1~5\);

\Div0|auto_generated|divider|divider|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_1~6_combout\ = !\Div0|auto_generated|divider|divider|op_1~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_1~5\,
	combout => \Div0|auto_generated|divider|divider|op_1~6_combout\);

\Div0|auto_generated|divider|divider|StageOut[18]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ = (\Div0|auto_generated|divider|divider|op_1~4_combout\ & (!\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|op_1~4_combout\,
	datac => \B[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~23_combout\);

\Div0|auto_generated|divider|divider|StageOut[17]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\ = (\Div0|auto_generated|divider|divider|op_1~2_combout\ & (!\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|op_1~2_combout\,
	datac => \B[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\);

\Div0|auto_generated|divider|divider|StageOut[16]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ = (\B[0]~input_o\ & (!\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datac => \B[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~25_combout\);

\Div0|auto_generated|divider|divider|op_2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_2~1_cout\ = CARRY(!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|op_2~1_cout\);

\Div0|auto_generated|divider|divider|op_2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_2~2_combout\ = (\Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ & ((\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|op_2~1_cout\)) # (!\B[1]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|op_2~1_cout\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ & ((\B[1]~input_o\ & ((\Div0|auto_generated|divider|divider|op_2~1_cout\) # (GND))) # (!\B[1]~input_o\ & 
-- (!\Div0|auto_generated|divider|divider|op_2~1_cout\))))
-- \Div0|auto_generated|divider|divider|op_2~3\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ & (\B[1]~input_o\ & !\Div0|auto_generated|divider|divider|op_2~1_cout\)) # (!\Div0|auto_generated|divider|divider|StageOut[16]~25_combout\ 
-- & ((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|op_2~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[16]~25_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|op_2~1_cout\,
	combout => \Div0|auto_generated|divider|divider|op_2~2_combout\,
	cout => \Div0|auto_generated|divider|divider|op_2~3\);

\Div0|auto_generated|divider|divider|op_2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_2~4_combout\ = ((\Div0|auto_generated|divider|divider|StageOut[17]~24_combout\ $ (\B[2]~input_o\ $ (\Div0|auto_generated|divider|divider|op_2~3\)))) # (GND)
-- \Div0|auto_generated|divider|divider|op_2~5\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[17]~24_combout\ & ((!\Div0|auto_generated|divider|divider|op_2~3\) # (!\B[2]~input_o\))) # (!\Div0|auto_generated|divider|divider|StageOut[17]~24_combout\ 
-- & (!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|op_2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|op_2~3\,
	combout => \Div0|auto_generated|divider|divider|op_2~4_combout\,
	cout => \Div0|auto_generated|divider|divider|op_2~5\);

\Div0|auto_generated|divider|divider|op_2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_2~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ & ((\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|op_2~5\)) # (!\B[3]~input_o\ & (\Div0|auto_generated|divider|divider|op_2~5\ 
-- & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ & ((\B[3]~input_o\ & ((\Div0|auto_generated|divider|divider|op_2~5\) # (GND))) # (!\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|op_2~5\))))
-- \Div0|auto_generated|divider|divider|op_2~7\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ & (\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|op_2~5\)) # (!\Div0|auto_generated|divider|divider|StageOut[18]~23_combout\ & 
-- ((\B[3]~input_o\) # (!\Div0|auto_generated|divider|divider|op_2~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~23_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|op_2~5\,
	combout => \Div0|auto_generated|divider|divider|op_2~6_combout\,
	cout => \Div0|auto_generated|divider|divider|op_2~7\);

\Div0|auto_generated|divider|divider|op_2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_2~8_combout\ = \Div0|auto_generated|divider|divider|op_2~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_2~7\,
	combout => \Div0|auto_generated|divider|divider|op_2~8_combout\);

\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Sel[1]~input_o\ & (((!\Div0|auto_generated|divider|divider|op_2~8_combout\)) # (!\Sel[0]~input_o\))) # (!\Sel[1]~input_o\ & (\Sel[0]~input_o\ & (\Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[0]~input_o\,
	datac => \Add1~8_combout\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mux3~0_combout\);

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
-- \Add0~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & (\A[0]~input_o\ & VCC))
-- \Add0~1\ = CARRY((\B[0]~input_o\ & \A[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\B[1]~input_o\ & ((\A[1]~input_o\ & (\Add0~1\ & VCC)) # (!\A[1]~input_o\ & (!\Add0~1\)))) # (!\B[1]~input_o\ & ((\A[1]~input_o\ & (!\Add0~1\)) # (!\A[1]~input_o\ & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((\B[1]~input_o\ & (!\A[1]~input_o\ & !\Add0~1\)) # (!\B[1]~input_o\ & ((!\Add0~1\) # (!\A[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \A[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\B[2]~input_o\ $ (\A[2]~input_o\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\B[2]~input_o\ & ((\A[2]~input_o\) # (!\Add0~3\))) # (!\B[2]~input_o\ & (\A[2]~input_o\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datab => \A[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\B[3]~input_o\ & ((\A[3]~input_o\ & (\Add0~5\ & VCC)) # (!\A[3]~input_o\ & (!\Add0~5\)))) # (!\B[3]~input_o\ & ((\A[3]~input_o\ & (!\Add0~5\)) # (!\A[3]~input_o\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\B[3]~input_o\ & (!\A[3]~input_o\ & !\Add0~5\)) # (!\B[3]~input_o\ & ((!\Add0~5\) # (!\A[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = !\Add0~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add0~7\,
	combout => \Add0~8_combout\);

\Mod0|auto_generated|divider|divider|op_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_1~1_cout\ = CARRY(!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => VCC,
	cout => \Mod0|auto_generated|divider|divider|op_1~1_cout\);

\Mod0|auto_generated|divider|divider|op_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_1~2_combout\ = (\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|op_1~1_cout\) # (GND))) # (!\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_1~1_cout\))
-- \Mod0|auto_generated|divider|divider|op_1~3\ = CARRY((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|op_1~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|op_1~1_cout\,
	combout => \Mod0|auto_generated|divider|divider|op_1~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|op_1~3\);

\Mod0|auto_generated|divider|divider|op_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_1~4_combout\ = (\B[2]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_1~3\ & VCC)) # (!\B[2]~input_o\ & (\Mod0|auto_generated|divider|divider|op_1~3\ $ (GND)))
-- \Mod0|auto_generated|divider|divider|op_1~5\ = CARRY((!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|op_1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|op_1~3\,
	combout => \Mod0|auto_generated|divider|divider|op_1~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|op_1~5\);

\Mod0|auto_generated|divider|divider|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_1~6_combout\ = !\Mod0|auto_generated|divider|divider|op_1~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_1~5\,
	combout => \Mod0|auto_generated|divider|divider|op_1~6_combout\);

\Mod0|auto_generated|divider|divider|StageOut[18]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ = (\Mod0|auto_generated|divider|divider|op_1~4_combout\ & (!\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|op_1~4_combout\,
	datac => \B[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\);

\Mod0|auto_generated|divider|divider|StageOut[17]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\ = (\Mod0|auto_generated|divider|divider|op_1~2_combout\ & (!\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|op_1~2_combout\,
	datac => \B[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\);

\Mod0|auto_generated|divider|divider|StageOut[16]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ = (\B[0]~input_o\ & (!\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datac => \B[3]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\);

\Mod0|auto_generated|divider|divider|op_2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_2~1_cout\ = CARRY(!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => VCC,
	cout => \Mod0|auto_generated|divider|divider|op_2~1_cout\);

\Mod0|auto_generated|divider|divider|op_2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_2~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ & ((\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_2~1_cout\)) # (!\B[1]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|op_2~1_cout\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ & ((\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|op_2~1_cout\) # (GND))) # (!\B[1]~input_o\ & 
-- (!\Mod0|auto_generated|divider|divider|op_2~1_cout\))))
-- \Mod0|auto_generated|divider|divider|op_2~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ & (\B[1]~input_o\ & !\Mod0|auto_generated|divider|divider|op_2~1_cout\)) # (!\Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\ 
-- & ((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|op_2~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|op_2~1_cout\,
	combout => \Mod0|auto_generated|divider|divider|op_2~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|op_2~3\);

\Mod0|auto_generated|divider|divider|op_2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_2~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\ $ (\B[2]~input_o\ $ (\Mod0|auto_generated|divider|divider|op_2~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|op_2~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\ & ((!\Mod0|auto_generated|divider|divider|op_2~3\) # (!\B[2]~input_o\))) # (!\Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\ 
-- & (!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|op_2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|op_2~3\,
	combout => \Mod0|auto_generated|divider|divider|op_2~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|op_2~5\);

\Mod0|auto_generated|divider|divider|op_2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_2~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ & ((\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_2~5\)) # (!\B[3]~input_o\ & (\Mod0|auto_generated|divider|divider|op_2~5\ 
-- & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ & ((\B[3]~input_o\ & ((\Mod0|auto_generated|divider|divider|op_2~5\) # (GND))) # (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_2~5\))))
-- \Mod0|auto_generated|divider|divider|op_2~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ & (\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|op_2~5\)) # (!\Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\ & 
-- ((\B[3]~input_o\) # (!\Mod0|auto_generated|divider|divider|op_2~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[18]~22_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|op_2~5\,
	combout => \Mod0|auto_generated|divider|divider|op_2~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|op_2~7\);

\Mod0|auto_generated|divider|divider|op_2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_2~8_combout\ = \Mod0|auto_generated|divider|divider|op_2~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_2~7\,
	combout => \Mod0|auto_generated|divider|divider|op_2~8_combout\);

\Mod0|auto_generated|divider|divider|StageOut[24]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ = (\B[0]~input_o\ & !\Mod0|auto_generated|divider|divider|op_2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[3]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[3]~input_o\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ = CARRY((\A[3]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ & ((\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ & ((\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ & (\B[1]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\ & ((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[24]~28_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|StageOut[27]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\ = (\Mod0|auto_generated|divider|divider|op_1~4_combout\ & (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_1~6_combout\ & \Mod0|auto_generated|divider|divider|op_2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|op_1~4_combout\,
	datab => \B[3]~input_o\,
	datac => \Mod0|auto_generated|divider|divider|op_1~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\);

\Mod0|auto_generated|divider|divider|StageOut[27]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\ = (\Mod0|auto_generated|divider|divider|op_2~6_combout\ & !\Mod0|auto_generated|divider|divider|op_2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|op_2~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\);

\Mod0|auto_generated|divider|divider|StageOut[26]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ = (\Mod0|auto_generated|divider|divider|op_2~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\)) # (!\Mod0|auto_generated|divider|divider|op_2~8_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|op_2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\,
	datab => \Mod0|auto_generated|divider|divider|op_2~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\);

\Mod0|auto_generated|divider|divider|StageOut[25]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\ = (\Mod0|auto_generated|divider|divider|op_2~8_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\)) # (!\Mod0|auto_generated|divider|divider|op_2~8_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|op_2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~24_combout\,
	datab => \Mod0|auto_generated|divider|divider|op_2~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\ $ (\B[2]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\ & (!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ & ((\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ & ((\B[3]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ & (\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\ & ((\B[3]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~26_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[27]~25_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\);

\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

\Mod0|auto_generated|divider|divider|StageOut[33]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\B[0]~input_o\ & (!\Mod0|auto_generated|divider|divider|op_2~8_combout\))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\);

\Mod0|auto_generated|divider|divider|StageOut[32]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\A[3]~input_o\)) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[2]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[2]~input_o\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ = CARRY((\A[2]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[2]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ & ((\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ & ((\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ & (\B[1]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\ & ((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\ $ (\B[2]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\ & (!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|StageOut[36]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|op_2~6_combout\ & !\Mod0|auto_generated|divider|divider|op_2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|op_2~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[27]~52_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\);

\Mod0|auto_generated|divider|divider|StageOut[36]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\);

\Mod0|auto_generated|divider|divider|StageOut[35]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|op_2~8_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\)) # (!\Mod0|auto_generated|divider|divider|op_2~8_combout\ & ((\Mod0|auto_generated|divider|divider|op_2~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~23_combout\,
	datab => \Mod0|auto_generated|divider|divider|op_2~4_combout\,
	datac => \Mod0|auto_generated|divider|divider|op_2~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\);

\Mod0|auto_generated|divider|divider|StageOut[35]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\);

\Mod0|auto_generated|divider|divider|StageOut[34]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ & ((\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ & ((\B[3]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ & (\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\ & ((\B[3]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[34]~31_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~30_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ & (((\Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[36]~29_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\);

\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

\Mod0|auto_generated|divider|divider|StageOut[45]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[36]~53_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\);

\Mod0|auto_generated|divider|divider|StageOut[45]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\);

\Mod0|auto_generated|divider|divider|StageOut[44]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[35]~54_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\);

\Mod0|auto_generated|divider|divider|StageOut[44]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\);

\Mod0|auto_generated|divider|divider|StageOut[43]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\)) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~27_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\);

\Mod0|auto_generated|divider|divider|StageOut[43]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\);

\Mod0|auto_generated|divider|divider|StageOut[42]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\);

\Mod0|auto_generated|divider|divider|StageOut[41]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~32_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\);

\Mod0|auto_generated|divider|divider|StageOut[40]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\A[2]~input_o\)) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[1]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[1]~input_o\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ = CARRY((\A[1]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[1]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ & ((\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ & ((\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ & (\B[1]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\ & ((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\ $ (\B[2]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\ & (!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ & ((\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ & ((\B[3]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ & (\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\ & ((\B[3]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[42]~36_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[43]~35_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ & (((\Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ & (!\Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[44]~34_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ & ((((\Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ & ((\Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[45]~33_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\);

\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\);

\Mod0|auto_generated|divider|divider|StageOut[51]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\)) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[33]~55_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\);

\Mod0|auto_generated|divider|divider|StageOut[51]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\);

\Mod0|auto_generated|divider|divider|StageOut[50]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[41]~37_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\);

\Mod0|auto_generated|divider|divider|StageOut[49]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[40]~38_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\);

\Mod0|auto_generated|divider|divider|StageOut[48]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\A[1]~input_o\)) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[0]~input_o\) # (GND)))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ & ((\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ & ((\B[1]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\))))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ & (\B[1]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\ & ((\B[1]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4_combout\ = ((\Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\ $ (\B[2]~input_o\ $ (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\)))) # (GND)
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\ & ((!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\ & (!\B[2]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ & ((\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\ & VCC)))) # (!\Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ & ((\B[3]~input_o\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\))))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ & (\B[3]~input_o\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\)) # 
-- (!\Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\ & ((\B[3]~input_o\) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\);

\Mod0|auto_generated|divider|divider|StageOut[54]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[45]~56_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\);

\Mod0|auto_generated|divider|divider|StageOut[54]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\);

\Mod0|auto_generated|divider|divider|StageOut[53]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[44]~57_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\);

\Mod0|auto_generated|divider|divider|StageOut[53]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\);

\Mod0|auto_generated|divider|divider|StageOut[52]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[43]~58_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\);

\Mod0|auto_generated|divider|divider|StageOut[52]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ & (((\Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ & (!\Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ & ((((\Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ & ((\Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ & (((\Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ & (!\Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\);

\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ = \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\);

\Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[51]~62_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[51]~42_combout\,
	combout => \Mux3~1_combout\);

\Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Sel[2]~input_o\ & (((\Mux3~1_combout\) # (\Mux3~0_combout\)))) # (!\Sel[2]~input_o\ & (\Add0~8_combout\ & ((!\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \Add0~8_combout\,
	datac => \Mux3~1_combout\,
	datad => \Mux3~0_combout\,
	combout => \Mux3~2_combout\);

\Mux3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~0_combout\ & (!\Mux3~2_combout\ & ((\Mult0|auto_generated|op_3~8_combout\) # (\Sel[0]~input_o\)))) # (!\Mux3~0_combout\ & (((!\Sel[0]~input_o\ & \Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_3~8_combout\,
	datab => \Sel[0]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \Mux3~2_combout\,
	combout => \Mux3~3_combout\);

\Div0|auto_generated|divider|divider|selnose[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|selnose[0]~0_combout\ = (\B[0]~input_o\) # ((\B[1]~input_o\) # ((\B[2]~input_o\) # (\B[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \B[1]~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[3]~input_o\,
	combout => \Div0|auto_generated|divider|divider|selnose[0]~0_combout\);

\Mult0|auto_generated|le3a[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le3a\(5) = LCELL(\B[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	combout => \Mult0|auto_generated|le3a\(5));

\Mult0|auto_generated|le5a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(3) = LCELL((\A[3]~input_o\ & ((\B[3]~input_o\) # ((\B[1]~input_o\ & \B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \B[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le5a\(3));

\Mult0|auto_generated|le4a[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(4) = LCELL((\A[3]~input_o\ & (\B[3]~input_o\ & (\B[1]~input_o\ $ (\B[2]~input_o\)))) # (!\A[3]~input_o\ & (\B[3]~input_o\ $ (((\B[1]~input_o\ & \B[2]~input_o\))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le4a\(4));

\Mult0|auto_generated|le5a[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(2) = LCELL((\A[2]~input_o\ & ((\B[3]~input_o\) # ((\B[1]~input_o\ & \B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \B[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le5a\(2));

\Mult0|auto_generated|le4a[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le4a\(3) = LCELL((\Mult0|auto_generated|cs2a[1]~0_combout\ & ((\Mult0|auto_generated|le4a\(5) $ (\A[3]~input_o\)))) # (!\Mult0|auto_generated|cs2a[1]~0_combout\ & (!\A[2]~input_o\ & (\Mult0|auto_generated|le4a\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|cs2a[1]~0_combout\,
	datab => \A[2]~input_o\,
	datac => \Mult0|auto_generated|le4a\(5),
	datad => \A[3]~input_o\,
	combout => \Mult0|auto_generated|le4a\(3));

\Mult0|auto_generated|le5a[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|le5a\(1) = LCELL((\A[1]~input_o\ & ((\B[3]~input_o\) # ((\B[1]~input_o\ & \B[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \B[3]~input_o\,
	datac => \B[1]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mult0|auto_generated|le5a\(1));

\Mult0|auto_generated|op_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~6_combout\ = (\Mult0|auto_generated|le4a\(3) & ((\Mult0|auto_generated|le5a\(1) & (\Mult0|auto_generated|op_1~5\ & VCC)) # (!\Mult0|auto_generated|le5a\(1) & (!\Mult0|auto_generated|op_1~5\)))) # (!\Mult0|auto_generated|le4a\(3) 
-- & ((\Mult0|auto_generated|le5a\(1) & (!\Mult0|auto_generated|op_1~5\)) # (!\Mult0|auto_generated|le5a\(1) & ((\Mult0|auto_generated|op_1~5\) # (GND)))))
-- \Mult0|auto_generated|op_1~7\ = CARRY((\Mult0|auto_generated|le4a\(3) & (!\Mult0|auto_generated|le5a\(1) & !\Mult0|auto_generated|op_1~5\)) # (!\Mult0|auto_generated|le4a\(3) & ((!\Mult0|auto_generated|op_1~5\) # (!\Mult0|auto_generated|le5a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le4a\(3),
	datab => \Mult0|auto_generated|le5a\(1),
	datad => VCC,
	cin => \Mult0|auto_generated|op_1~5\,
	combout => \Mult0|auto_generated|op_1~6_combout\,
	cout => \Mult0|auto_generated|op_1~7\);

\Mult0|auto_generated|op_1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~8_combout\ = ((\Mult0|auto_generated|le4a\(4) $ (\Mult0|auto_generated|le5a\(2) $ (!\Mult0|auto_generated|op_1~7\)))) # (GND)
-- \Mult0|auto_generated|op_1~9\ = CARRY((\Mult0|auto_generated|le4a\(4) & ((\Mult0|auto_generated|le5a\(2)) # (!\Mult0|auto_generated|op_1~7\))) # (!\Mult0|auto_generated|le4a\(4) & (\Mult0|auto_generated|le5a\(2) & !\Mult0|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le4a\(4),
	datab => \Mult0|auto_generated|le5a\(2),
	datad => VCC,
	cin => \Mult0|auto_generated|op_1~7\,
	combout => \Mult0|auto_generated|op_1~8_combout\,
	cout => \Mult0|auto_generated|op_1~9\);

\Mult0|auto_generated|op_1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_1~10_combout\ = \Mult0|auto_generated|le4a\(5) $ (\Mult0|auto_generated|le5a\(3) $ (!\Mult0|auto_generated|op_1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le4a\(5),
	datab => \Mult0|auto_generated|le5a\(3),
	cin => \Mult0|auto_generated|op_1~9\,
	combout => \Mult0|auto_generated|op_1~10_combout\);

\Mult0|auto_generated|op_3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~10_combout\ = (\Mult0|auto_generated|le3a\(5) & ((\Mult0|auto_generated|op_1~6_combout\ & (\Mult0|auto_generated|op_3~9\ & VCC)) # (!\Mult0|auto_generated|op_1~6_combout\ & (!\Mult0|auto_generated|op_3~9\)))) # 
-- (!\Mult0|auto_generated|le3a\(5) & ((\Mult0|auto_generated|op_1~6_combout\ & (!\Mult0|auto_generated|op_3~9\)) # (!\Mult0|auto_generated|op_1~6_combout\ & ((\Mult0|auto_generated|op_3~9\) # (GND)))))
-- \Mult0|auto_generated|op_3~11\ = CARRY((\Mult0|auto_generated|le3a\(5) & (!\Mult0|auto_generated|op_1~6_combout\ & !\Mult0|auto_generated|op_3~9\)) # (!\Mult0|auto_generated|le3a\(5) & ((!\Mult0|auto_generated|op_3~9\) # 
-- (!\Mult0|auto_generated|op_1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(5),
	datab => \Mult0|auto_generated|op_1~6_combout\,
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~9\,
	combout => \Mult0|auto_generated|op_3~10_combout\,
	cout => \Mult0|auto_generated|op_3~11\);

\Mult0|auto_generated|op_3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~12_combout\ = ((\Mult0|auto_generated|le3a\(5) $ (\Mult0|auto_generated|op_1~8_combout\ $ (!\Mult0|auto_generated|op_3~11\)))) # (GND)
-- \Mult0|auto_generated|op_3~13\ = CARRY((\Mult0|auto_generated|le3a\(5) & ((\Mult0|auto_generated|op_1~8_combout\) # (!\Mult0|auto_generated|op_3~11\))) # (!\Mult0|auto_generated|le3a\(5) & (\Mult0|auto_generated|op_1~8_combout\ & 
-- !\Mult0|auto_generated|op_3~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(5),
	datab => \Mult0|auto_generated|op_1~8_combout\,
	datad => VCC,
	cin => \Mult0|auto_generated|op_3~11\,
	combout => \Mult0|auto_generated|op_3~12_combout\,
	cout => \Mult0|auto_generated|op_3~13\);

\Mult0|auto_generated|op_3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mult0|auto_generated|op_3~14_combout\ = \Mult0|auto_generated|le3a\(5) $ (\Mult0|auto_generated|op_1~10_combout\ $ (!\Mult0|auto_generated|op_3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|le3a\(5),
	datab => \Mult0|auto_generated|op_1~10_combout\,
	cin => \Mult0|auto_generated|op_3~13\,
	combout => \Mult0|auto_generated|op_3~14_combout\);

\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Sel[1]~input_o\ & !\Sel[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datad => \Sel[2]~input_o\,
	combout => \Mux0~0_combout\);

\Mod0|auto_generated|divider|divider|StageOut[63]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[63]~46_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[7]~14_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[54]~59_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[54]~39_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[63]~46_combout\);

\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = !\Add1~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~9\,
	combout => \Add1~10_combout\);

\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Sel[0]~input_o\ & \Add1~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[0]~input_o\,
	datab => \Add1~10_combout\,
	combout => \Mux0~1_combout\);

\Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (!\Sel[1]~input_o\ & ((!\Sel[0]~input_o\) # (!\Sel[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Sel[2]~input_o\,
	datac => \Sel[0]~input_o\,
	datad => \Sel[1]~input_o\,
	combout => \Mux0~2_combout\);

\Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Sel[2]~input_o\) # ((\Sel[1]~input_o\ & \Sel[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[2]~input_o\,
	datab => \Sel[1]~input_o\,
	datac => \Sel[0]~input_o\,
	combout => \Mux0~3_combout\);

\Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = (\Mux0~2_combout\ & ((\Mux0~3_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[63]~46_combout\)) # (!\Mux0~3_combout\ & ((\Mux0~1_combout\))))) # (!\Mux0~2_combout\ & (((!\Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[63]~46_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux0~4_combout\);

\Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~5_combout\ = (\Mux0~0_combout\ & ((\Mux0~4_combout\ & ((\Mult0|auto_generated|op_3~14_combout\))) # (!\Mux0~4_combout\ & (!\Div0|auto_generated|divider|divider|selnose[0]~0_combout\)))) # (!\Mux0~0_combout\ & (((\Mux0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|selnose[0]~0_combout\,
	datab => \Mult0|auto_generated|op_3~14_combout\,
	datac => \Mux0~0_combout\,
	datad => \Mux0~4_combout\,
	combout => \Mux0~5_combout\);

\Mod0|auto_generated|divider|divider|StageOut[62]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[62]~47_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[6]~12_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[53]~60_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[53]~40_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[62]~47_combout\);

\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Mux0~2_combout\ & ((\Mux0~3_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[62]~47_combout\)) # (!\Mux0~3_combout\ & ((\Mux0~1_combout\))))) # (!\Mux0~2_combout\ & (((!\Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[62]~47_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux1~0_combout\);

\Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux0~0_combout\ & ((\Mux1~0_combout\ & ((\Mult0|auto_generated|op_3~12_combout\))) # (!\Mux1~0_combout\ & (!\Div0|auto_generated|divider|divider|selnose[0]~0_combout\)))) # (!\Mux0~0_combout\ & (((\Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|selnose[0]~0_combout\,
	datab => \Mult0|auto_generated|op_3~12_combout\,
	datac => \Mux0~0_combout\,
	datad => \Mux1~0_combout\,
	combout => \Mux1~1_combout\);

\Div0|auto_generated|divider|divider|StageOut[18]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~22_combout\ = (!\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|op_1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[3]~input_o\,
	datad => \Div0|auto_generated|divider|divider|op_1~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~22_combout\);

\Mod0|auto_generated|divider|divider|StageOut[61]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[61]~48_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~10_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[52]~61_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[52]~41_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[61]~48_combout\);

\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Mux0~2_combout\ & ((\Mux0~3_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[61]~48_combout\)) # (!\Mux0~3_combout\ & ((\Mux0~1_combout\))))) # (!\Mux0~2_combout\ & (((!\Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[61]~48_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux0~3_combout\,
	combout => \Mux2~0_combout\);

\Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Mux0~0_combout\ & ((\Mux2~0_combout\ & ((\Mult0|auto_generated|op_3~10_combout\))) # (!\Mux2~0_combout\ & (\Div0|auto_generated|divider|divider|StageOut[18]~22_combout\)))) # (!\Mux0~0_combout\ & (((\Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~22_combout\,
	datab => \Mult0|auto_generated|op_3~10_combout\,
	datac => \Mux0~0_combout\,
	datad => \Mux2~0_combout\,
	combout => \Mux2~1_combout\);

\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \Mux2~1_combout\ $ (VCC)
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\Mux2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\Mux1~1_combout\ & (\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\Mux1~1_combout\ & 
-- (!\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\Mux1~1_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

\Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\Mux0~5_combout\ & (\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\Mux0~5_combout\ & 
-- (!\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\Mux0~5_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~5_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

\Div1|auto_generated|divider|divider|StageOut[18]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[18]~34_combout\ = (\Mux0~5_combout\ & \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~5_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[18]~34_combout\);

\Div1|auto_generated|divider|divider|StageOut[18]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[18]~35_combout\ = (\Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[18]~35_combout\);

\Div1|auto_generated|divider|divider|StageOut[17]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[17]~36_combout\ = (\Mux1~1_combout\ & \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[17]~36_combout\);

\Div1|auto_generated|divider|divider|StageOut[17]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\ = (\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\);

\Div1|auto_generated|divider|divider|StageOut[16]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ = (\Mux2~1_combout\ & \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\);

\Div1|auto_generated|divider|divider|StageOut[16]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[16]~39_combout\ = (\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[16]~39_combout\);

\Div1|auto_generated|divider|divider|StageOut[15]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[15]~40_combout\ = (\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mux3~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \Mux3~3_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[15]~40_combout\);

\Div1|auto_generated|divider|divider|StageOut[15]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[15]~41_combout\ = (\Mux3~3_combout\ & !\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[15]~41_combout\);

\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[15]~40_combout\) # (\Div1|auto_generated|divider|divider|StageOut[15]~41_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[15]~40_combout\) # (\Div1|auto_generated|divider|divider|StageOut[15]~41_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[15]~40_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[15]~41_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[16]~39_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[16]~39_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[16]~38_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[16]~39_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[16]~38_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[16]~39_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

\Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Div1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[17]~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[17]~36_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[17]~37_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

\Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[18]~34_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[18]~35_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[18]~34_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[18]~35_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

\Div1|auto_generated|divider|divider|StageOut[21]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[21]~44_combout\ = (\Mux3~3_combout\ & \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[21]~44_combout\);

\Div1|auto_generated|divider|divider|StageOut[21]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[21]~45_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[21]~45_combout\);

\Mux4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\A[3]~input_o\ & ((\Sel[1]~input_o\ $ (\B[3]~input_o\)) # (!\Sel[0]~input_o\))) # (!\A[3]~input_o\ & ((\Sel[1]~input_o\ & ((\B[3]~input_o\))) # (!\Sel[1]~input_o\ & (!\Sel[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[0]~input_o\,
	datac => \A[3]~input_o\,
	datad => \B[3]~input_o\,
	combout => \Mux4~2_combout\);

\Mod0|auto_generated|divider|divider|StageOut[59]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[59]~49_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[50]~43_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[59]~49_combout\);

\Mux4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (\Mux4~2_combout\ & ((\Sel[1]~input_o\) # ((\Sel[0]~input_o\) # (\Mod0|auto_generated|divider|divider|StageOut[59]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Mux4~2_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[59]~49_combout\,
	combout => \Mux4~3_combout\);

\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Sel[1]~input_o\ & (((\Sel[0]~input_o\)))) # (!\Sel[1]~input_o\ & ((\Sel[0]~input_o\ & (\Add1~6_combout\)) # (!\Sel[0]~input_o\ & ((\Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Add1~6_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Add0~6_combout\,
	combout => \Mux4~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[27]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~47_combout\ = (\Div0|auto_generated|divider|divider|op_1~4_combout\ & (!\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|op_1~6_combout\ & \Div0|auto_generated|divider|divider|op_2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|op_1~4_combout\,
	datab => \B[3]~input_o\,
	datac => \Div0|auto_generated|divider|divider|op_1~6_combout\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~47_combout\);

\Div0|auto_generated|divider|divider|StageOut[27]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~26_combout\ = (\Div0|auto_generated|divider|divider|op_2~6_combout\ & !\Div0|auto_generated|divider|divider|op_2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|op_2~6_combout\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~26_combout\);

\Div0|auto_generated|divider|divider|StageOut[26]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ = (\Div0|auto_generated|divider|divider|op_2~8_combout\ & (\Div0|auto_generated|divider|divider|StageOut[17]~24_combout\)) # (!\Div0|auto_generated|divider|divider|op_2~8_combout\ & 
-- ((\Div0|auto_generated|divider|divider|op_2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\,
	datab => \Div0|auto_generated|divider|divider|op_2~4_combout\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~27_combout\);

\Div0|auto_generated|divider|divider|StageOut[25]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\ = (\Div0|auto_generated|divider|divider|op_2~8_combout\ & (\Div0|auto_generated|divider|divider|StageOut[16]~25_combout\)) # (!\Div0|auto_generated|divider|divider|op_2~8_combout\ & 
-- ((\Div0|auto_generated|divider|divider|op_2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[16]~25_combout\,
	datab => \Div0|auto_generated|divider|divider|op_2~2_combout\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\);

\Div0|auto_generated|divider|divider|StageOut[24]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ = (\B[0]~input_o\ & !\Div0|auto_generated|divider|divider|op_2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datad => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[24]~29_combout\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[3]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[3]~input_o\) # (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ = CARRY((\A[3]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (\Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ & ((\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ & ((\B[1]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ & (\B[1]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[24]~29_combout\ & ((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[24]~29_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = ((\Div0|auto_generated|divider|divider|StageOut[25]~28_combout\ $ (\B[2]~input_o\ $ (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))) # (GND)
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[25]~28_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[25]~28_combout\ & (!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ & ((\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ & ((\B[3]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ & (\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[26]~27_combout\ & ((\B[3]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[26]~27_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[27]~47_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[27]~26_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[27]~47_combout\) # 
-- ((\Div0|auto_generated|divider|divider|StageOut[27]~26_combout\) # (GND))))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[27]~47_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[27]~26_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[27]~47_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[27]~26_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\);

\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

\Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Sel[1]~input_o\ & ((\Mux4~0_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\))) # (!\Mux4~0_combout\ & (\Mult0|auto_generated|op_3~6_combout\)))) # (!\Sel[1]~input_o\ & (((\Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_3~6_combout\,
	datab => \Sel[1]~input_o\,
	datac => \Mux4~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Mux4~1_combout\);

\Div1|auto_generated|divider|divider|StageOut[20]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[20]~46_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Mux4~3_combout\,
	datac => \Mux4~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Div1|auto_generated|divider|divider|StageOut[20]~46_combout\);

\Div1|auto_generated|divider|divider|StageOut[20]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[20]~47_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~3_combout\,
	datab => \Mux4~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[20]~47_combout\);

\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[20]~46_combout\) # (\Div1|auto_generated|divider|divider|StageOut[20]~47_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[20]~46_combout\) # (\Div1|auto_generated|divider|divider|StageOut[20]~47_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[20]~46_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[20]~47_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[21]~44_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[21]~45_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[21]~44_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[21]~45_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[21]~44_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[21]~45_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[21]~44_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[21]~45_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

\Div1|auto_generated|divider|divider|StageOut[23]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[23]~63_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mux1~1_combout\))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mux1~1_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[23]~63_combout\);

\Div1|auto_generated|divider|divider|StageOut[23]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[23]~42_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[23]~42_combout\);

\Div1|auto_generated|divider|divider|StageOut[22]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[22]~64_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mux2~1_combout\))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mux2~1_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[22]~64_combout\);

\Div1|auto_generated|divider|divider|StageOut[22]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[22]~43_combout\ = (\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[22]~43_combout\);

\Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Div1|auto_generated|divider|divider|StageOut[22]~64_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[22]~43_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[22]~64_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[22]~43_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[22]~64_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[22]~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[22]~64_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[22]~43_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

\Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[23]~63_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[23]~42_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[23]~63_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[23]~42_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

\Div1|auto_generated|divider|divider|StageOut[28]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[28]~58_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[22]~64_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[22]~64_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[28]~58_combout\);

\Div1|auto_generated|divider|divider|StageOut[28]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[28]~48_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[28]~48_combout\);

\Div1|auto_generated|divider|divider|StageOut[27]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[27]~65_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mux3~3_combout\))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mux3~3_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[27]~65_combout\);

\Div1|auto_generated|divider|divider|StageOut[27]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[27]~49_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[27]~49_combout\);

\Div1|auto_generated|divider|divider|StageOut[26]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[26]~50_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mux4~3_combout\,
	datac => \Mux4~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Div1|auto_generated|divider|divider|StageOut[26]~50_combout\);

\Div1|auto_generated|divider|divider|StageOut[26]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[26]~51_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[26]~51_combout\);

\Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\A[2]~input_o\ & ((\Sel[1]~input_o\ $ (\B[2]~input_o\)) # (!\Sel[0]~input_o\))) # (!\A[2]~input_o\ & ((\Sel[1]~input_o\ & ((\B[2]~input_o\))) # (!\Sel[1]~input_o\ & (!\Sel[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[0]~input_o\,
	datac => \A[2]~input_o\,
	datad => \B[2]~input_o\,
	combout => \Mux5~2_combout\);

\Mod0|auto_generated|divider|divider|StageOut[58]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[58]~50_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[49]~44_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[58]~50_combout\);

\Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Mux5~2_combout\ & ((\Sel[1]~input_o\) # ((\Sel[0]~input_o\) # (\Mod0|auto_generated|divider|divider|StageOut[58]~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Mux5~2_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[58]~50_combout\,
	combout => \Mux5~3_combout\);

\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Sel[1]~input_o\ & (((\Sel[0]~input_o\)))) # (!\Sel[1]~input_o\ & ((\Sel[0]~input_o\ & (\Add1~4_combout\)) # (!\Sel[0]~input_o\ & ((\Add0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Add1~4_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Add0~4_combout\,
	combout => \Mux5~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[36]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[36]~48_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[27]~47_combout\) # 
-- ((\Div0|auto_generated|divider|divider|op_2~6_combout\ & !\Div0|auto_generated|divider|divider|op_2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|op_2~6_combout\,
	datab => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[27]~47_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[36]~48_combout\);

\Div0|auto_generated|divider|divider|StageOut[36]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[36]~30_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[36]~30_combout\);

\Div0|auto_generated|divider|divider|StageOut[35]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[35]~49_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Div0|auto_generated|divider|divider|op_2~8_combout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~24_combout\)) # (!\Div0|auto_generated|divider|divider|op_2~8_combout\ & ((\Div0|auto_generated|divider|divider|op_2~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~24_combout\,
	datab => \Div0|auto_generated|divider|divider|op_2~4_combout\,
	datac => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[35]~49_combout\);

\Div0|auto_generated|divider|divider|StageOut[35]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[35]~31_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[35]~31_combout\);

\Div0|auto_generated|divider|divider|StageOut[34]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\Div0|auto_generated|divider|divider|StageOut[25]~28_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[34]~32_combout\);

\Div0|auto_generated|divider|divider|StageOut[33]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\B[0]~input_o\ & (!\Div0|auto_generated|divider|divider|op_2~8_combout\))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (((\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \Div0|auto_generated|divider|divider|op_2~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\);

\Div0|auto_generated|divider|divider|StageOut[32]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (\A[3]~input_o\)) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[32]~33_combout\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[2]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[2]~input_o\) # (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ = CARRY((\A[2]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[2]~input_o\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (\Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ & ((\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ & ((\B[1]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ & (\B[1]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[32]~33_combout\ & ((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[32]~33_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = ((\Div0|auto_generated|divider|divider|StageOut[33]~50_combout\ $ (\B[2]~input_o\ $ (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))) # (GND)
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[33]~50_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[33]~50_combout\ & (!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ & ((\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ & ((\B[3]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ & (\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[34]~32_combout\ & ((\B[3]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[34]~32_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[35]~49_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[35]~31_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[35]~49_combout\) # 
-- ((\Div0|auto_generated|divider|divider|StageOut[35]~31_combout\) # (GND))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[35]~49_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[35]~31_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[35]~49_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[35]~31_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ & (((\Div0|auto_generated|divider|divider|StageOut[36]~48_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[36]~30_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ & (!\Div0|auto_generated|divider|divider|StageOut[36]~48_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[36]~30_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[36]~48_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[36]~30_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[36]~48_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[36]~30_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\);

\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

\Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Sel[1]~input_o\ & ((\Mux5~0_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))) # (!\Mux5~0_combout\ & (\Mult0|auto_generated|op_3~4_combout\)))) # (!\Sel[1]~input_o\ & (((\Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_3~4_combout\,
	datab => \Sel[1]~input_o\,
	datac => \Mux5~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Mux5~1_combout\);

\Div1|auto_generated|divider|divider|StageOut[25]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[25]~52_combout\ = (\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mux5~3_combout\,
	datac => \Mux5~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Div1|auto_generated|divider|divider|StageOut[25]~52_combout\);

\Div1|auto_generated|divider|divider|StageOut[25]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[25]~53_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~3_combout\,
	datab => \Mux5~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[25]~53_combout\);

\Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[25]~52_combout\) # (\Div1|auto_generated|divider|divider|StageOut[25]~53_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[25]~52_combout\) # (\Div1|auto_generated|divider|divider|StageOut[25]~53_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[25]~52_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[25]~53_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[26]~50_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[26]~51_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[26]~50_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[26]~51_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[26]~50_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[26]~51_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[26]~50_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[26]~51_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Div1|auto_generated|divider|divider|StageOut[27]~65_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[27]~49_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[27]~65_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[27]~49_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[27]~65_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[27]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[27]~65_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[27]~49_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[28]~58_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[28]~48_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[28]~58_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[28]~48_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

\Div1|auto_generated|divider|divider|StageOut[33]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[33]~59_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[27]~65_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[27]~65_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[33]~59_combout\);

\Div1|auto_generated|divider|divider|StageOut[33]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[33]~54_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[33]~54_combout\);

\Div1|auto_generated|divider|divider|StageOut[32]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[32]~60_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[26]~50_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[26]~50_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[32]~60_combout\);

\Div1|auto_generated|divider|divider|StageOut[32]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[32]~55_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[32]~55_combout\);

\Div1|auto_generated|divider|divider|StageOut[31]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[31]~56_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => \Mux5~3_combout\,
	datac => \Mux5~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Div1|auto_generated|divider|divider|StageOut[31]~56_combout\);

\Div1|auto_generated|divider|divider|StageOut[31]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[31]~57_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[31]~57_combout\);

\Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\A[1]~input_o\ & ((\Sel[1]~input_o\ $ (\B[1]~input_o\)) # (!\Sel[0]~input_o\))) # (!\A[1]~input_o\ & ((\Sel[1]~input_o\ & ((\B[1]~input_o\))) # (!\Sel[1]~input_o\ & (!\Sel[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Sel[0]~input_o\,
	datac => \A[1]~input_o\,
	datad => \B[1]~input_o\,
	combout => \Mux6~3_combout\);

\Mod0|auto_generated|divider|divider|StageOut[57]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[57]~51_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\)) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[48]~45_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[57]~51_combout\);

\Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (\Mux6~3_combout\ & ((\Sel[1]~input_o\) # ((\Sel[0]~input_o\) # (\Mod0|auto_generated|divider|divider|StageOut[57]~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Mux6~3_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[57]~51_combout\,
	combout => \Mux6~4_combout\);

\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Sel[1]~input_o\ & (((\Sel[0]~input_o\)))) # (!\Sel[1]~input_o\ & ((\Sel[0]~input_o\ & (\Add1~2_combout\)) # (!\Sel[0]~input_o\ & ((\Add0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Add1~2_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Add0~2_combout\,
	combout => \Mux6~0_combout\);

\Div0|auto_generated|divider|divider|StageOut[45]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[45]~51_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[36]~48_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[36]~48_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[45]~51_combout\);

\Div0|auto_generated|divider|divider|StageOut[45]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[45]~34_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[45]~34_combout\);

\Div0|auto_generated|divider|divider|StageOut[44]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[44]~52_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[35]~49_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[35]~49_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[44]~52_combout\);

\Div0|auto_generated|divider|divider|StageOut[44]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[44]~35_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[44]~35_combout\);

\Div0|auto_generated|divider|divider|StageOut[43]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[43]~53_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[25]~28_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~28_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[43]~53_combout\);

\Div0|auto_generated|divider|divider|StageOut[43]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[43]~36_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[43]~36_combout\);

\Div0|auto_generated|divider|divider|StageOut[42]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\Div0|auto_generated|divider|divider|StageOut[33]~50_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[42]~37_combout\);

\Div0|auto_generated|divider|divider|StageOut[41]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[41]~38_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\Div0|auto_generated|divider|divider|StageOut[32]~33_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[32]~33_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[41]~38_combout\);

\Div0|auto_generated|divider|divider|StageOut[40]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\A[2]~input_o\)) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[40]~39_combout\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ = (\B[0]~input_o\ & (\A[1]~input_o\ $ (VCC))) # (!\B[0]~input_o\ & ((\A[1]~input_o\) # (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ = CARRY((\A[1]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[1]~input_o\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ = (\Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ & ((\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # (!\B[1]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ & ((\B[1]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\) # (GND))) # 
-- (!\B[1]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ & (\B[1]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[40]~39_combout\ & ((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[40]~39_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ = ((\Div0|auto_generated|divider|divider|StageOut[41]~38_combout\ $ (\B[2]~input_o\ $ (\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)))) # (GND)
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[41]~38_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\) # (!\B[2]~input_o\))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[41]~38_combout\ & (!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[41]~38_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ & ((\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # (!\B[3]~input_o\ & 
-- (\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ & VCC)))) # (!\Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ & ((\B[3]~input_o\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\) # (GND))) # 
-- (!\B[3]~input_o\ & (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ & (\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[42]~37_combout\ & ((\B[3]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[42]~37_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[43]~53_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[43]~36_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[43]~53_combout\) # 
-- ((\Div0|auto_generated|divider|divider|StageOut[43]~36_combout\) # (GND))))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[43]~53_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[43]~36_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[43]~53_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[43]~36_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ & (((\Div0|auto_generated|divider|divider|StageOut[44]~52_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[44]~35_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ & (!\Div0|auto_generated|divider|divider|StageOut[44]~52_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[44]~35_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[44]~52_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[44]~35_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[44]~52_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[44]~35_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[45]~51_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[45]~34_combout\))))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[45]~51_combout\) # 
-- ((\Div0|auto_generated|divider|divider|StageOut[45]~34_combout\) # (GND))))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[45]~51_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[45]~34_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[45]~51_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[45]~34_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\);

\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ = !\Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\);

\Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Sel[1]~input_o\ & ((\Mux6~0_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\))) # (!\Mux6~0_combout\ & (\Mult0|auto_generated|op_3~2_combout\)))) # (!\Sel[1]~input_o\ & (((\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_3~2_combout\,
	datab => \Sel[1]~input_o\,
	datac => \Mux6~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Mux6~1_combout\);

\Div1|auto_generated|divider|divider|StageOut[30]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[30]~61_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux6~4_combout\)) # (!\Sel[2]~input_o\ & ((\Mux6~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux6~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[30]~61_combout\);

\Div1|auto_generated|divider|divider|StageOut[30]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[30]~62_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux6~4_combout\)) # (!\Sel[2]~input_o\ & ((\Mux6~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux6~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[30]~62_combout\);

\Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1_cout\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[30]~61_combout\) # (\Div1|auto_generated|divider|divider|StageOut[30]~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[30]~61_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[30]~62_combout\,
	datad => VCC,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1_cout\);

\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[31]~56_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[31]~57_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[31]~56_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[31]~57_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~1_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3_cout\);

\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5_cout\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3_cout\ & ((\Div1|auto_generated|divider|divider|StageOut[32]~60_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[32]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[32]~60_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[32]~55_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~3_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5_cout\);

\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[33]~59_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[33]~54_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[33]~59_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[33]~54_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~5_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\);

\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\);

\RESULT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RESULT~0_combout\ = (\B[0]~input_o\ & \A[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	combout => \RESULT~0_combout\);

\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & (\A[0]~input_o\)) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ & ((\Sel[1]~input_o\ & (\A[0]~input_o\)) # (!\Sel[1]~input_o\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[0]~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	datad => \Sel[1]~input_o\,
	combout => \Mux7~0_combout\);

\Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Sel[0]~input_o\ & (((\Sel[1]~input_o\)))) # (!\Sel[0]~input_o\ & ((\Mux7~0_combout\) # ((\B[0]~input_o\ & \Sel[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \Sel[0]~input_o\,
	datac => \Sel[1]~input_o\,
	datad => \Mux7~0_combout\,
	combout => \Mux7~1_combout\);

\Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\Sel[0]~input_o\ & ((\Mux7~1_combout\ & ((\Add0~0_combout\))) # (!\Mux7~1_combout\ & (\RESULT~0_combout\)))) # (!\Sel[0]~input_o\ & (((\Mux7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESULT~0_combout\,
	datab => \Sel[0]~input_o\,
	datac => \Mux7~1_combout\,
	datad => \Add0~0_combout\,
	combout => \Mux7~2_combout\);

\Mux7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\Sel[1]~input_o\ & (((\Sel[0]~input_o\)))) # (!\Sel[1]~input_o\ & ((\Sel[0]~input_o\ & (\Add1~0_combout\)) # (!\Sel[0]~input_o\ & ((\Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sel[1]~input_o\,
	datab => \Add1~0_combout\,
	datac => \Sel[0]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Mux7~3_combout\);

\Div0|auto_generated|divider|divider|StageOut[54]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[54]~54_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[45]~51_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[45]~51_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[54]~54_combout\);

\Div0|auto_generated|divider|divider|StageOut[54]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[54]~40_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[54]~40_combout\);

\Div0|auto_generated|divider|divider|StageOut[53]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[53]~55_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[44]~52_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[44]~52_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[53]~55_combout\);

\Div0|auto_generated|divider|divider|StageOut[53]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[53]~41_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[53]~41_combout\);

\Div0|auto_generated|divider|divider|StageOut[52]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[52]~56_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[43]~53_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[43]~53_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[52]~56_combout\);

\Div0|auto_generated|divider|divider|StageOut[52]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[52]~42_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[52]~42_combout\);

\Div0|auto_generated|divider|divider|StageOut[51]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[51]~57_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[33]~50_combout\)) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[33]~50_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[51]~57_combout\);

\Div0|auto_generated|divider|divider|StageOut[51]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[51]~43_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[51]~43_combout\);

\Div0|auto_generated|divider|divider|StageOut[50]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[50]~44_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\Div0|auto_generated|divider|divider|StageOut[41]~38_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[41]~38_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[50]~44_combout\);

\Div0|auto_generated|divider|divider|StageOut[49]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[49]~45_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\Div0|auto_generated|divider|divider|StageOut[40]~39_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[40]~39_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[49]~45_combout\);

\Div0|auto_generated|divider|divider|StageOut[48]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[48]~46_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\A[1]~input_o\)) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[48]~46_combout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[0]~input_o\,
	datab => \A[0]~input_o\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[48]~46_combout\ & (\B[1]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[48]~46_combout\ & ((\B[1]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[48]~46_combout\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[49]~45_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\) # (!\B[2]~input_o\))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[49]~45_combout\ & (!\B[2]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[49]~45_combout\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[50]~44_combout\ & (\B[3]~input_o\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[50]~44_combout\ & ((\B[3]~input_o\) # (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[50]~44_combout\,
	datab => \B[3]~input_o\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[51]~57_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[51]~43_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[51]~57_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[51]~43_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[52]~56_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[52]~42_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[52]~56_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[52]~42_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[53]~55_combout\) # ((\Div0|auto_generated|divider|divider|StageOut[53]~41_combout\) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[53]~55_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[53]~41_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[54]~54_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[54]~40_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[54]~54_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[54]~40_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\);

\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\);

\Mux7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = (\Sel[1]~input_o\ & ((\Mux7~3_combout\ & ((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\))) # (!\Mux7~3_combout\ & (\Mult0|auto_generated|op_3~0_combout\)))) # (!\Sel[1]~input_o\ & (((\Mux7~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|auto_generated|op_3~0_combout\,
	datab => \Sel[1]~input_o\,
	datac => \Mux7~3_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	combout => \Mux7~4_combout\);

\Mux7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~5_combout\ = (\Sel[2]~input_o\ & (\Mux7~2_combout\)) # (!\Sel[2]~input_o\ & ((\Mux7~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~2_combout\,
	datab => \Mux7~4_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mux7~5_combout\);

\Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Sel[2]~input_o\ & (\Mux6~4_combout\)) # (!\Sel[2]~input_o\ & ((\Mux6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux6~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mux6~2_combout\);

\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \Mux2~1_combout\ $ (VCC)
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\Mux2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\Mux1~1_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\Mux1~1_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\Mux1~1_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\Mux0~5_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\Mux0~5_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\Mux0~5_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~5_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

\Mod1|auto_generated|divider|divider|StageOut[16]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\ = (\Mux2~1_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\);

\Mod1|auto_generated|divider|divider|StageOut[16]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\);

\Mod1|auto_generated|divider|divider|StageOut[15]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\ = (\Mux3~3_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\);

\Mod1|auto_generated|divider|divider|StageOut[15]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\ = (\Mux3~3_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\);

\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[15]~40_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[15]~41_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[16]~38_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[16]~39_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

\Mod1|auto_generated|divider|divider|StageOut[18]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~34_combout\ = (\Mux0~5_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~5_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~34_combout\);

\Mod1|auto_generated|divider|divider|StageOut[18]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~35_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~35_combout\);

\Mod1|auto_generated|divider|divider|StageOut[17]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\ = (\Mux1~1_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\);

\Mod1|auto_generated|divider|divider|StageOut[17]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\);

\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[17]~36_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[17]~37_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

\Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[18]~34_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[18]~35_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[18]~34_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[18]~35_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

\Mod1|auto_generated|divider|divider|StageOut[23]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[23]~66_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mux1~1_combout\))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mux1~1_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[23]~66_combout\);

\Mod1|auto_generated|divider|divider|StageOut[23]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[23]~42_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[23]~42_combout\);

\Mod1|auto_generated|divider|divider|StageOut[22]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mux2~1_combout\))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mux2~1_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\);

\Mod1|auto_generated|divider|divider|StageOut[22]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\);

\Mod1|auto_generated|divider|divider|StageOut[21]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\ = (\Mux3~3_combout\ & \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\);

\Mod1|auto_generated|divider|divider|StageOut[21]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\);

\Mod1|auto_generated|divider|divider|StageOut[20]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Mux4~3_combout\,
	datac => \Mux4~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\);

\Mod1|auto_generated|divider|divider|StageOut[20]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~3_combout\,
	datab => \Mux4~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\);

\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[20]~46_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[20]~47_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[21]~44_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[21]~45_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[22]~43_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[23]~66_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[23]~42_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[23]~66_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[23]~42_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

\Mod1|auto_generated|divider|divider|StageOut[28]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[28]~61_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[22]~67_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[28]~61_combout\);

\Mod1|auto_generated|divider|divider|StageOut[28]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[28]~48_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[28]~48_combout\);

\Mod1|auto_generated|divider|divider|StageOut[27]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mux3~3_combout\))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\);

\Mod1|auto_generated|divider|divider|StageOut[27]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\);

\Mod1|auto_generated|divider|divider|StageOut[26]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux4~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mux4~3_combout\,
	datac => \Mux4~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\);

\Mod1|auto_generated|divider|divider|StageOut[26]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\);

\Mod1|auto_generated|divider|divider|StageOut[25]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mux5~3_combout\,
	datac => \Mux5~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\);

\Mod1|auto_generated|divider|divider|StageOut[25]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~3_combout\,
	datab => \Mux5~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\);

\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[25]~52_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[25]~53_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[26]~51_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

\Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[27]~49_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

\Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[28]~61_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[28]~48_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[28]~61_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[28]~48_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

\Mod1|auto_generated|divider|divider|StageOut[30]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux6~4_combout\)) # (!\Sel[2]~input_o\ & ((\Mux6~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux6~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\);

\Mod1|auto_generated|divider|divider|StageOut[30]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux6~4_combout\)) # (!\Sel[2]~input_o\ & ((\Mux6~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux6~1_combout\,
	datac => \Sel[2]~input_o\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\);

\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[30]~62_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[30]~63_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

\Mod1|auto_generated|divider|divider|StageOut[33]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[33]~64_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[27]~68_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[33]~64_combout\);

\Mod1|auto_generated|divider|divider|StageOut[33]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[33]~54_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[33]~54_combout\);

\Mod1|auto_generated|divider|divider|StageOut[32]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[26]~50_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\);

\Mod1|auto_generated|divider|divider|StageOut[32]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\);

\Mod1|auto_generated|divider|divider|StageOut[31]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Sel[2]~input_o\ & (\Mux5~3_combout\)) # (!\Sel[2]~input_o\ & ((\Mux5~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => \Mux5~3_combout\,
	datac => \Mux5~1_combout\,
	datad => \Sel[2]~input_o\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\);

\Mod1|auto_generated|divider|divider|StageOut[31]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\);

\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

\Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[33]~64_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[33]~54_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[33]~64_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[33]~54_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\);

\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\);

\Mod1|auto_generated|divider|divider|StageOut[36]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[36]~58_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (\Mux6~2_combout\)) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & 
-- ((\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~2_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[36]~58_combout\);

\Mod1|auto_generated|divider|divider|StageOut[37]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[37]~59_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (((\Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[31]~56_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[31]~57_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[37]~59_combout\);

\Mod1|auto_generated|divider|divider|StageOut[38]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (((\Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[32]~65_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[32]~55_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\);

ww_m(0) <= \m[0]~output_o\;

ww_m(1) <= \m[1]~output_o\;

ww_m(2) <= \m[2]~output_o\;

ww_m(3) <= \m[3]~output_o\;

ww_m(4) <= \m[4]~output_o\;

ww_m(5) <= \m[5]~output_o\;

ww_m(6) <= \m[6]~output_o\;

ww_m(7) <= \m[7]~output_o\;

ww_Z(0) <= \Z[0]~output_o\;

ww_Z(1) <= \Z[1]~output_o\;

ww_Z(2) <= \Z[2]~output_o\;

ww_Z(3) <= \Z[3]~output_o\;
END structure;


