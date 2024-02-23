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
-- Generated on "11/25/2022 12:45:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MuxDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MuxDemo_vhd_vec_tst IS
END MuxDemo_vhd_vec_tst;
ARCHITECTURE MuxDemo_arch OF MuxDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL S : STD_LOGIC;
SIGNAL x0 : STD_LOGIC;
SIGNAL x1 : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
COMPONENT MuxDemo
	PORT (
	S : IN STD_LOGIC;
	x0 : IN STD_LOGIC;
	x1 : IN STD_LOGIC;
	Y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MuxDemo
	PORT MAP (
-- list connections between master ports and signals
	S => S,
	x0 => x0,
	x1 => x1,
	Y => Y
	);

-- S
t_prcs_S: PROCESS
BEGIN
	S <= '0';
	WAIT FOR 400000 ps;
	S <= '1';
	WAIT FOR 400000 ps;
	S <= '0';
WAIT;
END PROCESS t_prcs_S;

-- x0
t_prcs_x0: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		x0 <= '0';
		WAIT FOR 200000 ps;
		x0 <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	x0 <= '0';
WAIT;
END PROCESS t_prcs_x0;

-- x1
t_prcs_x1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		x1 <= '0';
		WAIT FOR 100000 ps;
		x1 <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	x1 <= '0';
WAIT;
END PROCESS t_prcs_x1;
END MuxDemo_arch;
