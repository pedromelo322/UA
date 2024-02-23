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
-- Generated on "05/27/2023 19:23:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ControloOnOff
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ControloOnOff_vhd_vec_tst IS
END ControloOnOff_vhd_vec_tst;
ARCHITECTURE ControloOnOff_arch OF ControloOnOff_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL OnOff : STD_LOGIC;
SIGNAL Tamb : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL Tref : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT ControloOnOff
	PORT (
	clk : IN STD_LOGIC;
	OnOff : OUT STD_LOGIC;
	Tamb : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	Tref : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ControloOnOff
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	OnOff => OnOff,
	Tamb => Tamb,
	Tref => Tref
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 500 ps;
	clk <= '1';
	WAIT FOR 500 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- Tamb[11]
t_prcs_Tamb_11: PROCESS
BEGIN
	Tamb(11) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_11;
-- Tamb[10]
t_prcs_Tamb_10: PROCESS
BEGIN
	Tamb(10) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_10;
-- Tamb[9]
t_prcs_Tamb_9: PROCESS
BEGIN
	Tamb(9) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_9;
-- Tamb[8]
t_prcs_Tamb_8: PROCESS
BEGIN
	Tamb(8) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_8;
-- Tamb[7]
t_prcs_Tamb_7: PROCESS
BEGIN
	Tamb(7) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_7;
-- Tamb[6]
t_prcs_Tamb_6: PROCESS
BEGIN
	Tamb(6) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_6;
-- Tamb[5]
t_prcs_Tamb_5: PROCESS
BEGIN
	Tamb(5) <= '0';
	WAIT FOR 810000 ps;
	Tamb(5) <= '1';
WAIT;
END PROCESS t_prcs_Tamb_5;
-- Tamb[4]
t_prcs_Tamb_4: PROCESS
BEGIN
	Tamb(4) <= '0';
	WAIT FOR 160000 ps;
	Tamb(4) <= '1';
	WAIT FOR 110000 ps;
	Tamb(4) <= '0';
	WAIT FOR 160000 ps;
	Tamb(4) <= '1';
	WAIT FOR 60000 ps;
	Tamb(4) <= '0';
	WAIT FOR 160000 ps;
	Tamb(4) <= '1';
	WAIT FOR 160000 ps;
	Tamb(4) <= '0';
	WAIT FOR 160000 ps;
	Tamb(4) <= '1';
WAIT;
END PROCESS t_prcs_Tamb_4;
-- Tamb[3]
t_prcs_Tamb_3: PROCESS
BEGIN
	Tamb(3) <= '0';
	WAIT FOR 80000 ps;
	Tamb(3) <= '1';
	WAIT FOR 80000 ps;
	Tamb(3) <= '0';
	WAIT FOR 80000 ps;
	Tamb(3) <= '1';
	WAIT FOR 30000 ps;
	Tamb(3) <= '0';
	WAIT FOR 80000 ps;
	Tamb(3) <= '1';
	WAIT FOR 80000 ps;
	Tamb(3) <= '0';
	WAIT FOR 140000 ps;
	Tamb(3) <= '1';
	WAIT FOR 80000 ps;
	FOR i IN 1 TO 2
	LOOP
		Tamb(3) <= '0';
		WAIT FOR 80000 ps;
		Tamb(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	Tamb(3) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_3;
-- Tamb[2]
t_prcs_Tamb_2: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		Tamb(2) <= '0';
		WAIT FOR 40000 ps;
		Tamb(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	Tamb(2) <= '0';
	WAIT FOR 70000 ps;
	Tamb(2) <= '1';
	WAIT FOR 40000 ps;
	Tamb(2) <= '0';
	WAIT FOR 40000 ps;
	Tamb(2) <= '1';
	WAIT FOR 40000 ps;
	Tamb(2) <= '0';
	WAIT FOR 40000 ps;
	Tamb(2) <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 6
	LOOP
		Tamb(2) <= '0';
		WAIT FOR 40000 ps;
		Tamb(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	Tamb(2) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_2;
-- Tamb[1]
t_prcs_Tamb_1: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		Tamb(1) <= '0';
		WAIT FOR 20000 ps;
		Tamb(1) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	Tamb(1) <= '0';
	WAIT FOR 20000 ps;
	Tamb(1) <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 5
	LOOP
		Tamb(1) <= '0';
		WAIT FOR 20000 ps;
		Tamb(1) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	Tamb(1) <= '0';
	WAIT FOR 40000 ps;
	Tamb(1) <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 11
	LOOP
		Tamb(1) <= '0';
		WAIT FOR 20000 ps;
		Tamb(1) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	Tamb(1) <= '0';
	WAIT FOR 20000 ps;
	Tamb(1) <= '1';
WAIT;
END PROCESS t_prcs_Tamb_1;
-- Tamb[0]
t_prcs_Tamb_0: PROCESS
BEGIN
	FOR i IN 1 TO 13
	LOOP
		Tamb(0) <= '0';
		WAIT FOR 10000 ps;
		Tamb(0) <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	Tamb(0) <= '0';
	WAIT FOR 20000 ps;
	Tamb(0) <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 10
	LOOP
		Tamb(0) <= '0';
		WAIT FOR 10000 ps;
		Tamb(0) <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	FOR i IN 1 TO 25
	LOOP
		Tamb(0) <= '0';
		WAIT FOR 10000 ps;
		Tamb(0) <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	Tamb(0) <= '0';
WAIT;
END PROCESS t_prcs_Tamb_0;
-- Tref[4]
t_prcs_Tref_4: PROCESS
BEGIN
	Tref(4) <= '0';
	WAIT FOR 270000 ps;
	Tref(4) <= '1';
WAIT;
END PROCESS t_prcs_Tref_4;
-- Tref[3]
t_prcs_Tref_3: PROCESS
BEGIN
	Tref(3) <= '0';
WAIT;
END PROCESS t_prcs_Tref_3;
-- Tref[2]
t_prcs_Tref_2: PROCESS
BEGIN
	Tref(2) <= '1';
	WAIT FOR 270000 ps;
	Tref(2) <= '0';
	WAIT FOR 220000 ps;
	Tref(2) <= '1';
WAIT;
END PROCESS t_prcs_Tref_2;
-- Tref[1]
t_prcs_Tref_1: PROCESS
BEGIN
	Tref(1) <= '0';
WAIT;
END PROCESS t_prcs_Tref_1;
-- Tref[0]
t_prcs_Tref_0: PROCESS
BEGIN
	Tref(0) <= '0';
WAIT;
END PROCESS t_prcs_Tref_0;
END ControloOnOff_arch;
