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
-- Generated on "06/10/2023 16:40:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          test_exmp
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY test_exmp_vhd_vec_tst IS
END test_exmp_vhd_vec_tst;
ARCHITECTURE test_exmp_arch OF test_exmp_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL valor_in : STD_LOGIC;
SIGNAL valor_out : STD_LOGIC;
COMPONENT test_exmp
	PORT (
	clk : IN STD_LOGIC;
	valor_in : IN STD_LOGIC;
	valor_out : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : test_exmp
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	valor_in => valor_in,
	valor_out => valor_out
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		clk <= '0';
		WAIT FOR 15000 ps;
		clk <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- valor_in
t_prcs_valor_in: PROCESS
BEGIN
	valor_in <= '0';
	WAIT FOR 20000 ps;
	valor_in <= '1';
WAIT;
END PROCESS t_prcs_valor_in;
END test_exmp_arch;
