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
-- Generated on "04/13/2023 13:57:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ContadorDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ContadorDemo_vhd_vec_tst IS
END ContadorDemo_vhd_vec_tst;
ARCHITECTURE ContadorDemo_arch OF ContadorDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL Hex0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Hex1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT ContadorDemo
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	Hex0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Hex1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ContadorDemo
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	Hex0 => Hex0,
	Hex1 => Hex1,
	KEY => KEY
	);
END ContadorDemo_arch;
