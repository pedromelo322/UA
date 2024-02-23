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
-- Generated on "04/11/2023 14:01:11"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MiniProjeto_Demo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MiniProjeto_Demo_vhd_vec_tst IS
END MiniProjeto_Demo_vhd_vec_tst;
ARCHITECTURE MiniProjeto_Demo_arch OF MiniProjeto_Demo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL Hex0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Hex1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Key : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT MiniProjeto_Demo
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	Hex0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Hex1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Key : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : MiniProjeto_Demo
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	Hex0 => Hex0,
	Hex1 => Hex1,
	Key => Key,
	LEDR => LEDR
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 5000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;
-- Key[1]
t_prcs_Key_1: PROCESS
BEGIN
	Key(1) <= '0';
	WAIT FOR 150000 ps;
	Key(1) <= '1';
	WAIT FOR 20000 ps;
	Key(1) <= '0';
	WAIT FOR 100000 ps;
	Key(1) <= '1';
	WAIT FOR 10000 ps;
	Key(1) <= '0';
	WAIT FOR 250000 ps;
	Key(1) <= '1';
	WAIT FOR 20000 ps;
	Key(1) <= '0';
WAIT;
END PROCESS t_prcs_Key_1;
-- Key[0]
t_prcs_Key_0: PROCESS
BEGIN
	Key(0) <= '0';
WAIT;
END PROCESS t_prcs_Key_0;
END MiniProjeto_Demo_arch;
