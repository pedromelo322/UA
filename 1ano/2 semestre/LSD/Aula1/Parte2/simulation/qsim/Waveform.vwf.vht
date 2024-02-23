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
-- Generated on "04/04/2023 18:01:05"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          NAND2Gate
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY NAND2Gate_vhd_vec_tst IS
END NAND2Gate_vhd_vec_tst;
ARCHITECTURE NAND2Gate_arch OF NAND2Gate_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL InPort0 : STD_LOGIC;
SIGNAL InPort1 : STD_LOGIC;
SIGNAL OutPort : STD_LOGIC;
COMPONENT NAND2Gate
	PORT (
	InPort0 : IN STD_LOGIC;
	InPort1 : IN STD_LOGIC;
	OutPort : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : NAND2Gate
	PORT MAP (
-- list connections between master ports and signals
	InPort0 => InPort0,
	InPort1 => InPort1,
	OutPort => OutPort
	);

-- InPort0
t_prcs_InPort0: PROCESS
BEGIN
	InPort0 <= '0';
	WAIT FOR 90000 ps;
	InPort0 <= '1';
	WAIT FOR 150000 ps;
	InPort0 <= '0';
	WAIT FOR 330000 ps;
	InPort0 <= '1';
	WAIT FOR 180000 ps;
	InPort0 <= '0';
WAIT;
END PROCESS t_prcs_InPort0;

-- InPort1
t_prcs_InPort1: PROCESS
BEGIN
	InPort1 <= '0';
	WAIT FOR 270000 ps;
	InPort1 <= '1';
	WAIT FOR 180000 ps;
	InPort1 <= '0';
	WAIT FOR 120000 ps;
	InPort1 <= '1';
	WAIT FOR 180000 ps;
	InPort1 <= '0';
WAIT;
END PROCESS t_prcs_InPort1;
END NAND2Gate_arch;
