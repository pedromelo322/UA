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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "04/07/2023 16:35:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ALU4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ALU4_vhd_vec_tst IS
END ALU4_vhd_vec_tst;
ARCHITECTURE ALU4_arch OF ALU4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Z : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT ALU4
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Z : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU4
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Sel => Sel,
	Z => Z
	);
-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '0';
	WAIT FOR 240000 ps;
	A(3) <= '1';
	WAIT FOR 240000 ps;
	A(3) <= '0';
	WAIT FOR 160000 ps;
	A(3) <= '1';
	WAIT FOR 80000 ps;
	A(3) <= '0';
	WAIT FOR 80000 ps;
	A(3) <= '1';
	WAIT FOR 80000 ps;
	A(3) <= '0';
	WAIT FOR 80000 ps;
	A(3) <= '1';
WAIT;
END PROCESS t_prcs_A_3;
-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	A(2) <= '0';
	WAIT FOR 80000 ps;
	A(2) <= '1';
	WAIT FOR 80000 ps;
	A(2) <= '0';
	WAIT FOR 80000 ps;
	A(2) <= '1';
	WAIT FOR 640000 ps;
	A(2) <= '0';
WAIT;
END PROCESS t_prcs_A_2;
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	A(1) <= '0';
	WAIT FOR 240000 ps;
	A(1) <= '1';
	WAIT FOR 480000 ps;
	A(1) <= '0';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	A(0) <= '1';
	WAIT FOR 160000 ps;
	A(0) <= '0';
	WAIT FOR 160000 ps;
	A(0) <= '1';
	WAIT FOR 80000 ps;
	A(0) <= '0';
	WAIT FOR 320000 ps;
	A(0) <= '1';
	WAIT FOR 160000 ps;
	A(0) <= '0';
WAIT;
END PROCESS t_prcs_A_0;
-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	B(3) <= '0';
	WAIT FOR 400000 ps;
	B(3) <= '1';
	WAIT FOR 240000 ps;
	B(3) <= '0';
	WAIT FOR 160000 ps;
	B(3) <= '1';
WAIT;
END PROCESS t_prcs_B_3;
-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	B(2) <= '0';
	WAIT FOR 80000 ps;
	B(2) <= '1';
	WAIT FOR 160000 ps;
	B(2) <= '0';
	WAIT FOR 320000 ps;
	B(2) <= '1';
	WAIT FOR 320000 ps;
	B(2) <= '0';
	WAIT FOR 80000 ps;
	B(2) <= '1';
WAIT;
END PROCESS t_prcs_B_2;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	B(1) <= '0';
	WAIT FOR 80000 ps;
	B(1) <= '1';
	WAIT FOR 160000 ps;
	B(1) <= '0';
	WAIT FOR 480000 ps;
	B(1) <= '1';
	WAIT FOR 160000 ps;
	B(1) <= '0';
	WAIT FOR 80000 ps;
	B(1) <= '1';
WAIT;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	B(0) <= '1';
	WAIT FOR 80000 ps;
	B(0) <= '0';
	WAIT FOR 80000 ps;
	B(0) <= '1';
	WAIT FOR 80000 ps;
	B(0) <= '0';
	WAIT FOR 80000 ps;
	B(0) <= '1';
	WAIT FOR 160000 ps;
	B(0) <= '0';
	WAIT FOR 240000 ps;
	B(0) <= '1';
	WAIT FOR 80000 ps;
	B(0) <= '0';
WAIT;
END PROCESS t_prcs_B_0;
-- Sel[2]
t_prcs_Sel_2: PROCESS
BEGIN
	Sel(2) <= '0';
	WAIT FOR 160000 ps;
	Sel(2) <= '1';
	WAIT FOR 80000 ps;
	Sel(2) <= '0';
	WAIT FOR 160000 ps;
	Sel(2) <= '1';
	WAIT FOR 80000 ps;
	Sel(2) <= '0';
	WAIT FOR 80000 ps;
	Sel(2) <= '1';
	WAIT FOR 80000 ps;
	Sel(2) <= '0';
	WAIT FOR 80000 ps;
	Sel(2) <= '1';
	WAIT FOR 160000 ps;
	Sel(2) <= '0';
WAIT;
END PROCESS t_prcs_Sel_2;
-- Sel[1]
t_prcs_Sel_1: PROCESS
BEGIN
	Sel(1) <= '0';
	WAIT FOR 80000 ps;
	Sel(1) <= '1';
	WAIT FOR 320000 ps;
	Sel(1) <= '0';
	WAIT FOR 80000 ps;
	Sel(1) <= '1';
	WAIT FOR 240000 ps;
	Sel(1) <= '0';
WAIT;
END PROCESS t_prcs_Sel_1;
-- Sel[0]
t_prcs_Sel_0: PROCESS
BEGIN
	Sel(0) <= '0';
	WAIT FOR 80000 ps;
	Sel(0) <= '1';
	WAIT FOR 80000 ps;
	Sel(0) <= '0';
	WAIT FOR 80000 ps;
	Sel(0) <= '1';
	WAIT FOR 320000 ps;
	Sel(0) <= '0';
	WAIT FOR 160000 ps;
	Sel(0) <= '1';
	WAIT FOR 80000 ps;
	Sel(0) <= '0';
	WAIT FOR 80000 ps;
	Sel(0) <= '1';
WAIT;
END PROCESS t_prcs_Sel_0;
END ALU4_arch;
