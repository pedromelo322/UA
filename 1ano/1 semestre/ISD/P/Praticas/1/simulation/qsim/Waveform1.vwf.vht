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
-- Generated on "11/22/2022 14:13:00"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DecoderDemo2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DecoderDemo2_vhd_vec_tst IS
END DecoderDemo2_vhd_vec_tst;
ARCHITECTURE DecoderDemo2_arch OF DecoderDemo2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E0_L : STD_LOGIC;
SIGNAL E1 : STD_LOGIC;
SIGNAL X0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
SIGNAL X2 : STD_LOGIC;
SIGNAL X3 : STD_LOGIC;
SIGNAL y0 : STD_LOGIC;
SIGNAL y1 : STD_LOGIC;
SIGNAL y2 : STD_LOGIC;
SIGNAL y3 : STD_LOGIC;
SIGNAL y4 : STD_LOGIC;
SIGNAL y5 : STD_LOGIC;
SIGNAL y6 : STD_LOGIC;
SIGNAL y7 : STD_LOGIC;
SIGNAL y8 : STD_LOGIC;
SIGNAL y9 : STD_LOGIC;
SIGNAL y10 : STD_LOGIC;
SIGNAL y11 : STD_LOGIC;
SIGNAL y12 : STD_LOGIC;
SIGNAL y13 : STD_LOGIC;
SIGNAL y14 : STD_LOGIC;
SIGNAL y15 : STD_LOGIC;
COMPONENT DecoderDemo2
	PORT (
	E0_L : IN STD_LOGIC;
	E1 : IN STD_LOGIC;
	X0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC;
	X2 : IN STD_LOGIC;
	X3 : IN STD_LOGIC;
	y0 : OUT STD_LOGIC;
	y1 : OUT STD_LOGIC;
	y2 : OUT STD_LOGIC;
	y3 : OUT STD_LOGIC;
	y4 : OUT STD_LOGIC;
	y5 : OUT STD_LOGIC;
	y6 : OUT STD_LOGIC;
	y7 : OUT STD_LOGIC;
	y8 : OUT STD_LOGIC;
	y9 : OUT STD_LOGIC;
	y10 : OUT STD_LOGIC;
	y11 : OUT STD_LOGIC;
	y12 : OUT STD_LOGIC;
	y13 : OUT STD_LOGIC;
	y14 : OUT STD_LOGIC;
	y15 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DecoderDemo2
	PORT MAP (
-- list connections between master ports and signals
	E0_L => E0_L,
	E1 => E1,
	X0 => X0,
	X1 => X1,
	X2 => X2,
	X3 => X3,
	y0 => y0,
	y1 => y1,
	y2 => y2,
	y3 => y3,
	y4 => y4,
	y5 => y5,
	y6 => y6,
	y7 => y7,
	y8 => y8,
	y9 => y9,
	y10 => y10,
	y11 => y11,
	y12 => y12,
	y13 => y13,
	y14 => y14,
	y15 => y15
	);

-- E0_L
t_prcs_E0_L: PROCESS
BEGIN
	E0_L <= '0';
WAIT;
END PROCESS t_prcs_E0_L;

-- E1
t_prcs_E1: PROCESS
BEGIN
	E1 <= '1';
WAIT;
END PROCESS t_prcs_E1;

-- X3
t_prcs_X3: PROCESS
BEGIN
	X3 <= '0';
	WAIT FOR 400000 ps;
	X3 <= '1';
	WAIT FOR 400000 ps;
	X3 <= '0';
WAIT;
END PROCESS t_prcs_X3;

-- X2
t_prcs_X2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		X2 <= '0';
		WAIT FOR 200000 ps;
		X2 <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	X2 <= '0';
WAIT;
END PROCESS t_prcs_X2;

-- X1
t_prcs_X1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		X1 <= '0';
		WAIT FOR 100000 ps;
		X1 <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	X1 <= '0';
WAIT;
END PROCESS t_prcs_X1;

-- X0
t_prcs_X0: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		X0 <= '0';
		WAIT FOR 50000 ps;
		X0 <= '1';
		WAIT FOR 50000 ps;
	END LOOP;
	X0 <= '0';
WAIT;
END PROCESS t_prcs_X0;
END DecoderDemo2_arch;
