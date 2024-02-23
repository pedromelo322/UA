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
-- Generated on "12/01/2022 22:41:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Block4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Block4_vhd_vec_tst IS
END Block4_vhd_vec_tst;
ARCHITECTURE Block4_arch OF Block4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E : STD_LOGIC;
SIGNAL E0 : STD_LOGIC;
SIGNAL GS : STD_LOGIC;
SIGNAL I : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT Block4
	PORT (
	E : IN STD_LOGIC;
	E0 : OUT STD_LOGIC;
	GS : OUT STD_LOGIC;
	I : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Block4
	PORT MAP (
-- list connections between master ports and signals
	E => E,
	E0 => E0,
	GS => GS,
	I => I,
	Y => Y
	);

-- E
t_prcs_E: PROCESS
BEGIN
	E <= '0';
WAIT;
END PROCESS t_prcs_E;
-- I[7]
t_prcs_I_7: PROCESS
BEGIN
	I(7) <= '1';
WAIT;
END PROCESS t_prcs_I_7;
-- I[6]
t_prcs_I_6: PROCESS
BEGIN
	I(6) <= '1';
WAIT;
END PROCESS t_prcs_I_6;
-- I[5]
t_prcs_I_5: PROCESS
BEGIN
	I(5) <= '0';
WAIT;
END PROCESS t_prcs_I_5;
-- I[4]
t_prcs_I_4: PROCESS
BEGIN
	I(4) <= '0';
WAIT;
END PROCESS t_prcs_I_4;
-- I[3]
t_prcs_I_3: PROCESS
BEGIN
	I(3) <= '1';
WAIT;
END PROCESS t_prcs_I_3;
-- I[2]
t_prcs_I_2: PROCESS
BEGIN
	I(2) <= '1';
WAIT;
END PROCESS t_prcs_I_2;
-- I[1]
t_prcs_I_1: PROCESS
BEGIN
	I(1) <= '1';
WAIT;
END PROCESS t_prcs_I_1;
-- I[0]
t_prcs_I_0: PROCESS
BEGIN
	I(0) <= '0';
WAIT;
END PROCESS t_prcs_I_0;
END Block4_arch;
