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
-- Generated on "05/26/2023 15:56:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DataSEL
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DataSEL_vhd_vec_tst IS
END DataSEL_vhd_vec_tst;
ARCHITECTURE DataSEL_arch OF DataSEL_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL data_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL inc : STD_LOGIC;
SIGNAL modo : STD_LOGIC;
COMPONENT DataSEL
	PORT (
	clk : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	data_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	inc : IN STD_LOGIC;
	modo : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DataSEL
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	data_in => data_in,
	data_out => data_out,
	inc => inc,
	modo => modo
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
-- data_in[6]
t_prcs_data_in_6: PROCESS
BEGIN
	data_in(6) <= '0';
	WAIT FOR 120000 ps;
	data_in(6) <= '1';
	WAIT FOR 80000 ps;
	data_in(6) <= '0';
	WAIT FOR 160000 ps;
	data_in(6) <= '1';
	WAIT FOR 60000 ps;
	data_in(6) <= '0';
	WAIT FOR 170000 ps;
	data_in(6) <= '1';
	WAIT FOR 60000 ps;
	data_in(6) <= '0';
	WAIT FOR 150000 ps;
	data_in(6) <= '1';
	WAIT FOR 60000 ps;
	data_in(6) <= '0';
WAIT;
END PROCESS t_prcs_data_in_6;
-- data_in[5]
t_prcs_data_in_5: PROCESS
BEGIN
	data_in(5) <= '0';
WAIT;
END PROCESS t_prcs_data_in_5;
-- data_in[4]
t_prcs_data_in_4: PROCESS
BEGIN
	data_in(4) <= '0';
WAIT;
END PROCESS t_prcs_data_in_4;
-- data_in[3]
t_prcs_data_in_3: PROCESS
BEGIN
	data_in(3) <= '0';
	WAIT FOR 30000 ps;
	data_in(3) <= '1';
	WAIT FOR 90000 ps;
	data_in(3) <= '0';
	WAIT FOR 150000 ps;
	data_in(3) <= '1';
	WAIT FOR 90000 ps;
	data_in(3) <= '0';
	WAIT FOR 170000 ps;
	data_in(3) <= '1';
	WAIT FOR 60000 ps;
	data_in(3) <= '0';
	WAIT FOR 150000 ps;
	data_in(3) <= '1';
	WAIT FOR 60000 ps;
	data_in(3) <= '0';
	WAIT FOR 140000 ps;
	data_in(3) <= '1';
WAIT;
END PROCESS t_prcs_data_in_3;
-- data_in[2]
t_prcs_data_in_2: PROCESS
BEGIN
	data_in(2) <= '0';
WAIT;
END PROCESS t_prcs_data_in_2;
-- data_in[1]
t_prcs_data_in_1: PROCESS
BEGIN
	data_in(1) <= '0';
WAIT;
END PROCESS t_prcs_data_in_1;
-- data_in[0]
t_prcs_data_in_0: PROCESS
BEGIN
	data_in(0) <= '1';
	WAIT FOR 30000 ps;
	data_in(0) <= '0';
	WAIT FOR 170000 ps;
	data_in(0) <= '1';
	WAIT FOR 70000 ps;
	data_in(0) <= '0';
	WAIT FOR 150000 ps;
	data_in(0) <= '1';
	WAIT FOR 110000 ps;
	data_in(0) <= '0';
	WAIT FOR 120000 ps;
	data_in(0) <= '1';
	WAIT FOR 90000 ps;
	data_in(0) <= '0';
	WAIT FOR 120000 ps;
	data_in(0) <= '1';
	WAIT FOR 80000 ps;
	data_in(0) <= '0';
WAIT;
END PROCESS t_prcs_data_in_0;

-- inc
t_prcs_inc: PROCESS
BEGIN
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 15000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 20000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 25000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 20000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 20000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 30000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 20000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 25000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 15000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 20000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 20000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 15000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 5000 ps;
	inc <= '1';
	WAIT FOR 15000 ps;
	inc <= '0';
	WAIT FOR 15000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 10000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
	WAIT FOR 5000 ps;
	inc <= '0';
	WAIT FOR 10000 ps;
	inc <= '1';
WAIT;
END PROCESS t_prcs_inc;

-- modo
t_prcs_modo: PROCESS
BEGIN
	modo <= '1';
WAIT;
END PROCESS t_prcs_modo;
END DataSEL_arch;
