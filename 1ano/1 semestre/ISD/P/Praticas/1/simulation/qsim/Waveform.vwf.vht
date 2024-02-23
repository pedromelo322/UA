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
-- Generated on "11/22/2022 09:58:58"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DecoderDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DecoderDemo_vhd_vec_tst IS
END DecoderDemo_vhd_vec_tst;
ARCHITECTURE DecoderDemo_arch OF DecoderDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E0_L : STD_LOGIC;
SIGNAL E1 : STD_LOGIC;
SIGNAL out0 : STD_LOGIC;
SIGNAL out1 : STD_LOGIC;
SIGNAL out2 : STD_LOGIC;
SIGNAL out3 : STD_LOGIC;
SIGNAL X0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
COMPONENT DecoderDemo
	PORT (
	E0_L : IN STD_LOGIC;
	E1 : IN STD_LOGIC;
	out0 : OUT STD_LOGIC;
	out1 : OUT STD_LOGIC;
	out2 : OUT STD_LOGIC;
	out3 : OUT STD_LOGIC;
	X0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DecoderDemo
	PORT MAP (
-- list connections between master ports and signals
	E0_L => E0_L,
	E1 => E1,
	out0 => out0,
	out1 => out1,
	out2 => out2,
	out3 => out3,
	X0 => X0,
	X1 => X1
	);

-- X0
t_prcs_X0: PROCESS
BEGIN
	X0 <= '0';
	WAIT FOR 90000 ps;
	X0 <= '1';
	WAIT FOR 300000 ps;
	X0 <= '0';
WAIT;
END PROCESS t_prcs_X0;

-- X1
t_prcs_X1: PROCESS
BEGIN
	X1 <= '0';
	WAIT FOR 230000 ps;
	X1 <= '1';
	WAIT FOR 370000 ps;
	X1 <= '0';
WAIT;
END PROCESS t_prcs_X1;

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
END DecoderDemo_arch;
