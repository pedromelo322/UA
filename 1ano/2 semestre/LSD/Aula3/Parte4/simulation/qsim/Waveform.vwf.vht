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
-- Generated on "04/07/2023 14:42:55"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Bin2BCD
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Bin2BCD_vhd_vec_tst IS
END Bin2BCD_vhd_vec_tst;
ARCHITECTURE Bin2BCD_arch OF Bin2BCD_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Bin : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL bInout0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bInout1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bInout2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Bin2BCD
	PORT (
	Bin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	bInout0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bInout1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bInout2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Bin2BCD
	PORT MAP (
-- list connections between master ports and signals
	Bin => Bin,
	bInout0 => bInout0,
	bInout1 => bInout1,
	bInout2 => bInout2
	);
-- Bin[7]
t_prcs_Bin_7: PROCESS
BEGIN
	Bin(7) <= '1';
	WAIT FOR 80000 ps;
	Bin(7) <= '0';
	WAIT FOR 160000 ps;
	Bin(7) <= '1';
	WAIT FOR 80000 ps;
	Bin(7) <= '0';
	WAIT FOR 240000 ps;
	Bin(7) <= '1';
	WAIT FOR 160000 ps;
	Bin(7) <= '0';
	WAIT FOR 160000 ps;
	Bin(7) <= '1';
WAIT;
END PROCESS t_prcs_Bin_7;
-- Bin[6]
t_prcs_Bin_6: PROCESS
BEGIN
	Bin(6) <= '1';
	WAIT FOR 240000 ps;
	Bin(6) <= '0';
	WAIT FOR 240000 ps;
	Bin(6) <= '1';
	WAIT FOR 160000 ps;
	Bin(6) <= '0';
	WAIT FOR 240000 ps;
	Bin(6) <= '1';
	WAIT FOR 80000 ps;
	Bin(6) <= '0';
WAIT;
END PROCESS t_prcs_Bin_6;
-- Bin[5]
t_prcs_Bin_5: PROCESS
BEGIN
	Bin(5) <= '1';
	WAIT FOR 160000 ps;
	Bin(5) <= '0';
	WAIT FOR 160000 ps;
	Bin(5) <= '1';
	WAIT FOR 400000 ps;
	Bin(5) <= '0';
	WAIT FOR 160000 ps;
	Bin(5) <= '1';
WAIT;
END PROCESS t_prcs_Bin_5;
-- Bin[4]
t_prcs_Bin_4: PROCESS
BEGIN
	Bin(4) <= '0';
	WAIT FOR 160000 ps;
	Bin(4) <= '1';
	WAIT FOR 80000 ps;
	Bin(4) <= '0';
	WAIT FOR 80000 ps;
	Bin(4) <= '1';
	WAIT FOR 80000 ps;
	Bin(4) <= '0';
	WAIT FOR 80000 ps;
	Bin(4) <= '1';
	WAIT FOR 160000 ps;
	Bin(4) <= '0';
	WAIT FOR 80000 ps;
	Bin(4) <= '1';
	WAIT FOR 80000 ps;
	Bin(4) <= '0';
	WAIT FOR 80000 ps;
	Bin(4) <= '1';
WAIT;
END PROCESS t_prcs_Bin_4;
-- Bin[3]
t_prcs_Bin_3: PROCESS
BEGIN
	Bin(3) <= '0';
	WAIT FOR 80000 ps;
	Bin(3) <= '1';
	WAIT FOR 160000 ps;
	Bin(3) <= '0';
	WAIT FOR 160000 ps;
	Bin(3) <= '1';
	WAIT FOR 80000 ps;
	Bin(3) <= '0';
	WAIT FOR 80000 ps;
	Bin(3) <= '1';
	WAIT FOR 80000 ps;
	Bin(3) <= '0';
	WAIT FOR 320000 ps;
	Bin(3) <= '1';
WAIT;
END PROCESS t_prcs_Bin_3;
-- Bin[2]
t_prcs_Bin_2: PROCESS
BEGIN
	Bin(2) <= '0';
	WAIT FOR 80000 ps;
	Bin(2) <= '1';
	WAIT FOR 80000 ps;
	Bin(2) <= '0';
	WAIT FOR 80000 ps;
	Bin(2) <= '1';
	WAIT FOR 80000 ps;
	Bin(2) <= '0';
	WAIT FOR 80000 ps;
	Bin(2) <= '1';
	WAIT FOR 240000 ps;
	Bin(2) <= '0';
	WAIT FOR 240000 ps;
	Bin(2) <= '1';
	WAIT FOR 80000 ps;
	Bin(2) <= '0';
WAIT;
END PROCESS t_prcs_Bin_2;
-- Bin[1]
t_prcs_Bin_1: PROCESS
BEGIN
	Bin(1) <= '1';
	WAIT FOR 160000 ps;
	Bin(1) <= '0';
	WAIT FOR 400000 ps;
	Bin(1) <= '1';
	WAIT FOR 80000 ps;
	Bin(1) <= '0';
	WAIT FOR 80000 ps;
	Bin(1) <= '1';
	WAIT FOR 80000 ps;
	Bin(1) <= '0';
	WAIT FOR 160000 ps;
	Bin(1) <= '1';
WAIT;
END PROCESS t_prcs_Bin_1;
-- Bin[0]
t_prcs_Bin_0: PROCESS
BEGIN
	Bin(0) <= '0';
	WAIT FOR 240000 ps;
	Bin(0) <= '1';
	WAIT FOR 80000 ps;
	Bin(0) <= '0';
	WAIT FOR 80000 ps;
	Bin(0) <= '1';
	WAIT FOR 80000 ps;
	Bin(0) <= '0';
	WAIT FOR 160000 ps;
	Bin(0) <= '1';
	WAIT FOR 240000 ps;
	Bin(0) <= '0';
WAIT;
END PROCESS t_prcs_Bin_0;
END Bin2BCD_arch;
