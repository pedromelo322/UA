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
-- Generated on "03/22/2023 11:30:10"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AdderN
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AdderN_vhd_vec_tst IS
END AdderN_vhd_vec_tst;
ARCHITECTURE AdderN_arch OF AdderN_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL operand0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL operand1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL result : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT AdderN
	PORT (
	operand0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	operand1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : AdderN
	PORT MAP (
-- list connections between master ports and signals
	operand0 => operand0,
	operand1 => operand1,
	result => result
	);
-- operand0[3]
t_prcs_operand0_3: PROCESS
BEGIN
	operand0(3) <= '0';
	WAIT FOR 100000 ps;
	operand0(3) <= '1';
	WAIT FOR 200000 ps;
	operand0(3) <= '0';
	WAIT FOR 100000 ps;
	operand0(3) <= '1';
	WAIT FOR 300000 ps;
	operand0(3) <= '0';
WAIT;
END PROCESS t_prcs_operand0_3;
-- operand0[2]
t_prcs_operand0_2: PROCESS
BEGIN
	operand0(2) <= '1';
	WAIT FOR 200000 ps;
	operand0(2) <= '0';
	WAIT FOR 200000 ps;
	operand0(2) <= '1';
	WAIT FOR 100000 ps;
	operand0(2) <= '0';
	WAIT FOR 100000 ps;
	operand0(2) <= '1';
	WAIT FOR 100000 ps;
	operand0(2) <= '0';
	WAIT FOR 200000 ps;
	operand0(2) <= '1';
WAIT;
END PROCESS t_prcs_operand0_2;
-- operand0[1]
t_prcs_operand0_1: PROCESS
BEGIN
	operand0(1) <= '0';
	WAIT FOR 200000 ps;
	operand0(1) <= '1';
	WAIT FOR 100000 ps;
	operand0(1) <= '0';
	WAIT FOR 100000 ps;
	operand0(1) <= '1';
	WAIT FOR 200000 ps;
	operand0(1) <= '0';
	WAIT FOR 100000 ps;
	operand0(1) <= '1';
	WAIT FOR 200000 ps;
	operand0(1) <= '0';
WAIT;
END PROCESS t_prcs_operand0_1;
-- operand0[0]
t_prcs_operand0_0: PROCESS
BEGIN
	operand0(0) <= '0';
	WAIT FOR 500000 ps;
	operand0(0) <= '1';
	WAIT FOR 100000 ps;
	operand0(0) <= '0';
WAIT;
END PROCESS t_prcs_operand0_0;
-- operand1[3]
t_prcs_operand1_3: PROCESS
BEGIN
	operand1(3) <= '1';
	WAIT FOR 200000 ps;
	operand1(3) <= '0';
	WAIT FOR 100000 ps;
	operand1(3) <= '1';
	WAIT FOR 100000 ps;
	operand1(3) <= '0';
	WAIT FOR 100000 ps;
	operand1(3) <= '1';
	WAIT FOR 200000 ps;
	operand1(3) <= '0';
	WAIT FOR 100000 ps;
	operand1(3) <= '1';
	WAIT FOR 100000 ps;
	operand1(3) <= '0';
WAIT;
END PROCESS t_prcs_operand1_3;
-- operand1[2]
t_prcs_operand1_2: PROCESS
BEGIN
	operand1(2) <= '0';
	WAIT FOR 900000 ps;
	operand1(2) <= '1';
WAIT;
END PROCESS t_prcs_operand1_2;
-- operand1[1]
t_prcs_operand1_1: PROCESS
BEGIN
	operand1(1) <= '0';
	WAIT FOR 200000 ps;
	operand1(1) <= '1';
	WAIT FOR 200000 ps;
	operand1(1) <= '0';
	WAIT FOR 100000 ps;
	operand1(1) <= '1';
	WAIT FOR 300000 ps;
	operand1(1) <= '0';
	WAIT FOR 100000 ps;
	operand1(1) <= '1';
WAIT;
END PROCESS t_prcs_operand1_1;
-- operand1[0]
t_prcs_operand1_0: PROCESS
BEGIN
	operand1(0) <= '1';
	WAIT FOR 100000 ps;
	operand1(0) <= '0';
	WAIT FOR 500000 ps;
	operand1(0) <= '1';
	WAIT FOR 200000 ps;
	operand1(0) <= '0';
	WAIT FOR 100000 ps;
	operand1(0) <= '1';
WAIT;
END PROCESS t_prcs_operand1_0;
END AdderN_arch;
