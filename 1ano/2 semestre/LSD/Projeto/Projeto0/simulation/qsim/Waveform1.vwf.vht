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
-- Generated on "05/22/2023 19:18:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Relogio
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Relogio_vhd_vec_tst IS
END Relogio_vhd_vec_tst;
ARCHITECTURE Relogio_arch OF Relogio_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL time_hex : STD_LOGIC_VECTOR(27 DOWNTO 0);
COMPONENT Relogio
	PORT (
	clk : IN STD_LOGIC;
	en : IN STD_LOGIC;
	time_hex : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Relogio
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	en => en,
	time_hex => time_hex
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 250 ps;
	clk <= '1';
	WAIT FOR 250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- en
t_prcs_en: PROCESS
BEGIN
LOOP
	en <= '0';
	WAIT FOR 250 ps;
	en <= '1';
	WAIT FOR 250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_en;
END Relogio_arch;
