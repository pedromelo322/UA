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
-- Generated on "04/11/2023 11:14:48"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TimerN
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TimerN_vhd_vec_tst IS
END TimerN_vhd_vec_tst;
ARCHITECTURE TimerN_arch OF TimerN_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL s_count : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL start : STD_LOGIC;
SIGNAL TimerOut : STD_LOGIC;
COMPONENT TimerN
	PORT (
	clk : IN STD_LOGIC;
	en : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	s_count : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
	start : IN STD_LOGIC;
	TimerOut : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TimerN
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	en => en,
	rst => rst,
	s_count => s_count,
	start => start,
	TimerOut => TimerOut
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 40000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

-- en
t_prcs_en: PROCESS
BEGIN
	en <= '0';
	WAIT FOR 40000 ps;
	en <= '1';
	WAIT FOR 260000 ps;
	en <= '0';
	WAIT FOR 60000 ps;
	en <= '1';
	WAIT FOR 440000 ps;
	en <= '0';
WAIT;
END PROCESS t_prcs_en;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '1';
WAIT;
END PROCESS t_prcs_start;
END TimerN_arch;
