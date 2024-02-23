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

-- DATE "04/11/2023 09:55:50"

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

ENTITY 	ShiftRegister_Demo IS
    PORT (
	SW : IN std_logic_vector(0 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	LEDR : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ShiftRegister_Demo;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ShiftRegister_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \divisor|clkOut~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \divisor|s_Counter[0]~24_combout\ : std_logic;
SIGNAL \divisor|LessThan0~2_combout\ : std_logic;
SIGNAL \divisor|LessThan0~3_combout\ : std_logic;
SIGNAL \divisor|clkOut~1_combout\ : std_logic;
SIGNAL \divisor|clkOut~0_combout\ : std_logic;
SIGNAL \divisor|LessThan0~0_combout\ : std_logic;
SIGNAL \divisor|LessThan0~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~6_combout\ : std_logic;
SIGNAL \divisor|s_Counter[0]~25\ : std_logic;
SIGNAL \divisor|s_Counter[1]~26_combout\ : std_logic;
SIGNAL \divisor|s_Counter[1]~27\ : std_logic;
SIGNAL \divisor|s_Counter[2]~28_combout\ : std_logic;
SIGNAL \divisor|s_Counter[2]~29\ : std_logic;
SIGNAL \divisor|s_Counter[3]~30_combout\ : std_logic;
SIGNAL \divisor|s_Counter[3]~31\ : std_logic;
SIGNAL \divisor|s_Counter[4]~32_combout\ : std_logic;
SIGNAL \divisor|s_Counter[4]~33\ : std_logic;
SIGNAL \divisor|s_Counter[5]~34_combout\ : std_logic;
SIGNAL \divisor|s_Counter[5]~35\ : std_logic;
SIGNAL \divisor|s_Counter[6]~36_combout\ : std_logic;
SIGNAL \divisor|s_Counter[6]~37\ : std_logic;
SIGNAL \divisor|s_Counter[7]~38_combout\ : std_logic;
SIGNAL \divisor|s_Counter[7]~39\ : std_logic;
SIGNAL \divisor|s_Counter[8]~40_combout\ : std_logic;
SIGNAL \divisor|s_Counter[8]~41\ : std_logic;
SIGNAL \divisor|s_Counter[9]~42_combout\ : std_logic;
SIGNAL \divisor|s_Counter[9]~43\ : std_logic;
SIGNAL \divisor|s_Counter[10]~44_combout\ : std_logic;
SIGNAL \divisor|s_Counter[10]~45\ : std_logic;
SIGNAL \divisor|s_Counter[11]~46_combout\ : std_logic;
SIGNAL \divisor|s_Counter[11]~47\ : std_logic;
SIGNAL \divisor|s_Counter[12]~48_combout\ : std_logic;
SIGNAL \divisor|s_Counter[12]~49\ : std_logic;
SIGNAL \divisor|s_Counter[13]~50_combout\ : std_logic;
SIGNAL \divisor|s_Counter[13]~51\ : std_logic;
SIGNAL \divisor|s_Counter[14]~52_combout\ : std_logic;
SIGNAL \divisor|s_Counter[14]~53\ : std_logic;
SIGNAL \divisor|s_Counter[15]~54_combout\ : std_logic;
SIGNAL \divisor|s_Counter[15]~55\ : std_logic;
SIGNAL \divisor|s_Counter[16]~56_combout\ : std_logic;
SIGNAL \divisor|s_Counter[16]~57\ : std_logic;
SIGNAL \divisor|s_Counter[17]~58_combout\ : std_logic;
SIGNAL \divisor|s_Counter[17]~59\ : std_logic;
SIGNAL \divisor|s_Counter[18]~60_combout\ : std_logic;
SIGNAL \divisor|s_Counter[18]~61\ : std_logic;
SIGNAL \divisor|s_Counter[19]~62_combout\ : std_logic;
SIGNAL \divisor|s_Counter[19]~63\ : std_logic;
SIGNAL \divisor|s_Counter[20]~64_combout\ : std_logic;
SIGNAL \divisor|s_Counter[20]~65\ : std_logic;
SIGNAL \divisor|s_Counter[21]~66_combout\ : std_logic;
SIGNAL \divisor|s_Counter[21]~67\ : std_logic;
SIGNAL \divisor|s_Counter[22]~68_combout\ : std_logic;
SIGNAL \divisor|s_Counter[22]~69\ : std_logic;
SIGNAL \divisor|s_Counter[23]~70_combout\ : std_logic;
SIGNAL \divisor|LessThan0~4_combout\ : std_logic;
SIGNAL \divisor|clkOut~2_combout\ : std_logic;
SIGNAL \divisor|LessThan0~5_combout\ : std_logic;
SIGNAL \divisor|clkOut~6_combout\ : std_logic;
SIGNAL \divisor|clkOut~5_combout\ : std_logic;
SIGNAL \divisor|clkOut~3_combout\ : std_logic;
SIGNAL \divisor|clkOut~4_combout\ : std_logic;
SIGNAL \divisor|clkOut~7_combout\ : std_logic;
SIGNAL \divisor|clkOut~8_combout\ : std_logic;
SIGNAL \divisor|clkOut~q\ : std_logic;
SIGNAL \divisor|clkOut~clkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \top_level|aux[1]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[2]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[3]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[4]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[5]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[6]~feeder_combout\ : std_logic;
SIGNAL \top_level|aux[7]~feeder_combout\ : std_logic;
SIGNAL \divisor|s_Counter\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \top_level|aux\ : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\divisor|clkOut~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \divisor|clkOut~q\);
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
	i => \top_level|aux\(0),
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
	i => \top_level|aux\(1),
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
	i => \top_level|aux\(2),
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
	i => \top_level|aux\(3),
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
	i => \top_level|aux\(4),
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
	i => \top_level|aux\(5),
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
	i => \top_level|aux\(6),
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
	i => \top_level|aux\(7),
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

-- Location: LCCOMB_X41_Y57_N8
\divisor|s_Counter[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[0]~24_combout\ = \divisor|s_Counter\(0) $ (VCC)
-- \divisor|s_Counter[0]~25\ = CARRY(\divisor|s_Counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(0),
	datad => VCC,
	combout => \divisor|s_Counter[0]~24_combout\,
	cout => \divisor|s_Counter[0]~25\);

-- Location: LCCOMB_X42_Y57_N30
\divisor|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~2_combout\ = (((!\divisor|s_Counter\(11)) # (!\divisor|s_Counter\(13))) # (!\divisor|s_Counter\(10))) # (!\divisor|s_Counter\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(12),
	datab => \divisor|s_Counter\(10),
	datac => \divisor|s_Counter\(13),
	datad => \divisor|s_Counter\(11),
	combout => \divisor|LessThan0~2_combout\);

-- Location: LCCOMB_X42_Y57_N20
\divisor|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~3_combout\ = (!\divisor|s_Counter\(16) & (!\divisor|s_Counter\(14) & (\divisor|LessThan0~2_combout\ & !\divisor|s_Counter\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(16),
	datab => \divisor|s_Counter\(14),
	datac => \divisor|LessThan0~2_combout\,
	datad => \divisor|s_Counter\(22),
	combout => \divisor|LessThan0~3_combout\);

-- Location: LCCOMB_X41_Y57_N6
\divisor|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~1_combout\ = (!\divisor|s_Counter\(7) & (!\divisor|s_Counter\(5) & (!\divisor|s_Counter\(6) & !\divisor|s_Counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(7),
	datab => \divisor|s_Counter\(5),
	datac => \divisor|s_Counter\(6),
	datad => \divisor|s_Counter\(8),
	combout => \divisor|clkOut~1_combout\);

-- Location: LCCOMB_X41_Y57_N4
\divisor|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~0_combout\ = (\divisor|s_Counter\(1) & (\divisor|s_Counter\(0) & (\divisor|s_Counter\(3) & \divisor|s_Counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(1),
	datab => \divisor|s_Counter\(0),
	datac => \divisor|s_Counter\(3),
	datad => \divisor|s_Counter\(2),
	combout => \divisor|clkOut~0_combout\);

-- Location: LCCOMB_X42_Y57_N6
\divisor|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~0_combout\ = (!\divisor|s_Counter\(16) & (!\divisor|s_Counter\(9) & (!\divisor|s_Counter\(14) & !\divisor|s_Counter\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(16),
	datab => \divisor|s_Counter\(9),
	datac => \divisor|s_Counter\(14),
	datad => \divisor|s_Counter\(22),
	combout => \divisor|LessThan0~0_combout\);

-- Location: LCCOMB_X42_Y57_N0
\divisor|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~1_combout\ = (\divisor|clkOut~1_combout\ & (\divisor|LessThan0~0_combout\ & ((!\divisor|clkOut~0_combout\) # (!\divisor|s_Counter\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(4),
	datab => \divisor|clkOut~1_combout\,
	datac => \divisor|clkOut~0_combout\,
	datad => \divisor|LessThan0~0_combout\,
	combout => \divisor|LessThan0~1_combout\);

-- Location: LCCOMB_X42_Y57_N16
\divisor|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~6_combout\ = (!\divisor|LessThan0~3_combout\ & (!\divisor|LessThan0~5_combout\ & !\divisor|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|LessThan0~3_combout\,
	datac => \divisor|LessThan0~5_combout\,
	datad => \divisor|LessThan0~1_combout\,
	combout => \divisor|LessThan0~6_combout\);

-- Location: FF_X41_Y57_N9
\divisor|s_Counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[0]~24_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(0));

-- Location: LCCOMB_X41_Y57_N10
\divisor|s_Counter[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[1]~26_combout\ = (\divisor|s_Counter\(1) & (!\divisor|s_Counter[0]~25\)) # (!\divisor|s_Counter\(1) & ((\divisor|s_Counter[0]~25\) # (GND)))
-- \divisor|s_Counter[1]~27\ = CARRY((!\divisor|s_Counter[0]~25\) # (!\divisor|s_Counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(1),
	datad => VCC,
	cin => \divisor|s_Counter[0]~25\,
	combout => \divisor|s_Counter[1]~26_combout\,
	cout => \divisor|s_Counter[1]~27\);

-- Location: FF_X41_Y57_N11
\divisor|s_Counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[1]~26_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(1));

-- Location: LCCOMB_X41_Y57_N12
\divisor|s_Counter[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[2]~28_combout\ = (\divisor|s_Counter\(2) & (\divisor|s_Counter[1]~27\ $ (GND))) # (!\divisor|s_Counter\(2) & (!\divisor|s_Counter[1]~27\ & VCC))
-- \divisor|s_Counter[2]~29\ = CARRY((\divisor|s_Counter\(2) & !\divisor|s_Counter[1]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(2),
	datad => VCC,
	cin => \divisor|s_Counter[1]~27\,
	combout => \divisor|s_Counter[2]~28_combout\,
	cout => \divisor|s_Counter[2]~29\);

-- Location: FF_X41_Y57_N13
\divisor|s_Counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[2]~28_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(2));

-- Location: LCCOMB_X41_Y57_N14
\divisor|s_Counter[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[3]~30_combout\ = (\divisor|s_Counter\(3) & (!\divisor|s_Counter[2]~29\)) # (!\divisor|s_Counter\(3) & ((\divisor|s_Counter[2]~29\) # (GND)))
-- \divisor|s_Counter[3]~31\ = CARRY((!\divisor|s_Counter[2]~29\) # (!\divisor|s_Counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(3),
	datad => VCC,
	cin => \divisor|s_Counter[2]~29\,
	combout => \divisor|s_Counter[3]~30_combout\,
	cout => \divisor|s_Counter[3]~31\);

-- Location: FF_X41_Y57_N15
\divisor|s_Counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[3]~30_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(3));

-- Location: LCCOMB_X41_Y57_N16
\divisor|s_Counter[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[4]~32_combout\ = (\divisor|s_Counter\(4) & (\divisor|s_Counter[3]~31\ $ (GND))) # (!\divisor|s_Counter\(4) & (!\divisor|s_Counter[3]~31\ & VCC))
-- \divisor|s_Counter[4]~33\ = CARRY((\divisor|s_Counter\(4) & !\divisor|s_Counter[3]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(4),
	datad => VCC,
	cin => \divisor|s_Counter[3]~31\,
	combout => \divisor|s_Counter[4]~32_combout\,
	cout => \divisor|s_Counter[4]~33\);

-- Location: FF_X41_Y57_N17
\divisor|s_Counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[4]~32_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(4));

-- Location: LCCOMB_X41_Y57_N18
\divisor|s_Counter[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[5]~34_combout\ = (\divisor|s_Counter\(5) & (!\divisor|s_Counter[4]~33\)) # (!\divisor|s_Counter\(5) & ((\divisor|s_Counter[4]~33\) # (GND)))
-- \divisor|s_Counter[5]~35\ = CARRY((!\divisor|s_Counter[4]~33\) # (!\divisor|s_Counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(5),
	datad => VCC,
	cin => \divisor|s_Counter[4]~33\,
	combout => \divisor|s_Counter[5]~34_combout\,
	cout => \divisor|s_Counter[5]~35\);

-- Location: FF_X41_Y57_N19
\divisor|s_Counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[5]~34_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(5));

-- Location: LCCOMB_X41_Y57_N20
\divisor|s_Counter[6]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[6]~36_combout\ = (\divisor|s_Counter\(6) & (\divisor|s_Counter[5]~35\ $ (GND))) # (!\divisor|s_Counter\(6) & (!\divisor|s_Counter[5]~35\ & VCC))
-- \divisor|s_Counter[6]~37\ = CARRY((\divisor|s_Counter\(6) & !\divisor|s_Counter[5]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(6),
	datad => VCC,
	cin => \divisor|s_Counter[5]~35\,
	combout => \divisor|s_Counter[6]~36_combout\,
	cout => \divisor|s_Counter[6]~37\);

-- Location: FF_X41_Y57_N21
\divisor|s_Counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[6]~36_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(6));

-- Location: LCCOMB_X41_Y57_N22
\divisor|s_Counter[7]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[7]~38_combout\ = (\divisor|s_Counter\(7) & (!\divisor|s_Counter[6]~37\)) # (!\divisor|s_Counter\(7) & ((\divisor|s_Counter[6]~37\) # (GND)))
-- \divisor|s_Counter[7]~39\ = CARRY((!\divisor|s_Counter[6]~37\) # (!\divisor|s_Counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(7),
	datad => VCC,
	cin => \divisor|s_Counter[6]~37\,
	combout => \divisor|s_Counter[7]~38_combout\,
	cout => \divisor|s_Counter[7]~39\);

-- Location: FF_X41_Y57_N23
\divisor|s_Counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[7]~38_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(7));

-- Location: LCCOMB_X41_Y57_N24
\divisor|s_Counter[8]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[8]~40_combout\ = (\divisor|s_Counter\(8) & (\divisor|s_Counter[7]~39\ $ (GND))) # (!\divisor|s_Counter\(8) & (!\divisor|s_Counter[7]~39\ & VCC))
-- \divisor|s_Counter[8]~41\ = CARRY((\divisor|s_Counter\(8) & !\divisor|s_Counter[7]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(8),
	datad => VCC,
	cin => \divisor|s_Counter[7]~39\,
	combout => \divisor|s_Counter[8]~40_combout\,
	cout => \divisor|s_Counter[8]~41\);

-- Location: FF_X41_Y57_N25
\divisor|s_Counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[8]~40_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(8));

-- Location: LCCOMB_X41_Y57_N26
\divisor|s_Counter[9]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[9]~42_combout\ = (\divisor|s_Counter\(9) & (!\divisor|s_Counter[8]~41\)) # (!\divisor|s_Counter\(9) & ((\divisor|s_Counter[8]~41\) # (GND)))
-- \divisor|s_Counter[9]~43\ = CARRY((!\divisor|s_Counter[8]~41\) # (!\divisor|s_Counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(9),
	datad => VCC,
	cin => \divisor|s_Counter[8]~41\,
	combout => \divisor|s_Counter[9]~42_combout\,
	cout => \divisor|s_Counter[9]~43\);

-- Location: FF_X41_Y57_N27
\divisor|s_Counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[9]~42_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(9));

-- Location: LCCOMB_X41_Y57_N28
\divisor|s_Counter[10]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[10]~44_combout\ = (\divisor|s_Counter\(10) & (\divisor|s_Counter[9]~43\ $ (GND))) # (!\divisor|s_Counter\(10) & (!\divisor|s_Counter[9]~43\ & VCC))
-- \divisor|s_Counter[10]~45\ = CARRY((\divisor|s_Counter\(10) & !\divisor|s_Counter[9]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(10),
	datad => VCC,
	cin => \divisor|s_Counter[9]~43\,
	combout => \divisor|s_Counter[10]~44_combout\,
	cout => \divisor|s_Counter[10]~45\);

-- Location: FF_X41_Y57_N29
\divisor|s_Counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[10]~44_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(10));

-- Location: LCCOMB_X41_Y57_N30
\divisor|s_Counter[11]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[11]~46_combout\ = (\divisor|s_Counter\(11) & (!\divisor|s_Counter[10]~45\)) # (!\divisor|s_Counter\(11) & ((\divisor|s_Counter[10]~45\) # (GND)))
-- \divisor|s_Counter[11]~47\ = CARRY((!\divisor|s_Counter[10]~45\) # (!\divisor|s_Counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(11),
	datad => VCC,
	cin => \divisor|s_Counter[10]~45\,
	combout => \divisor|s_Counter[11]~46_combout\,
	cout => \divisor|s_Counter[11]~47\);

-- Location: FF_X41_Y57_N31
\divisor|s_Counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[11]~46_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(11));

-- Location: LCCOMB_X41_Y56_N0
\divisor|s_Counter[12]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[12]~48_combout\ = (\divisor|s_Counter\(12) & (\divisor|s_Counter[11]~47\ $ (GND))) # (!\divisor|s_Counter\(12) & (!\divisor|s_Counter[11]~47\ & VCC))
-- \divisor|s_Counter[12]~49\ = CARRY((\divisor|s_Counter\(12) & !\divisor|s_Counter[11]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(12),
	datad => VCC,
	cin => \divisor|s_Counter[11]~47\,
	combout => \divisor|s_Counter[12]~48_combout\,
	cout => \divisor|s_Counter[12]~49\);

-- Location: FF_X42_Y57_N13
\divisor|s_Counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \divisor|s_Counter[12]~48_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(12));

-- Location: LCCOMB_X41_Y56_N2
\divisor|s_Counter[13]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[13]~50_combout\ = (\divisor|s_Counter\(13) & (!\divisor|s_Counter[12]~49\)) # (!\divisor|s_Counter\(13) & ((\divisor|s_Counter[12]~49\) # (GND)))
-- \divisor|s_Counter[13]~51\ = CARRY((!\divisor|s_Counter[12]~49\) # (!\divisor|s_Counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(13),
	datad => VCC,
	cin => \divisor|s_Counter[12]~49\,
	combout => \divisor|s_Counter[13]~50_combout\,
	cout => \divisor|s_Counter[13]~51\);

-- Location: FF_X42_Y57_N23
\divisor|s_Counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \divisor|s_Counter[13]~50_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(13));

-- Location: LCCOMB_X41_Y56_N4
\divisor|s_Counter[14]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[14]~52_combout\ = (\divisor|s_Counter\(14) & (\divisor|s_Counter[13]~51\ $ (GND))) # (!\divisor|s_Counter\(14) & (!\divisor|s_Counter[13]~51\ & VCC))
-- \divisor|s_Counter[14]~53\ = CARRY((\divisor|s_Counter\(14) & !\divisor|s_Counter[13]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(14),
	datad => VCC,
	cin => \divisor|s_Counter[13]~51\,
	combout => \divisor|s_Counter[14]~52_combout\,
	cout => \divisor|s_Counter[14]~53\);

-- Location: FF_X41_Y56_N5
\divisor|s_Counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[14]~52_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(14));

-- Location: LCCOMB_X41_Y56_N6
\divisor|s_Counter[15]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[15]~54_combout\ = (\divisor|s_Counter\(15) & (!\divisor|s_Counter[14]~53\)) # (!\divisor|s_Counter\(15) & ((\divisor|s_Counter[14]~53\) # (GND)))
-- \divisor|s_Counter[15]~55\ = CARRY((!\divisor|s_Counter[14]~53\) # (!\divisor|s_Counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(15),
	datad => VCC,
	cin => \divisor|s_Counter[14]~53\,
	combout => \divisor|s_Counter[15]~54_combout\,
	cout => \divisor|s_Counter[15]~55\);

-- Location: FF_X41_Y56_N7
\divisor|s_Counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[15]~54_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(15));

-- Location: LCCOMB_X41_Y56_N8
\divisor|s_Counter[16]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[16]~56_combout\ = (\divisor|s_Counter\(16) & (\divisor|s_Counter[15]~55\ $ (GND))) # (!\divisor|s_Counter\(16) & (!\divisor|s_Counter[15]~55\ & VCC))
-- \divisor|s_Counter[16]~57\ = CARRY((\divisor|s_Counter\(16) & !\divisor|s_Counter[15]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(16),
	datad => VCC,
	cin => \divisor|s_Counter[15]~55\,
	combout => \divisor|s_Counter[16]~56_combout\,
	cout => \divisor|s_Counter[16]~57\);

-- Location: FF_X41_Y56_N9
\divisor|s_Counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[16]~56_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(16));

-- Location: LCCOMB_X41_Y56_N10
\divisor|s_Counter[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[17]~58_combout\ = (\divisor|s_Counter\(17) & (!\divisor|s_Counter[16]~57\)) # (!\divisor|s_Counter\(17) & ((\divisor|s_Counter[16]~57\) # (GND)))
-- \divisor|s_Counter[17]~59\ = CARRY((!\divisor|s_Counter[16]~57\) # (!\divisor|s_Counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(17),
	datad => VCC,
	cin => \divisor|s_Counter[16]~57\,
	combout => \divisor|s_Counter[17]~58_combout\,
	cout => \divisor|s_Counter[17]~59\);

-- Location: FF_X41_Y56_N11
\divisor|s_Counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[17]~58_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(17));

-- Location: LCCOMB_X41_Y56_N12
\divisor|s_Counter[18]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[18]~60_combout\ = (\divisor|s_Counter\(18) & (\divisor|s_Counter[17]~59\ $ (GND))) # (!\divisor|s_Counter\(18) & (!\divisor|s_Counter[17]~59\ & VCC))
-- \divisor|s_Counter[18]~61\ = CARRY((\divisor|s_Counter\(18) & !\divisor|s_Counter[17]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(18),
	datad => VCC,
	cin => \divisor|s_Counter[17]~59\,
	combout => \divisor|s_Counter[18]~60_combout\,
	cout => \divisor|s_Counter[18]~61\);

-- Location: FF_X41_Y56_N13
\divisor|s_Counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[18]~60_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(18));

-- Location: LCCOMB_X41_Y56_N14
\divisor|s_Counter[19]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[19]~62_combout\ = (\divisor|s_Counter\(19) & (!\divisor|s_Counter[18]~61\)) # (!\divisor|s_Counter\(19) & ((\divisor|s_Counter[18]~61\) # (GND)))
-- \divisor|s_Counter[19]~63\ = CARRY((!\divisor|s_Counter[18]~61\) # (!\divisor|s_Counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(19),
	datad => VCC,
	cin => \divisor|s_Counter[18]~61\,
	combout => \divisor|s_Counter[19]~62_combout\,
	cout => \divisor|s_Counter[19]~63\);

-- Location: FF_X41_Y56_N15
\divisor|s_Counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[19]~62_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(19));

-- Location: LCCOMB_X41_Y56_N16
\divisor|s_Counter[20]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[20]~64_combout\ = (\divisor|s_Counter\(20) & (\divisor|s_Counter[19]~63\ $ (GND))) # (!\divisor|s_Counter\(20) & (!\divisor|s_Counter[19]~63\ & VCC))
-- \divisor|s_Counter[20]~65\ = CARRY((\divisor|s_Counter\(20) & !\divisor|s_Counter[19]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(20),
	datad => VCC,
	cin => \divisor|s_Counter[19]~63\,
	combout => \divisor|s_Counter[20]~64_combout\,
	cout => \divisor|s_Counter[20]~65\);

-- Location: FF_X41_Y56_N17
\divisor|s_Counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[20]~64_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(20));

-- Location: LCCOMB_X41_Y56_N18
\divisor|s_Counter[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[21]~66_combout\ = (\divisor|s_Counter\(21) & (!\divisor|s_Counter[20]~65\)) # (!\divisor|s_Counter\(21) & ((\divisor|s_Counter[20]~65\) # (GND)))
-- \divisor|s_Counter[21]~67\ = CARRY((!\divisor|s_Counter[20]~65\) # (!\divisor|s_Counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(21),
	datad => VCC,
	cin => \divisor|s_Counter[20]~65\,
	combout => \divisor|s_Counter[21]~66_combout\,
	cout => \divisor|s_Counter[21]~67\);

-- Location: FF_X41_Y56_N19
\divisor|s_Counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[21]~66_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(21));

-- Location: LCCOMB_X41_Y56_N20
\divisor|s_Counter[22]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[22]~68_combout\ = (\divisor|s_Counter\(22) & (\divisor|s_Counter[21]~67\ $ (GND))) # (!\divisor|s_Counter\(22) & (!\divisor|s_Counter[21]~67\ & VCC))
-- \divisor|s_Counter[22]~69\ = CARRY((\divisor|s_Counter\(22) & !\divisor|s_Counter[21]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_Counter\(22),
	datad => VCC,
	cin => \divisor|s_Counter[21]~67\,
	combout => \divisor|s_Counter[22]~68_combout\,
	cout => \divisor|s_Counter[22]~69\);

-- Location: FF_X41_Y56_N21
\divisor|s_Counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[22]~68_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(22));

-- Location: LCCOMB_X41_Y56_N22
\divisor|s_Counter[23]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_Counter[23]~70_combout\ = \divisor|s_Counter\(23) $ (\divisor|s_Counter[22]~69\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(23),
	cin => \divisor|s_Counter[22]~69\,
	combout => \divisor|s_Counter[23]~70_combout\);

-- Location: FF_X41_Y56_N23
\divisor|s_Counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_Counter[23]~70_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_Counter\(23));

-- Location: LCCOMB_X41_Y56_N24
\divisor|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~4_combout\ = ((!\divisor|s_Counter\(15) & !\divisor|s_Counter\(16))) # (!\divisor|s_Counter\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(15),
	datac => \divisor|s_Counter\(16),
	datad => \divisor|s_Counter\(21),
	combout => \divisor|LessThan0~4_combout\);

-- Location: LCCOMB_X41_Y56_N28
\divisor|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~2_combout\ = (\divisor|s_Counter\(18) & (\divisor|s_Counter\(19) & (\divisor|s_Counter\(17) & \divisor|s_Counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(18),
	datab => \divisor|s_Counter\(19),
	datac => \divisor|s_Counter\(17),
	datad => \divisor|s_Counter\(20),
	combout => \divisor|clkOut~2_combout\);

-- Location: LCCOMB_X42_Y57_N26
\divisor|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~5_combout\ = ((!\divisor|s_Counter\(22) & ((\divisor|LessThan0~4_combout\) # (!\divisor|clkOut~2_combout\)))) # (!\divisor|s_Counter\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(23),
	datab => \divisor|s_Counter\(22),
	datac => \divisor|LessThan0~4_combout\,
	datad => \divisor|clkOut~2_combout\,
	combout => \divisor|LessThan0~5_combout\);

-- Location: LCCOMB_X41_Y56_N30
\divisor|clkOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~6_combout\ = (!\divisor|s_Counter\(23) & (\divisor|s_Counter\(22) & (\divisor|s_Counter\(16) & !\divisor|s_Counter\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(23),
	datab => \divisor|s_Counter\(22),
	datac => \divisor|s_Counter\(16),
	datad => \divisor|s_Counter\(21),
	combout => \divisor|clkOut~6_combout\);

-- Location: LCCOMB_X42_Y57_N4
\divisor|clkOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~5_combout\ = (\divisor|s_Counter\(9) & (!\divisor|s_Counter\(13) & (\divisor|s_Counter\(14) & !\divisor|s_Counter\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(9),
	datab => \divisor|s_Counter\(13),
	datac => \divisor|s_Counter\(14),
	datad => \divisor|s_Counter\(15),
	combout => \divisor|clkOut~5_combout\);

-- Location: LCCOMB_X42_Y57_N24
\divisor|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~3_combout\ = (!\divisor|s_Counter\(4) & (\divisor|s_Counter\(11) & (\divisor|s_Counter\(10) & \divisor|s_Counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_Counter\(4),
	datab => \divisor|s_Counter\(11),
	datac => \divisor|s_Counter\(10),
	datad => \divisor|s_Counter\(12),
	combout => \divisor|clkOut~3_combout\);

-- Location: LCCOMB_X42_Y57_N18
\divisor|clkOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~4_combout\ = (\divisor|clkOut~0_combout\ & (\divisor|clkOut~3_combout\ & (\divisor|clkOut~1_combout\ & \divisor|clkOut~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkOut~0_combout\,
	datab => \divisor|clkOut~3_combout\,
	datac => \divisor|clkOut~1_combout\,
	datad => \divisor|clkOut~2_combout\,
	combout => \divisor|clkOut~4_combout\);

-- Location: LCCOMB_X43_Y57_N8
\divisor|clkOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~7_combout\ = (\divisor|clkOut~q\) # ((\divisor|clkOut~6_combout\ & (\divisor|clkOut~5_combout\ & \divisor|clkOut~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkOut~6_combout\,
	datab => \divisor|clkOut~5_combout\,
	datac => \divisor|clkOut~q\,
	datad => \divisor|clkOut~4_combout\,
	combout => \divisor|clkOut~7_combout\);

-- Location: LCCOMB_X43_Y57_N6
\divisor|clkOut~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkOut~8_combout\ = (\divisor|clkOut~7_combout\ & ((\divisor|LessThan0~5_combout\) # ((\divisor|LessThan0~3_combout\) # (\divisor|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~5_combout\,
	datab => \divisor|LessThan0~3_combout\,
	datac => \divisor|LessThan0~1_combout\,
	datad => \divisor|clkOut~7_combout\,
	combout => \divisor|clkOut~8_combout\);

-- Location: FF_X43_Y57_N7
\divisor|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|clkOut~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|clkOut~q\);

-- Location: CLKCTRL_G11
\divisor|clkOut~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \divisor|clkOut~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \divisor|clkOut~clkctrl_outclk\);

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

-- Location: FF_X88_Y72_N21
\top_level|aux[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(0));

-- Location: LCCOMB_X88_Y72_N18
\top_level|aux[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[1]~feeder_combout\ = \top_level|aux\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(0),
	combout => \top_level|aux[1]~feeder_combout\);

-- Location: FF_X88_Y72_N19
\top_level|aux[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(1));

-- Location: LCCOMB_X88_Y72_N16
\top_level|aux[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[2]~feeder_combout\ = \top_level|aux\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(1),
	combout => \top_level|aux[2]~feeder_combout\);

-- Location: FF_X88_Y72_N17
\top_level|aux[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(2));

-- Location: LCCOMB_X88_Y72_N6
\top_level|aux[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[3]~feeder_combout\ = \top_level|aux\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(2),
	combout => \top_level|aux[3]~feeder_combout\);

-- Location: FF_X88_Y72_N7
\top_level|aux[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(3));

-- Location: LCCOMB_X88_Y72_N0
\top_level|aux[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[4]~feeder_combout\ = \top_level|aux\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(3),
	combout => \top_level|aux[4]~feeder_combout\);

-- Location: FF_X88_Y72_N1
\top_level|aux[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(4));

-- Location: LCCOMB_X88_Y72_N2
\top_level|aux[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[5]~feeder_combout\ = \top_level|aux\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(4),
	combout => \top_level|aux[5]~feeder_combout\);

-- Location: FF_X88_Y72_N3
\top_level|aux[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(5));

-- Location: LCCOMB_X88_Y72_N28
\top_level|aux[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[6]~feeder_combout\ = \top_level|aux\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(5),
	combout => \top_level|aux[6]~feeder_combout\);

-- Location: FF_X88_Y72_N29
\top_level|aux[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(6));

-- Location: LCCOMB_X88_Y72_N22
\top_level|aux[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|aux[7]~feeder_combout\ = \top_level|aux\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|aux\(6),
	combout => \top_level|aux[7]~feeder_combout\);

-- Location: FF_X88_Y72_N23
\top_level|aux[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkOut~clkctrl_outclk\,
	d => \top_level|aux[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|aux\(7));

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;
END structure;


