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
-- Generated on "05/22/2023 22:36:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ButtonHandler
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ButtonHandler_vhd_vec_tst IS
END ButtonHandler_vhd_vec_tst;
ARCHITECTURE ButtonHandler_arch OF ButtonHandler_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL btn_minus : STD_LOGIC;
SIGNAL btn_P : STD_LOGIC;
SIGNAL btn_plus : STD_LOGIC;
SIGNAL btn_S : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL pulse_minus : STD_LOGIC;
SIGNAL pulse_P : STD_LOGIC;
SIGNAL pulse_plus : STD_LOGIC;
SIGNAL pulse_S : STD_LOGIC;
COMPONENT ButtonHandler
	PORT (
	btn_minus : IN STD_LOGIC;
	btn_P : IN STD_LOGIC;
	btn_plus : IN STD_LOGIC;
	btn_S : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	pulse_minus : OUT STD_LOGIC;
	pulse_P : OUT STD_LOGIC;
	pulse_plus : OUT STD_LOGIC;
	pulse_S : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ButtonHandler
	PORT MAP (
-- list connections between master ports and signals
	btn_minus => btn_minus,
	btn_P => btn_P,
	btn_plus => btn_plus,
	btn_S => btn_S,
	clk => clk,
	pulse_minus => pulse_minus,
	pulse_P => pulse_P,
	pulse_plus => pulse_plus,
	pulse_S => pulse_S
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 50 ps;
	clk <= '1';
	WAIT FOR 50 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- btn_minus
t_prcs_btn_minus: PROCESS
BEGIN
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 50000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 40000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 30000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 40000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 30000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 30000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 70000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 60000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 20000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 30000 ps;
	btn_minus <= '0';
	WAIT FOR 30000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 20000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
	WAIT FOR 10000 ps;
	btn_minus <= '0';
	WAIT FOR 10000 ps;
	btn_minus <= '1';
WAIT;
END PROCESS t_prcs_btn_minus;

-- btn_P
t_prcs_btn_P: PROCESS
BEGIN
	btn_P <= '1';
	WAIT FOR 30000 ps;
	btn_P <= '0';
	WAIT FOR 20000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 30000 ps;
	btn_P <= '1';
	WAIT FOR 20000 ps;
	btn_P <= '0';
	WAIT FOR 40000 ps;
	btn_P <= '1';
	WAIT FOR 50000 ps;
	btn_P <= '0';
	WAIT FOR 40000 ps;
	btn_P <= '1';
	WAIT FOR 20000 ps;
	btn_P <= '0';
	WAIT FOR 20000 ps;
	btn_P <= '1';
	WAIT FOR 30000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 20000 ps;
	btn_P <= '0';
	WAIT FOR 70000 ps;
	btn_P <= '1';
	WAIT FOR 70000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 20000 ps;
	btn_P <= '0';
	WAIT FOR 40000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 70000 ps;
	btn_P <= '1';
	WAIT FOR 90000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 40000 ps;
	btn_P <= '1';
	WAIT FOR 30000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 30000 ps;
	btn_P <= '1';
	WAIT FOR 10000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 50000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
	WAIT FOR 20000 ps;
	btn_P <= '0';
	WAIT FOR 10000 ps;
	btn_P <= '1';
WAIT;
END PROCESS t_prcs_btn_P;

-- btn_plus
t_prcs_btn_plus: PROCESS
BEGIN
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 50000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 40000 ps;
	btn_plus <= '0';
	WAIT FOR 40000 ps;
	btn_plus <= '1';
	WAIT FOR 40000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 30000 ps;
	btn_plus <= '1';
	WAIT FOR 30000 ps;
	btn_plus <= '0';
	WAIT FOR 40000 ps;
	btn_plus <= '1';
	WAIT FOR 70000 ps;
	btn_plus <= '0';
	WAIT FOR 30000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 20000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 20000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 30000 ps;
	btn_plus <= '1';
	WAIT FOR 20000 ps;
	btn_plus <= '0';
	WAIT FOR 20000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 30000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 30000 ps;
	btn_plus <= '0';
	WAIT FOR 10000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 20000 ps;
	btn_plus <= '1';
	WAIT FOR 10000 ps;
	btn_plus <= '0';
	WAIT FOR 30000 ps;
	btn_plus <= '1';
WAIT;
END PROCESS t_prcs_btn_plus;

-- btn_S
t_prcs_btn_S: PROCESS
BEGIN
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
	WAIT FOR 30000 ps;
	btn_S <= '0';
	WAIT FOR 20000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 20000 ps;
	btn_S <= '1';
	WAIT FOR 50000 ps;
	btn_S <= '0';
	WAIT FOR 20000 ps;
	btn_S <= '1';
	WAIT FOR 50000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 20000 ps;
	btn_S <= '1';
	WAIT FOR 50000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 30000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
	WAIT FOR 60000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 30000 ps;
	btn_S <= '0';
	WAIT FOR 20000 ps;
	btn_S <= '1';
	WAIT FOR 30000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 10000 ps;
	btn_S <= '1';
	WAIT FOR 10000 ps;
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 40000 ps;
	btn_S <= '1';
	WAIT FOR 20000 ps;
	btn_S <= '0';
	WAIT FOR 30000 ps;
	btn_S <= '1';
WAIT;
END PROCESS t_prcs_btn_S;
END ButtonHandler_arch;
