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
-- Generated on "05/28/2023 17:11:03"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SimulAmbiente
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SimulAmbiente_vhd_vec_tst IS
END SimulAmbiente_vhd_vec_tst;
ARCHITECTURE SimulAmbiente_arch OF SimulAmbiente_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL counter : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL up_down : STD_LOGIC;
COMPONENT SimulAmbiente
	PORT (
	clk : IN STD_LOGIC;
	counter : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	up_down : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SimulAmbiente
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	counter => counter,
	up_down => up_down
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

-- up_down
t_prcs_up_down: PROCESS
BEGIN
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 40000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 70000 ps;
	up_down <= '1';
	WAIT FOR 40000 ps;
	up_down <= '0';
	WAIT FOR 40000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 50000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 20000 ps;
	up_down <= '1';
	WAIT FOR 10000 ps;
	up_down <= '0';
	WAIT FOR 50000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 30000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 30000 ps;
	up_down <= '0';
	WAIT FOR 10000 ps;
	up_down <= '1';
	WAIT FOR 20000 ps;
	up_down <= '0';
WAIT;
END PROCESS t_prcs_up_down;
END SimulAmbiente_arch;
