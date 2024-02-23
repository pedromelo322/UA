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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/28/2023 00:01:03"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RAM_1P_Demo IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(15 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END RAM_1P_Demo;

-- Design Ports Information
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RAM_1P_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \debounce_KEY0|Add0~0_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \debounce_KEY0|s_dirtyIn~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_dirtyIn~q\ : std_logic;
SIGNAL \debounce_KEY0|s_previousIn~q\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[0]~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~19\ : std_logic;
SIGNAL \debounce_KEY0|Add0~20_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~15_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~21\ : std_logic;
SIGNAL \debounce_KEY0|Add0~22_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~16_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~23\ : std_logic;
SIGNAL \debounce_KEY0|Add0~24_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~8_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~25\ : std_logic;
SIGNAL \debounce_KEY0|Add0~26_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~9_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~27\ : std_logic;
SIGNAL \debounce_KEY0|Add0~28_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~17_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~29\ : std_logic;
SIGNAL \debounce_KEY0|Add0~30_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~31\ : std_logic;
SIGNAL \debounce_KEY0|Add0~32_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~33\ : std_logic;
SIGNAL \debounce_KEY0|Add0~34_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~35\ : std_logic;
SIGNAL \debounce_KEY0|Add0~36_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[18]~18_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~37\ : std_logic;
SIGNAL \debounce_KEY0|Add0~38_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[19]~19_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~39\ : std_logic;
SIGNAL \debounce_KEY0|Add0~40_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[20]~10_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~41\ : std_logic;
SIGNAL \debounce_KEY0|Add0~42_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[21]~11_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~5_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|LessThan0~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[0]~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~11\ : std_logic;
SIGNAL \debounce_KEY0|Add0~12_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~13\ : std_logic;
SIGNAL \debounce_KEY0|Add0~14_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~12_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~15\ : std_logic;
SIGNAL \debounce_KEY0|Add0~16_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~13_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~17\ : std_logic;
SIGNAL \debounce_KEY0|Add0~18_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~14_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~3_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~0_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~1_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[0]~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[22]~25_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~43\ : std_logic;
SIGNAL \debounce_KEY0|Add0~44_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[22]~26_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt[0]~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~24_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~1\ : std_logic;
SIGNAL \debounce_KEY0|Add0~2_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~20_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~3\ : std_logic;
SIGNAL \debounce_KEY0|Add0~4_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~21_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~5\ : std_logic;
SIGNAL \debounce_KEY0|Add0~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~22_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~7\ : std_logic;
SIGNAL \debounce_KEY0|Add0~8_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~23_combout\ : std_logic;
SIGNAL \debounce_KEY0|Add0~9\ : std_logic;
SIGNAL \debounce_KEY0|Add0~10_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_debounceCnt~27_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~6_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~7_combout\ : std_logic;
SIGNAL \debounce_KEY0|s_pulsedOut~q\ : std_logic;
SIGNAL \contador_inst|Add0~1\ : std_logic;
SIGNAL \contador_inst|Add0~2_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \s_sw[3]~feeder_combout\ : std_logic;
SIGNAL \contador_inst|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \contador_inst|Add0~5\ : std_logic;
SIGNAL \contador_inst|Add0~6_combout\ : std_logic;
SIGNAL \contador_inst|Add0~7\ : std_logic;
SIGNAL \contador_inst|Add0~8_combout\ : std_logic;
SIGNAL \contador_inst|Add0~9\ : std_logic;
SIGNAL \contador_inst|Add0~10_combout\ : std_logic;
SIGNAL \contador_inst|Add0~11\ : std_logic;
SIGNAL \contador_inst|Add0~12_combout\ : std_logic;
SIGNAL \contador_inst|Add0~13\ : std_logic;
SIGNAL \contador_inst|Add0~14_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \contador_inst|data_signal~10_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \contador_inst|data_signal~9_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \contador_inst|data_signal~8_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \contador_inst|data_signal~7_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \contador_inst|data_signal~6_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \contador_inst|data_signal~4_combout\ : std_logic;
SIGNAL \contador_inst|Add0~3\ : std_logic;
SIGNAL \contador_inst|Add0~4_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \contador_inst|data_signal~5_combout\ : std_logic;
SIGNAL \contador_inst|data_signal[0]~0_combout\ : std_logic;
SIGNAL \contador_inst|data_signal[0]~1_combout\ : std_logic;
SIGNAL \contador_inst|data_signal~2_combout\ : std_logic;
SIGNAL \contador_inst|Add0~0_combout\ : std_logic;
SIGNAL \contador_inst|data_signal~3_combout\ : std_logic;
SIGNAL \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \contador_inst|data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL s_sw : std_logic_vector(15 DOWNTO 0);
SIGNAL \contador_inst|data_signal\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \debounce_KEY0|s_debounceCnt\ : std_logic_vector(22 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \contador_inst|data_out\(7) & \contador_inst|data_out\(6) & \contador_inst|data_out\(5) & 
\contador_inst|data_out\(4) & \contador_inst|data_out\(3) & \contador_inst|data_out\(2) & \contador_inst|data_out\(1) & \contador_inst|data_out\(0));

\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (s_sw(3) & s_sw(2) & s_sw(1) & s_sw(0));

\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\ <= \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: FF_X86_Y43_N13
\s_sw[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[12]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sw(12));

-- Location: LCCOMB_X98_Y44_N10
\debounce_KEY0|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~0_combout\ = \debounce_KEY0|s_debounceCnt\(0) $ (VCC)
-- \debounce_KEY0|Add0~1\ = CARRY(\debounce_KEY0|s_debounceCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(0),
	datad => VCC,
	combout => \debounce_KEY0|Add0~0_combout\,
	cout => \debounce_KEY0|Add0~1\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X100_Y43_N4
\debounce_KEY0|s_dirtyIn~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_dirtyIn~0_combout\ = !\KEY[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[0]~input_o\,
	combout => \debounce_KEY0|s_dirtyIn~0_combout\);

-- Location: FF_X100_Y43_N5
\debounce_KEY0|s_dirtyIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_dirtyIn~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_dirtyIn~q\);

-- Location: FF_X97_Y43_N11
\debounce_KEY0|s_previousIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \debounce_KEY0|s_dirtyIn~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_previousIn~q\);

-- Location: LCCOMB_X97_Y43_N10
\debounce_KEY0|s_debounceCnt[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[0]~3_combout\ = (\debounce_KEY0|s_debounceCnt\(22)) # (((\debounce_KEY0|s_debounceCnt[0]~2_combout\) # (!\debounce_KEY0|s_previousIn~q\)) # (!\debounce_KEY0|s_dirtyIn~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(22),
	datab => \debounce_KEY0|s_dirtyIn~q\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[0]~2_combout\,
	combout => \debounce_KEY0|s_debounceCnt[0]~3_combout\);

-- Location: LCCOMB_X98_Y44_N28
\debounce_KEY0|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~18_combout\ = (\debounce_KEY0|s_debounceCnt\(9) & (\debounce_KEY0|Add0~17\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(9) & (!\debounce_KEY0|Add0~17\))
-- \debounce_KEY0|Add0~19\ = CARRY((!\debounce_KEY0|s_debounceCnt\(9) & !\debounce_KEY0|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(9),
	datad => VCC,
	cin => \debounce_KEY0|Add0~17\,
	combout => \debounce_KEY0|Add0~18_combout\,
	cout => \debounce_KEY0|Add0~19\);

-- Location: LCCOMB_X98_Y44_N30
\debounce_KEY0|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~20_combout\ = (\debounce_KEY0|s_debounceCnt\(10) & ((GND) # (!\debounce_KEY0|Add0~19\))) # (!\debounce_KEY0|s_debounceCnt\(10) & (\debounce_KEY0|Add0~19\ $ (GND)))
-- \debounce_KEY0|Add0~21\ = CARRY((\debounce_KEY0|s_debounceCnt\(10)) # (!\debounce_KEY0|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(10),
	datad => VCC,
	cin => \debounce_KEY0|Add0~19\,
	combout => \debounce_KEY0|Add0~20_combout\,
	cout => \debounce_KEY0|Add0~21\);

-- Location: LCCOMB_X97_Y43_N20
\debounce_KEY0|s_debounceCnt~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~15_combout\ = (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~20_combout\,
	combout => \debounce_KEY0|s_debounceCnt~15_combout\);

-- Location: FF_X97_Y43_N21
\debounce_KEY0|s_debounceCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~15_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(10));

-- Location: LCCOMB_X98_Y43_N0
\debounce_KEY0|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~22_combout\ = (\debounce_KEY0|s_debounceCnt\(11) & (\debounce_KEY0|Add0~21\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(11) & (!\debounce_KEY0|Add0~21\))
-- \debounce_KEY0|Add0~23\ = CARRY((!\debounce_KEY0|s_debounceCnt\(11) & !\debounce_KEY0|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(11),
	datad => VCC,
	cin => \debounce_KEY0|Add0~21\,
	combout => \debounce_KEY0|Add0~22_combout\,
	cout => \debounce_KEY0|Add0~23\);

-- Location: LCCOMB_X97_Y43_N16
\debounce_KEY0|s_debounceCnt~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~16_combout\ = (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~22_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~22_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~16_combout\);

-- Location: FF_X97_Y43_N17
\debounce_KEY0|s_debounceCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~16_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(11));

-- Location: LCCOMB_X98_Y43_N2
\debounce_KEY0|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~24_combout\ = (\debounce_KEY0|s_debounceCnt\(12) & ((GND) # (!\debounce_KEY0|Add0~23\))) # (!\debounce_KEY0|s_debounceCnt\(12) & (\debounce_KEY0|Add0~23\ $ (GND)))
-- \debounce_KEY0|Add0~25\ = CARRY((\debounce_KEY0|s_debounceCnt\(12)) # (!\debounce_KEY0|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(12),
	datad => VCC,
	cin => \debounce_KEY0|Add0~23\,
	combout => \debounce_KEY0|Add0~24_combout\,
	cout => \debounce_KEY0|Add0~25\);

-- Location: LCCOMB_X97_Y43_N12
\debounce_KEY0|s_debounceCnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~8_combout\ = (\debounce_KEY0|Add0~24_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~24_combout\,
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~8_combout\);

-- Location: FF_X97_Y43_N13
\debounce_KEY0|s_debounceCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~8_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(12));

-- Location: LCCOMB_X98_Y43_N4
\debounce_KEY0|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~26_combout\ = (\debounce_KEY0|s_debounceCnt\(13) & (\debounce_KEY0|Add0~25\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(13) & (!\debounce_KEY0|Add0~25\))
-- \debounce_KEY0|Add0~27\ = CARRY((!\debounce_KEY0|s_debounceCnt\(13) & !\debounce_KEY0|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(13),
	datad => VCC,
	cin => \debounce_KEY0|Add0~25\,
	combout => \debounce_KEY0|Add0~26_combout\,
	cout => \debounce_KEY0|Add0~27\);

-- Location: LCCOMB_X98_Y43_N24
\debounce_KEY0|s_debounceCnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~9_combout\ = (\debounce_KEY0|Add0~26_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~26_combout\,
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~9_combout\);

-- Location: FF_X98_Y43_N25
\debounce_KEY0|s_debounceCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~9_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(13));

-- Location: LCCOMB_X98_Y43_N6
\debounce_KEY0|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~28_combout\ = (\debounce_KEY0|s_debounceCnt\(14) & ((GND) # (!\debounce_KEY0|Add0~27\))) # (!\debounce_KEY0|s_debounceCnt\(14) & (\debounce_KEY0|Add0~27\ $ (GND)))
-- \debounce_KEY0|Add0~29\ = CARRY((\debounce_KEY0|s_debounceCnt\(14)) # (!\debounce_KEY0|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(14),
	datad => VCC,
	cin => \debounce_KEY0|Add0~27\,
	combout => \debounce_KEY0|Add0~28_combout\,
	cout => \debounce_KEY0|Add0~29\);

-- Location: LCCOMB_X97_Y43_N22
\debounce_KEY0|s_debounceCnt~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~17_combout\ = (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~28_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~28_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~17_combout\);

-- Location: FF_X97_Y43_N23
\debounce_KEY0|s_debounceCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~17_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(14));

-- Location: LCCOMB_X98_Y43_N8
\debounce_KEY0|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~30_combout\ = (\debounce_KEY0|s_debounceCnt\(15) & (\debounce_KEY0|Add0~29\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(15) & (!\debounce_KEY0|Add0~29\))
-- \debounce_KEY0|Add0~31\ = CARRY((!\debounce_KEY0|s_debounceCnt\(15) & !\debounce_KEY0|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(15),
	datad => VCC,
	cin => \debounce_KEY0|Add0~29\,
	combout => \debounce_KEY0|Add0~30_combout\,
	cout => \debounce_KEY0|Add0~31\);

-- Location: LCCOMB_X99_Y43_N2
\debounce_KEY0|s_debounceCnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~5_combout\ = (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~30_combout\,
	combout => \debounce_KEY0|s_debounceCnt~5_combout\);

-- Location: FF_X99_Y43_N3
\debounce_KEY0|s_debounceCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~5_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(15));

-- Location: LCCOMB_X98_Y43_N10
\debounce_KEY0|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~32_combout\ = (\debounce_KEY0|s_debounceCnt\(16) & ((GND) # (!\debounce_KEY0|Add0~31\))) # (!\debounce_KEY0|s_debounceCnt\(16) & (\debounce_KEY0|Add0~31\ $ (GND)))
-- \debounce_KEY0|Add0~33\ = CARRY((\debounce_KEY0|s_debounceCnt\(16)) # (!\debounce_KEY0|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(16),
	datad => VCC,
	cin => \debounce_KEY0|Add0~31\,
	combout => \debounce_KEY0|Add0~32_combout\,
	cout => \debounce_KEY0|Add0~33\);

-- Location: LCCOMB_X99_Y43_N4
\debounce_KEY0|s_debounceCnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~6_combout\ = (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~32_combout\,
	combout => \debounce_KEY0|s_debounceCnt~6_combout\);

-- Location: FF_X99_Y43_N5
\debounce_KEY0|s_debounceCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~6_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(16));

-- Location: LCCOMB_X98_Y43_N12
\debounce_KEY0|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~34_combout\ = (\debounce_KEY0|s_debounceCnt\(17) & (\debounce_KEY0|Add0~33\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(17) & (!\debounce_KEY0|Add0~33\))
-- \debounce_KEY0|Add0~35\ = CARRY((!\debounce_KEY0|s_debounceCnt\(17) & !\debounce_KEY0|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(17),
	datad => VCC,
	cin => \debounce_KEY0|Add0~33\,
	combout => \debounce_KEY0|Add0~34_combout\,
	cout => \debounce_KEY0|Add0~35\);

-- Location: LCCOMB_X99_Y43_N26
\debounce_KEY0|s_debounceCnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~7_combout\ = (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~34_combout\,
	combout => \debounce_KEY0|s_debounceCnt~7_combout\);

-- Location: FF_X99_Y43_N27
\debounce_KEY0|s_debounceCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~7_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(17));

-- Location: LCCOMB_X98_Y43_N14
\debounce_KEY0|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~36_combout\ = (\debounce_KEY0|s_debounceCnt\(18) & ((GND) # (!\debounce_KEY0|Add0~35\))) # (!\debounce_KEY0|s_debounceCnt\(18) & (\debounce_KEY0|Add0~35\ $ (GND)))
-- \debounce_KEY0|Add0~37\ = CARRY((\debounce_KEY0|s_debounceCnt\(18)) # (!\debounce_KEY0|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(18),
	datad => VCC,
	cin => \debounce_KEY0|Add0~35\,
	combout => \debounce_KEY0|Add0~36_combout\,
	cout => \debounce_KEY0|Add0~37\);

-- Location: LCCOMB_X97_Y43_N8
\debounce_KEY0|s_debounceCnt[18]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[18]~18_combout\ = (\debounce_KEY0|s_debounceCnt[0]~3_combout\ & (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~36_combout\) # (!\debounce_KEY0|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~36_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt[18]~18_combout\);

-- Location: FF_X97_Y43_N9
\debounce_KEY0|s_debounceCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[18]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(18));

-- Location: LCCOMB_X98_Y43_N16
\debounce_KEY0|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~38_combout\ = (\debounce_KEY0|s_debounceCnt\(19) & (\debounce_KEY0|Add0~37\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(19) & (!\debounce_KEY0|Add0~37\))
-- \debounce_KEY0|Add0~39\ = CARRY((!\debounce_KEY0|s_debounceCnt\(19) & !\debounce_KEY0|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(19),
	datad => VCC,
	cin => \debounce_KEY0|Add0~37\,
	combout => \debounce_KEY0|Add0~38_combout\,
	cout => \debounce_KEY0|Add0~39\);

-- Location: LCCOMB_X97_Y43_N2
\debounce_KEY0|s_debounceCnt[19]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[19]~19_combout\ = (\debounce_KEY0|s_debounceCnt[0]~3_combout\ & (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~38_combout\) # (!\debounce_KEY0|s_previousIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	datab => \debounce_KEY0|Add0~38_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt[19]~19_combout\);

-- Location: FF_X97_Y43_N3
\debounce_KEY0|s_debounceCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[19]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(19));

-- Location: LCCOMB_X98_Y43_N18
\debounce_KEY0|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~40_combout\ = (\debounce_KEY0|s_debounceCnt\(20) & ((GND) # (!\debounce_KEY0|Add0~39\))) # (!\debounce_KEY0|s_debounceCnt\(20) & (\debounce_KEY0|Add0~39\ $ (GND)))
-- \debounce_KEY0|Add0~41\ = CARRY((\debounce_KEY0|s_debounceCnt\(20)) # (!\debounce_KEY0|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(20),
	datad => VCC,
	cin => \debounce_KEY0|Add0~39\,
	combout => \debounce_KEY0|Add0~40_combout\,
	cout => \debounce_KEY0|Add0~41\);

-- Location: LCCOMB_X98_Y43_N30
\debounce_KEY0|s_debounceCnt[20]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[20]~10_combout\ = (\debounce_KEY0|s_debounceCnt[0]~3_combout\ & (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~40_combout\,
	combout => \debounce_KEY0|s_debounceCnt[20]~10_combout\);

-- Location: FF_X98_Y43_N31
\debounce_KEY0|s_debounceCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[20]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(20));

-- Location: LCCOMB_X98_Y43_N20
\debounce_KEY0|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~42_combout\ = (\debounce_KEY0|s_debounceCnt\(21) & (\debounce_KEY0|Add0~41\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(21) & (!\debounce_KEY0|Add0~41\))
-- \debounce_KEY0|Add0~43\ = CARRY((!\debounce_KEY0|s_debounceCnt\(21) & !\debounce_KEY0|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(21),
	datad => VCC,
	cin => \debounce_KEY0|Add0~41\,
	combout => \debounce_KEY0|Add0~42_combout\,
	cout => \debounce_KEY0|Add0~43\);

-- Location: LCCOMB_X98_Y43_N28
\debounce_KEY0|s_debounceCnt[21]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[21]~11_combout\ = (\debounce_KEY0|s_debounceCnt[0]~3_combout\ & (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~42_combout\,
	combout => \debounce_KEY0|s_debounceCnt[21]~11_combout\);

-- Location: FF_X98_Y43_N29
\debounce_KEY0|s_debounceCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[21]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(21));

-- Location: LCCOMB_X99_Y43_N6
\debounce_KEY0|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~4_combout\ = (\debounce_KEY0|s_debounceCnt\(13)) # ((\debounce_KEY0|s_debounceCnt\(12)) # ((\debounce_KEY0|s_debounceCnt\(10) & \debounce_KEY0|s_debounceCnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(10),
	datab => \debounce_KEY0|s_debounceCnt\(13),
	datac => \debounce_KEY0|s_debounceCnt\(12),
	datad => \debounce_KEY0|s_debounceCnt\(11),
	combout => \debounce_KEY0|LessThan0~4_combout\);

-- Location: LCCOMB_X99_Y43_N20
\debounce_KEY0|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~5_combout\ = (\debounce_KEY0|s_debounceCnt\(15)) # ((\debounce_KEY0|s_debounceCnt\(16)) # ((\debounce_KEY0|LessThan0~4_combout\ & \debounce_KEY0|s_debounceCnt\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|LessThan0~4_combout\,
	datab => \debounce_KEY0|s_debounceCnt\(15),
	datac => \debounce_KEY0|s_debounceCnt\(16),
	datad => \debounce_KEY0|s_debounceCnt\(14),
	combout => \debounce_KEY0|LessThan0~5_combout\);

-- Location: LCCOMB_X99_Y43_N22
\debounce_KEY0|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~6_combout\ = (\debounce_KEY0|s_debounceCnt\(18) & (\debounce_KEY0|s_debounceCnt\(19) & ((\debounce_KEY0|s_debounceCnt\(17)) # (\debounce_KEY0|LessThan0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(17),
	datab => \debounce_KEY0|s_debounceCnt\(18),
	datac => \debounce_KEY0|s_debounceCnt\(19),
	datad => \debounce_KEY0|LessThan0~5_combout\,
	combout => \debounce_KEY0|LessThan0~6_combout\);

-- Location: LCCOMB_X97_Y43_N28
\debounce_KEY0|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~0_combout\ = (\debounce_KEY0|s_debounceCnt\(14) & (\debounce_KEY0|s_debounceCnt\(8) & (\debounce_KEY0|s_debounceCnt\(18) & \debounce_KEY0|s_debounceCnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(14),
	datab => \debounce_KEY0|s_debounceCnt\(8),
	datac => \debounce_KEY0|s_debounceCnt\(18),
	datad => \debounce_KEY0|s_debounceCnt\(19),
	combout => \debounce_KEY0|LessThan0~0_combout\);

-- Location: LCCOMB_X98_Y44_N6
\debounce_KEY0|s_pulsedOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~5_combout\ = (!\debounce_KEY0|s_debounceCnt\(2) & (!\debounce_KEY0|s_debounceCnt\(3) & (!\debounce_KEY0|s_debounceCnt\(1) & !\debounce_KEY0|s_debounceCnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(2),
	datab => \debounce_KEY0|s_debounceCnt\(3),
	datac => \debounce_KEY0|s_debounceCnt\(1),
	datad => \debounce_KEY0|s_debounceCnt\(4),
	combout => \debounce_KEY0|s_pulsedOut~5_combout\);

-- Location: LCCOMB_X99_Y43_N30
\debounce_KEY0|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~2_combout\ = (\debounce_KEY0|s_debounceCnt\(6) & ((\debounce_KEY0|s_debounceCnt\(5)) # ((\debounce_KEY0|s_debounceCnt\(0)) # (!\debounce_KEY0|s_pulsedOut~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(5),
	datab => \debounce_KEY0|s_debounceCnt\(6),
	datac => \debounce_KEY0|s_debounceCnt\(0),
	datad => \debounce_KEY0|s_pulsedOut~5_combout\,
	combout => \debounce_KEY0|LessThan0~2_combout\);

-- Location: LCCOMB_X99_Y43_N16
\debounce_KEY0|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~1_combout\ = (\debounce_KEY0|s_debounceCnt\(9) & \debounce_KEY0|s_debounceCnt\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_KEY0|s_debounceCnt\(9),
	datad => \debounce_KEY0|s_debounceCnt\(11),
	combout => \debounce_KEY0|LessThan0~1_combout\);

-- Location: LCCOMB_X99_Y43_N12
\debounce_KEY0|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~3_combout\ = (\debounce_KEY0|LessThan0~0_combout\ & (\debounce_KEY0|LessThan0~1_combout\ & ((\debounce_KEY0|s_debounceCnt\(7)) # (\debounce_KEY0|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|LessThan0~0_combout\,
	datab => \debounce_KEY0|s_debounceCnt\(7),
	datac => \debounce_KEY0|LessThan0~2_combout\,
	datad => \debounce_KEY0|LessThan0~1_combout\,
	combout => \debounce_KEY0|LessThan0~3_combout\);

-- Location: LCCOMB_X99_Y43_N24
\debounce_KEY0|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|LessThan0~7_combout\ = (\debounce_KEY0|s_debounceCnt\(21)) # ((\debounce_KEY0|s_debounceCnt\(20)) # ((\debounce_KEY0|LessThan0~6_combout\) # (\debounce_KEY0|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(21),
	datab => \debounce_KEY0|s_debounceCnt\(20),
	datac => \debounce_KEY0|LessThan0~6_combout\,
	datad => \debounce_KEY0|LessThan0~3_combout\,
	combout => \debounce_KEY0|LessThan0~7_combout\);

-- Location: LCCOMB_X99_Y43_N14
\debounce_KEY0|s_debounceCnt[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[0]~0_combout\ = (\debounce_KEY0|s_dirtyIn~q\ & ((!\debounce_KEY0|LessThan0~7_combout\) # (!\debounce_KEY0|s_debounceCnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_dirtyIn~q\,
	datac => \debounce_KEY0|s_debounceCnt\(22),
	datad => \debounce_KEY0|LessThan0~7_combout\,
	combout => \debounce_KEY0|s_debounceCnt[0]~0_combout\);

-- Location: LCCOMB_X98_Y44_N20
\debounce_KEY0|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~10_combout\ = (\debounce_KEY0|s_debounceCnt\(5) & (\debounce_KEY0|Add0~9\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(5) & (!\debounce_KEY0|Add0~9\))
-- \debounce_KEY0|Add0~11\ = CARRY((!\debounce_KEY0|s_debounceCnt\(5) & !\debounce_KEY0|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(5),
	datad => VCC,
	cin => \debounce_KEY0|Add0~9\,
	combout => \debounce_KEY0|Add0~10_combout\,
	cout => \debounce_KEY0|Add0~11\);

-- Location: LCCOMB_X98_Y44_N22
\debounce_KEY0|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~12_combout\ = (\debounce_KEY0|s_debounceCnt\(6) & ((GND) # (!\debounce_KEY0|Add0~11\))) # (!\debounce_KEY0|s_debounceCnt\(6) & (\debounce_KEY0|Add0~11\ $ (GND)))
-- \debounce_KEY0|Add0~13\ = CARRY((\debounce_KEY0|s_debounceCnt\(6)) # (!\debounce_KEY0|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(6),
	datad => VCC,
	cin => \debounce_KEY0|Add0~11\,
	combout => \debounce_KEY0|Add0~12_combout\,
	cout => \debounce_KEY0|Add0~13\);

-- Location: LCCOMB_X99_Y43_N8
\debounce_KEY0|s_debounceCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~1_combout\ = (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~12_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	datad => \debounce_KEY0|Add0~12_combout\,
	combout => \debounce_KEY0|s_debounceCnt~1_combout\);

-- Location: FF_X99_Y43_N9
\debounce_KEY0|s_debounceCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~1_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(6));

-- Location: LCCOMB_X98_Y44_N24
\debounce_KEY0|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~14_combout\ = (\debounce_KEY0|s_debounceCnt\(7) & (\debounce_KEY0|Add0~13\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(7) & (!\debounce_KEY0|Add0~13\))
-- \debounce_KEY0|Add0~15\ = CARRY((!\debounce_KEY0|s_debounceCnt\(7) & !\debounce_KEY0|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(7),
	datad => VCC,
	cin => \debounce_KEY0|Add0~13\,
	combout => \debounce_KEY0|Add0~14_combout\,
	cout => \debounce_KEY0|Add0~15\);

-- Location: LCCOMB_X97_Y43_N14
\debounce_KEY0|s_debounceCnt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~12_combout\ = (\debounce_KEY0|s_debounceCnt[0]~4_combout\ & \debounce_KEY0|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	datad => \debounce_KEY0|Add0~14_combout\,
	combout => \debounce_KEY0|s_debounceCnt~12_combout\);

-- Location: FF_X97_Y43_N15
\debounce_KEY0|s_debounceCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~12_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(7));

-- Location: LCCOMB_X98_Y44_N26
\debounce_KEY0|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~16_combout\ = (\debounce_KEY0|s_debounceCnt\(8) & ((GND) # (!\debounce_KEY0|Add0~15\))) # (!\debounce_KEY0|s_debounceCnt\(8) & (\debounce_KEY0|Add0~15\ $ (GND)))
-- \debounce_KEY0|Add0~17\ = CARRY((\debounce_KEY0|s_debounceCnt\(8)) # (!\debounce_KEY0|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(8),
	datad => VCC,
	cin => \debounce_KEY0|Add0~15\,
	combout => \debounce_KEY0|Add0~16_combout\,
	cout => \debounce_KEY0|Add0~17\);

-- Location: LCCOMB_X97_Y43_N0
\debounce_KEY0|s_debounceCnt~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~13_combout\ = (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~16_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|Add0~16_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~13_combout\);

-- Location: FF_X97_Y43_N1
\debounce_KEY0|s_debounceCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~13_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(8));

-- Location: LCCOMB_X97_Y43_N6
\debounce_KEY0|s_debounceCnt~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~14_combout\ = (\debounce_KEY0|s_debounceCnt[0]~0_combout\ & ((\debounce_KEY0|Add0~18_combout\) # (!\debounce_KEY0|s_previousIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~18_combout\,
	datac => \debounce_KEY0|s_previousIn~q\,
	datad => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	combout => \debounce_KEY0|s_debounceCnt~14_combout\);

-- Location: FF_X97_Y43_N7
\debounce_KEY0|s_debounceCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~14_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(9));

-- Location: LCCOMB_X97_Y43_N26
\debounce_KEY0|s_pulsedOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~2_combout\ = (!\debounce_KEY0|s_debounceCnt\(9) & (!\debounce_KEY0|s_debounceCnt\(10) & (!\debounce_KEY0|s_debounceCnt\(7) & !\debounce_KEY0|s_debounceCnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(9),
	datab => \debounce_KEY0|s_debounceCnt\(10),
	datac => \debounce_KEY0|s_debounceCnt\(7),
	datad => \debounce_KEY0|s_debounceCnt\(8),
	combout => \debounce_KEY0|s_pulsedOut~2_combout\);

-- Location: LCCOMB_X97_Y43_N24
\debounce_KEY0|s_pulsedOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~3_combout\ = (!\debounce_KEY0|s_debounceCnt\(14) & (!\debounce_KEY0|s_debounceCnt\(19) & (!\debounce_KEY0|s_debounceCnt\(18) & !\debounce_KEY0|s_debounceCnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(14),
	datab => \debounce_KEY0|s_debounceCnt\(19),
	datac => \debounce_KEY0|s_debounceCnt\(18),
	datad => \debounce_KEY0|s_debounceCnt\(11),
	combout => \debounce_KEY0|s_pulsedOut~3_combout\);

-- Location: LCCOMB_X99_Y43_N28
\debounce_KEY0|s_pulsedOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~0_combout\ = (!\debounce_KEY0|s_debounceCnt\(17) & (!\debounce_KEY0|s_debounceCnt\(16) & (!\debounce_KEY0|s_debounceCnt\(6) & !\debounce_KEY0|s_debounceCnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(17),
	datab => \debounce_KEY0|s_debounceCnt\(16),
	datac => \debounce_KEY0|s_debounceCnt\(6),
	datad => \debounce_KEY0|s_debounceCnt\(15),
	combout => \debounce_KEY0|s_pulsedOut~0_combout\);

-- Location: LCCOMB_X98_Y43_N26
\debounce_KEY0|s_pulsedOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~1_combout\ = (!\debounce_KEY0|s_debounceCnt\(20) & (!\debounce_KEY0|s_debounceCnt\(13) & (!\debounce_KEY0|s_debounceCnt\(21) & !\debounce_KEY0|s_debounceCnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(20),
	datab => \debounce_KEY0|s_debounceCnt\(13),
	datac => \debounce_KEY0|s_debounceCnt\(21),
	datad => \debounce_KEY0|s_debounceCnt\(12),
	combout => \debounce_KEY0|s_pulsedOut~1_combout\);

-- Location: LCCOMB_X97_Y43_N30
\debounce_KEY0|s_pulsedOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~4_combout\ = (\debounce_KEY0|s_pulsedOut~2_combout\ & (\debounce_KEY0|s_pulsedOut~3_combout\ & (\debounce_KEY0|s_pulsedOut~0_combout\ & \debounce_KEY0|s_pulsedOut~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_pulsedOut~2_combout\,
	datab => \debounce_KEY0|s_pulsedOut~3_combout\,
	datac => \debounce_KEY0|s_pulsedOut~0_combout\,
	datad => \debounce_KEY0|s_pulsedOut~1_combout\,
	combout => \debounce_KEY0|s_pulsedOut~4_combout\);

-- Location: LCCOMB_X97_Y43_N18
\debounce_KEY0|s_debounceCnt[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[0]~2_combout\ = (\debounce_KEY0|s_debounceCnt\(0)) # ((\debounce_KEY0|s_debounceCnt\(5)) # ((!\debounce_KEY0|s_pulsedOut~5_combout\) # (!\debounce_KEY0|s_pulsedOut~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(0),
	datab => \debounce_KEY0|s_debounceCnt\(5),
	datac => \debounce_KEY0|s_pulsedOut~4_combout\,
	datad => \debounce_KEY0|s_pulsedOut~5_combout\,
	combout => \debounce_KEY0|s_debounceCnt[0]~2_combout\);

-- Location: LCCOMB_X99_Y43_N10
\debounce_KEY0|s_debounceCnt[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[22]~25_combout\ = (\debounce_KEY0|s_dirtyIn~q\ & ((\debounce_KEY0|s_debounceCnt\(22) & ((!\debounce_KEY0|LessThan0~7_combout\))) # (!\debounce_KEY0|s_debounceCnt\(22) & (\debounce_KEY0|s_debounceCnt[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[0]~2_combout\,
	datab => \debounce_KEY0|s_dirtyIn~q\,
	datac => \debounce_KEY0|s_debounceCnt\(22),
	datad => \debounce_KEY0|LessThan0~7_combout\,
	combout => \debounce_KEY0|s_debounceCnt[22]~25_combout\);

-- Location: LCCOMB_X98_Y43_N22
\debounce_KEY0|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~44_combout\ = \debounce_KEY0|s_debounceCnt\(22) $ (\debounce_KEY0|Add0~43\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(22),
	cin => \debounce_KEY0|Add0~43\,
	combout => \debounce_KEY0|Add0~44_combout\);

-- Location: LCCOMB_X99_Y43_N18
\debounce_KEY0|s_debounceCnt[22]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[22]~26_combout\ = (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|s_debounceCnt[22]~25_combout\ & ((\debounce_KEY0|Add0~44_combout\)))) # (!\debounce_KEY0|s_previousIn~q\ & (((\debounce_KEY0|s_debounceCnt[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt[22]~25_combout\,
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt[0]~0_combout\,
	datad => \debounce_KEY0|Add0~44_combout\,
	combout => \debounce_KEY0|s_debounceCnt[22]~26_combout\);

-- Location: FF_X99_Y43_N19
\debounce_KEY0|s_debounceCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt[22]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(22));

-- Location: LCCOMB_X99_Y43_N0
\debounce_KEY0|s_debounceCnt[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt[0]~4_combout\ = (\debounce_KEY0|s_dirtyIn~q\ & (\debounce_KEY0|s_previousIn~q\ & ((!\debounce_KEY0|LessThan0~7_combout\) # (!\debounce_KEY0|s_debounceCnt\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_dirtyIn~q\,
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt\(22),
	datad => \debounce_KEY0|LessThan0~7_combout\,
	combout => \debounce_KEY0|s_debounceCnt[0]~4_combout\);

-- Location: LCCOMB_X97_Y43_N4
\debounce_KEY0|s_debounceCnt~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~24_combout\ = (\debounce_KEY0|Add0~0_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~0_combout\,
	datac => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~24_combout\);

-- Location: FF_X97_Y43_N5
\debounce_KEY0|s_debounceCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~24_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(0));

-- Location: LCCOMB_X98_Y44_N12
\debounce_KEY0|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~2_combout\ = (\debounce_KEY0|s_debounceCnt\(1) & (\debounce_KEY0|Add0~1\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(1) & (!\debounce_KEY0|Add0~1\))
-- \debounce_KEY0|Add0~3\ = CARRY((!\debounce_KEY0|s_debounceCnt\(1) & !\debounce_KEY0|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(1),
	datad => VCC,
	cin => \debounce_KEY0|Add0~1\,
	combout => \debounce_KEY0|Add0~2_combout\,
	cout => \debounce_KEY0|Add0~3\);

-- Location: LCCOMB_X98_Y44_N8
\debounce_KEY0|s_debounceCnt~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~20_combout\ = (\debounce_KEY0|Add0~2_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~2_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~20_combout\);

-- Location: FF_X98_Y44_N9
\debounce_KEY0|s_debounceCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~20_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(1));

-- Location: LCCOMB_X98_Y44_N14
\debounce_KEY0|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~4_combout\ = (\debounce_KEY0|s_debounceCnt\(2) & ((GND) # (!\debounce_KEY0|Add0~3\))) # (!\debounce_KEY0|s_debounceCnt\(2) & (\debounce_KEY0|Add0~3\ $ (GND)))
-- \debounce_KEY0|Add0~5\ = CARRY((\debounce_KEY0|s_debounceCnt\(2)) # (!\debounce_KEY0|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(2),
	datad => VCC,
	cin => \debounce_KEY0|Add0~3\,
	combout => \debounce_KEY0|Add0~4_combout\,
	cout => \debounce_KEY0|Add0~5\);

-- Location: LCCOMB_X99_Y44_N4
\debounce_KEY0|s_debounceCnt~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~21_combout\ = (\debounce_KEY0|Add0~4_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|Add0~4_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~21_combout\);

-- Location: FF_X99_Y44_N5
\debounce_KEY0|s_debounceCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~21_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(2));

-- Location: LCCOMB_X98_Y44_N16
\debounce_KEY0|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~6_combout\ = (\debounce_KEY0|s_debounceCnt\(3) & (\debounce_KEY0|Add0~5\ & VCC)) # (!\debounce_KEY0|s_debounceCnt\(3) & (!\debounce_KEY0|Add0~5\))
-- \debounce_KEY0|Add0~7\ = CARRY((!\debounce_KEY0|s_debounceCnt\(3) & !\debounce_KEY0|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(3),
	datad => VCC,
	cin => \debounce_KEY0|Add0~5\,
	combout => \debounce_KEY0|Add0~6_combout\,
	cout => \debounce_KEY0|Add0~7\);

-- Location: LCCOMB_X98_Y44_N2
\debounce_KEY0|s_debounceCnt~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~22_combout\ = (\debounce_KEY0|Add0~6_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~6_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~22_combout\);

-- Location: FF_X98_Y44_N3
\debounce_KEY0|s_debounceCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~22_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(3));

-- Location: LCCOMB_X98_Y44_N18
\debounce_KEY0|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|Add0~8_combout\ = (\debounce_KEY0|s_debounceCnt\(4) & ((GND) # (!\debounce_KEY0|Add0~7\))) # (!\debounce_KEY0|s_debounceCnt\(4) & (\debounce_KEY0|Add0~7\ $ (GND)))
-- \debounce_KEY0|Add0~9\ = CARRY((\debounce_KEY0|s_debounceCnt\(4)) # (!\debounce_KEY0|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|s_debounceCnt\(4),
	datad => VCC,
	cin => \debounce_KEY0|Add0~7\,
	combout => \debounce_KEY0|Add0~8_combout\,
	cout => \debounce_KEY0|Add0~9\);

-- Location: LCCOMB_X98_Y44_N0
\debounce_KEY0|s_debounceCnt~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~23_combout\ = (\debounce_KEY0|Add0~8_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~8_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~23_combout\);

-- Location: FF_X98_Y44_N1
\debounce_KEY0|s_debounceCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~23_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(4));

-- Location: LCCOMB_X98_Y44_N4
\debounce_KEY0|s_debounceCnt~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_debounceCnt~27_combout\ = (\debounce_KEY0|Add0~10_combout\ & \debounce_KEY0|s_debounceCnt[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce_KEY0|Add0~10_combout\,
	datad => \debounce_KEY0|s_debounceCnt[0]~4_combout\,
	combout => \debounce_KEY0|s_debounceCnt~27_combout\);

-- Location: FF_X98_Y44_N5
\debounce_KEY0|s_debounceCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_debounceCnt~27_combout\,
	ena => \debounce_KEY0|s_debounceCnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_debounceCnt\(5));

-- Location: LCCOMB_X96_Y43_N18
\debounce_KEY0|s_pulsedOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~6_combout\ = (!\debounce_KEY0|s_debounceCnt\(22) & (\debounce_KEY0|s_previousIn~q\ & (\debounce_KEY0|s_debounceCnt\(0) & \debounce_KEY0|s_dirtyIn~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(22),
	datab => \debounce_KEY0|s_previousIn~q\,
	datac => \debounce_KEY0|s_debounceCnt\(0),
	datad => \debounce_KEY0|s_dirtyIn~q\,
	combout => \debounce_KEY0|s_pulsedOut~6_combout\);

-- Location: LCCOMB_X96_Y43_N4
\debounce_KEY0|s_pulsedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \debounce_KEY0|s_pulsedOut~7_combout\ = (!\debounce_KEY0|s_debounceCnt\(5) & (\debounce_KEY0|s_pulsedOut~6_combout\ & (\debounce_KEY0|s_pulsedOut~4_combout\ & \debounce_KEY0|s_pulsedOut~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_debounceCnt\(5),
	datab => \debounce_KEY0|s_pulsedOut~6_combout\,
	datac => \debounce_KEY0|s_pulsedOut~4_combout\,
	datad => \debounce_KEY0|s_pulsedOut~5_combout\,
	combout => \debounce_KEY0|s_pulsedOut~7_combout\);

-- Location: FF_X96_Y43_N5
\debounce_KEY0|s_pulsedOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce_KEY0|s_pulsedOut~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce_KEY0|s_pulsedOut~q\);

-- Location: LCCOMB_X79_Y70_N4
\contador_inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~0_combout\ = \contador_inst|data_signal\(0) $ (VCC)
-- \contador_inst|Add0~1\ = CARRY(\contador_inst|data_signal\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \contador_inst|data_signal\(0),
	datad => VCC,
	combout => \contador_inst|Add0~0_combout\,
	cout => \contador_inst|Add0~1\);

-- Location: LCCOMB_X79_Y70_N6
\contador_inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~2_combout\ = (\contador_inst|data_signal\(1) & (!\contador_inst|Add0~1\)) # (!\contador_inst|data_signal\(1) & ((\contador_inst|Add0~1\) # (GND)))
-- \contador_inst|Add0~3\ = CARRY((!\contador_inst|Add0~1\) # (!\contador_inst|data_signal\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal\(1),
	datad => VCC,
	cin => \contador_inst|Add0~1\,
	combout => \contador_inst|Add0~2_combout\,
	cout => \contador_inst|Add0~3\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X79_Y70_N15
\s_sw[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sw(0));

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X79_Y70_N9
\s_sw[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sw(1));

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X79_Y70_N13
\s_sw[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sw(2));

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LCCOMB_X86_Y43_N14
\s_sw[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_sw[3]~feeder_combout\ = \SW[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[3]~input_o\,
	combout => \s_sw[3]~feeder_combout\);

-- Location: FF_X86_Y43_N15
\s_sw[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_sw[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sw(3));

-- Location: FF_X79_Y70_N7
\contador_inst|data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(1));

-- Location: LCCOMB_X77_Y70_N8
\contador_inst|data_out[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_out[2]~feeder_combout\ = \contador_inst|data_signal\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \contador_inst|data_signal\(2),
	combout => \contador_inst|data_out[2]~feeder_combout\);

-- Location: FF_X77_Y70_N9
\contador_inst|data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_out[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(2));

-- Location: LCCOMB_X79_Y70_N8
\contador_inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~4_combout\ = (\contador_inst|data_signal\(2) & (\contador_inst|Add0~3\ $ (GND))) # (!\contador_inst|data_signal\(2) & (!\contador_inst|Add0~3\ & VCC))
-- \contador_inst|Add0~5\ = CARRY((\contador_inst|data_signal\(2) & !\contador_inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_inst|data_signal\(2),
	datad => VCC,
	cin => \contador_inst|Add0~3\,
	combout => \contador_inst|Add0~4_combout\,
	cout => \contador_inst|Add0~5\);

-- Location: LCCOMB_X79_Y70_N10
\contador_inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~6_combout\ = (\contador_inst|data_signal\(3) & (!\contador_inst|Add0~5\)) # (!\contador_inst|data_signal\(3) & ((\contador_inst|Add0~5\) # (GND)))
-- \contador_inst|Add0~7\ = CARRY((!\contador_inst|Add0~5\) # (!\contador_inst|data_signal\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal\(3),
	datad => VCC,
	cin => \contador_inst|Add0~5\,
	combout => \contador_inst|Add0~6_combout\,
	cout => \contador_inst|Add0~7\);

-- Location: LCCOMB_X79_Y70_N12
\contador_inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~8_combout\ = (\contador_inst|data_signal\(4) & (\contador_inst|Add0~7\ $ (GND))) # (!\contador_inst|data_signal\(4) & (!\contador_inst|Add0~7\ & VCC))
-- \contador_inst|Add0~9\ = CARRY((\contador_inst|data_signal\(4) & !\contador_inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal\(4),
	datad => VCC,
	cin => \contador_inst|Add0~7\,
	combout => \contador_inst|Add0~8_combout\,
	cout => \contador_inst|Add0~9\);

-- Location: LCCOMB_X79_Y70_N14
\contador_inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~10_combout\ = (\contador_inst|data_signal\(5) & (!\contador_inst|Add0~9\)) # (!\contador_inst|data_signal\(5) & ((\contador_inst|Add0~9\) # (GND)))
-- \contador_inst|Add0~11\ = CARRY((!\contador_inst|Add0~9\) # (!\contador_inst|data_signal\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_inst|data_signal\(5),
	datad => VCC,
	cin => \contador_inst|Add0~9\,
	combout => \contador_inst|Add0~10_combout\,
	cout => \contador_inst|Add0~11\);

-- Location: LCCOMB_X79_Y70_N16
\contador_inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~12_combout\ = (\contador_inst|data_signal\(6) & (\contador_inst|Add0~11\ $ (GND))) # (!\contador_inst|data_signal\(6) & (!\contador_inst|Add0~11\ & VCC))
-- \contador_inst|Add0~13\ = CARRY((\contador_inst|data_signal\(6) & !\contador_inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_inst|data_signal\(6),
	datad => VCC,
	cin => \contador_inst|Add0~11\,
	combout => \contador_inst|Add0~12_combout\,
	cout => \contador_inst|Add0~13\);

-- Location: LCCOMB_X79_Y70_N18
\contador_inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|Add0~14_combout\ = \contador_inst|Add0~13\ $ (\contador_inst|data_signal\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \contador_inst|data_signal\(7),
	cin => \contador_inst|Add0~13\,
	combout => \contador_inst|Add0~14_combout\);

-- Location: M9K_X78_Y70_N0
\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "RAM_1P_16_8:ram_1p_16_8_inst|altsyncram:memory_rtl_0|altsyncram_ka81:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_width => 4,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => s_sw(12),
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X79_Y70_N28
\contador_inst|data_signal~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~10_combout\ = (\contador_inst|Add0~14_combout\ & ((\contador_inst|data_signal~2_combout\) # ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\ & !\debounce_KEY0|s_pulsedOut~q\)))) # (!\contador_inst|Add0~14_combout\ & 
-- (((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\ & !\debounce_KEY0|s_pulsedOut~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|Add0~14_combout\,
	datab => \contador_inst|data_signal~2_combout\,
	datac => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a7\,
	datad => \debounce_KEY0|s_pulsedOut~q\,
	combout => \contador_inst|data_signal~10_combout\);

-- Location: FF_X79_Y70_N29
\contador_inst|data_signal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(7));

-- Location: FF_X79_Y70_N17
\contador_inst|data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(7),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(7));

-- Location: LCCOMB_X79_Y70_N2
\contador_inst|data_signal~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~9_combout\ = (\contador_inst|Add0~12_combout\ & ((\contador_inst|data_signal~2_combout\) # ((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\)))) # (!\contador_inst|Add0~12_combout\ & 
-- (!\debounce_KEY0|s_pulsedOut~q\ & ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|Add0~12_combout\,
	datab => \debounce_KEY0|s_pulsedOut~q\,
	datac => \contador_inst|data_signal~2_combout\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a6\,
	combout => \contador_inst|data_signal~9_combout\);

-- Location: FF_X79_Y70_N3
\contador_inst|data_signal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(6));

-- Location: FF_X79_Y70_N21
\contador_inst|data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(6));

-- Location: LCCOMB_X79_Y70_N0
\contador_inst|data_signal~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~8_combout\ = (\contador_inst|data_signal~2_combout\ & ((\contador_inst|Add0~10_combout\) # ((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\)))) # 
-- (!\contador_inst|data_signal~2_combout\ & (!\debounce_KEY0|s_pulsedOut~q\ & ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal~2_combout\,
	datab => \debounce_KEY0|s_pulsedOut~q\,
	datac => \contador_inst|Add0~10_combout\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a5\,
	combout => \contador_inst|data_signal~8_combout\);

-- Location: FF_X79_Y70_N1
\contador_inst|data_signal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(5));

-- Location: FF_X79_Y70_N25
\contador_inst|data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(5));

-- Location: LCCOMB_X77_Y70_N0
\contador_inst|data_signal~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~7_combout\ = (\contador_inst|Add0~8_combout\ & ((\contador_inst|data_signal~2_combout\) # ((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\)))) # (!\contador_inst|Add0~8_combout\ & 
-- (!\debounce_KEY0|s_pulsedOut~q\ & ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|Add0~8_combout\,
	datab => \debounce_KEY0|s_pulsedOut~q\,
	datac => \contador_inst|data_signal~2_combout\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a4\,
	combout => \contador_inst|data_signal~7_combout\);

-- Location: FF_X77_Y70_N1
\contador_inst|data_signal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(4));

-- Location: FF_X79_Y70_N5
\contador_inst|data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(4));

-- Location: LCCOMB_X79_Y70_N22
\contador_inst|data_signal~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~6_combout\ = (\contador_inst|Add0~6_combout\ & ((\contador_inst|data_signal~2_combout\) # ((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\)))) # (!\contador_inst|Add0~6_combout\ & 
-- (((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|Add0~6_combout\,
	datab => \contador_inst|data_signal~2_combout\,
	datac => \debounce_KEY0|s_pulsedOut~q\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a3\,
	combout => \contador_inst|data_signal~6_combout\);

-- Location: FF_X79_Y70_N23
\contador_inst|data_signal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(3));

-- Location: FF_X79_Y70_N19
\contador_inst|data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(3));

-- Location: LCCOMB_X79_Y70_N30
\contador_inst|data_signal~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~4_combout\ = (\contador_inst|Add0~2_combout\ & ((\contador_inst|data_signal~2_combout\) # ((!\debounce_KEY0|s_pulsedOut~q\ & \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\)))) # (!\contador_inst|Add0~2_combout\ & 
-- (!\debounce_KEY0|s_pulsedOut~q\ & ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|Add0~2_combout\,
	datab => \debounce_KEY0|s_pulsedOut~q\,
	datac => \contador_inst|data_signal~2_combout\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a1\,
	combout => \contador_inst|data_signal~4_combout\);

-- Location: FF_X79_Y70_N31
\contador_inst|data_signal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(1));

-- Location: LCCOMB_X77_Y70_N18
\contador_inst|data_signal~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~5_combout\ = (\contador_inst|data_signal~2_combout\ & ((\contador_inst|Add0~4_combout\) # ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\ & !\debounce_KEY0|s_pulsedOut~q\)))) # 
-- (!\contador_inst|data_signal~2_combout\ & (((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\ & !\debounce_KEY0|s_pulsedOut~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal~2_combout\,
	datab => \contador_inst|Add0~4_combout\,
	datac => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a2\,
	datad => \debounce_KEY0|s_pulsedOut~q\,
	combout => \contador_inst|data_signal~5_combout\);

-- Location: FF_X77_Y70_N19
\contador_inst|data_signal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(2));

-- Location: LCCOMB_X77_Y70_N30
\contador_inst|data_signal[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal[0]~0_combout\ = (!\contador_inst|data_signal\(0) & (\contador_inst|data_signal\(2) & (\contador_inst|data_signal\(1) & \contador_inst|data_signal\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal\(0),
	datab => \contador_inst|data_signal\(2),
	datac => \contador_inst|data_signal\(1),
	datad => \contador_inst|data_signal\(3),
	combout => \contador_inst|data_signal[0]~0_combout\);

-- Location: LCCOMB_X79_Y70_N24
\contador_inst|data_signal[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal[0]~1_combout\ = (\contador_inst|data_signal\(4) & (\contador_inst|data_signal\(6) & (\contador_inst|data_signal\(5) & \contador_inst|data_signal\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal\(4),
	datab => \contador_inst|data_signal\(6),
	datac => \contador_inst|data_signal\(5),
	datad => \contador_inst|data_signal\(7),
	combout => \contador_inst|data_signal[0]~1_combout\);

-- Location: LCCOMB_X79_Y70_N20
\contador_inst|data_signal~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~2_combout\ = (\debounce_KEY0|s_pulsedOut~q\ & ((!\contador_inst|data_signal[0]~1_combout\) # (!\contador_inst|data_signal[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_inst|data_signal[0]~0_combout\,
	datab => \contador_inst|data_signal[0]~1_combout\,
	datad => \debounce_KEY0|s_pulsedOut~q\,
	combout => \contador_inst|data_signal~2_combout\);

-- Location: LCCOMB_X79_Y70_N26
\contador_inst|data_signal~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador_inst|data_signal~3_combout\ = (\debounce_KEY0|s_pulsedOut~q\ & (\contador_inst|data_signal~2_combout\ & (\contador_inst|Add0~0_combout\))) # (!\debounce_KEY0|s_pulsedOut~q\ & 
-- ((\ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0~portadataout\) # ((\contador_inst|data_signal~2_combout\ & \contador_inst|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce_KEY0|s_pulsedOut~q\,
	datab => \contador_inst|data_signal~2_combout\,
	datac => \contador_inst|Add0~0_combout\,
	datad => \ram_1p_16_8_inst|memory_rtl_0|auto_generated|ram_block1a0~portadataout\,
	combout => \contador_inst|data_signal~3_combout\);

-- Location: FF_X79_Y70_N27
\contador_inst|data_signal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \contador_inst|data_signal~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_signal\(0));

-- Location: FF_X79_Y70_N11
\contador_inst|data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \contador_inst|data_signal\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contador_inst|data_out\(0));

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;
END structure;


