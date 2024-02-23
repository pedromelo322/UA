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

-- DATE "05/23/2023 18:15:31"

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

ENTITY 	ROM_Demo IS
    PORT (
	LEDR : OUT std_logic_vector(3 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(0 DOWNTO 0)
	);
END ROM_Demo;

-- Design Ports Information
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ROM_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst5|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst5|counter[0]~32_combout\ : std_logic;
SIGNAL \inst5|counter[0]~33\ : std_logic;
SIGNAL \inst5|counter[1]~34_combout\ : std_logic;
SIGNAL \inst5|counter[1]~35\ : std_logic;
SIGNAL \inst5|counter[2]~36_combout\ : std_logic;
SIGNAL \inst5|counter[2]~37\ : std_logic;
SIGNAL \inst5|counter[3]~38_combout\ : std_logic;
SIGNAL \inst5|counter[3]~39\ : std_logic;
SIGNAL \inst5|counter[4]~40_combout\ : std_logic;
SIGNAL \inst5|counter[4]~41\ : std_logic;
SIGNAL \inst5|counter[5]~42_combout\ : std_logic;
SIGNAL \inst5|counter[5]~43\ : std_logic;
SIGNAL \inst5|counter[6]~44_combout\ : std_logic;
SIGNAL \inst5|counter[6]~45\ : std_logic;
SIGNAL \inst5|counter[7]~46_combout\ : std_logic;
SIGNAL \inst5|counter[7]~47\ : std_logic;
SIGNAL \inst5|counter[8]~48_combout\ : std_logic;
SIGNAL \inst5|counter[8]~49\ : std_logic;
SIGNAL \inst5|counter[9]~50_combout\ : std_logic;
SIGNAL \inst5|counter[9]~51\ : std_logic;
SIGNAL \inst5|counter[10]~52_combout\ : std_logic;
SIGNAL \inst5|counter[10]~53\ : std_logic;
SIGNAL \inst5|counter[11]~54_combout\ : std_logic;
SIGNAL \inst5|counter[11]~55\ : std_logic;
SIGNAL \inst5|counter[12]~56_combout\ : std_logic;
SIGNAL \inst5|counter[12]~57\ : std_logic;
SIGNAL \inst5|counter[13]~58_combout\ : std_logic;
SIGNAL \inst5|counter[13]~59\ : std_logic;
SIGNAL \inst5|counter[14]~60_combout\ : std_logic;
SIGNAL \inst5|counter[14]~61\ : std_logic;
SIGNAL \inst5|counter[15]~62_combout\ : std_logic;
SIGNAL \inst5|counter[15]~63\ : std_logic;
SIGNAL \inst5|counter[16]~64_combout\ : std_logic;
SIGNAL \inst5|counter[16]~65\ : std_logic;
SIGNAL \inst5|counter[17]~66_combout\ : std_logic;
SIGNAL \inst5|counter[17]~67\ : std_logic;
SIGNAL \inst5|counter[18]~68_combout\ : std_logic;
SIGNAL \inst5|counter[18]~69\ : std_logic;
SIGNAL \inst5|counter[19]~70_combout\ : std_logic;
SIGNAL \inst5|counter[19]~71\ : std_logic;
SIGNAL \inst5|counter[20]~72_combout\ : std_logic;
SIGNAL \inst5|counter[20]~73\ : std_logic;
SIGNAL \inst5|counter[21]~74_combout\ : std_logic;
SIGNAL \inst5|counter[21]~75\ : std_logic;
SIGNAL \inst5|counter[22]~76_combout\ : std_logic;
SIGNAL \inst5|counter[22]~77\ : std_logic;
SIGNAL \inst5|counter[23]~78_combout\ : std_logic;
SIGNAL \inst5|counter[23]~79\ : std_logic;
SIGNAL \inst5|counter[24]~80_combout\ : std_logic;
SIGNAL \inst5|counter[24]~81\ : std_logic;
SIGNAL \inst5|counter[25]~82_combout\ : std_logic;
SIGNAL \inst5|counter[25]~83\ : std_logic;
SIGNAL \inst5|counter[26]~84_combout\ : std_logic;
SIGNAL \inst5|counter[26]~85\ : std_logic;
SIGNAL \inst5|counter[27]~86_combout\ : std_logic;
SIGNAL \inst5|counter[27]~87\ : std_logic;
SIGNAL \inst5|counter[28]~88_combout\ : std_logic;
SIGNAL \inst5|counter[28]~89\ : std_logic;
SIGNAL \inst5|counter[29]~90_combout\ : std_logic;
SIGNAL \inst5|counter[29]~91\ : std_logic;
SIGNAL \inst5|counter[30]~92_combout\ : std_logic;
SIGNAL \inst5|counter[30]~93\ : std_logic;
SIGNAL \inst5|counter[31]~94_combout\ : std_logic;
SIGNAL \inst5|LessThan0~0_combout\ : std_logic;
SIGNAL \inst5|LessThan0~1_combout\ : std_logic;
SIGNAL \inst5|LessThan0~5_combout\ : std_logic;
SIGNAL \inst5|LessThan0~4_combout\ : std_logic;
SIGNAL \inst5|LessThan0~6_combout\ : std_logic;
SIGNAL \inst5|LessThan0~2_combout\ : std_logic;
SIGNAL \inst5|LessThan0~3_combout\ : std_logic;
SIGNAL \inst5|LessThan0~7_combout\ : std_logic;
SIGNAL \inst5|LessThan0~8_combout\ : std_logic;
SIGNAL \inst5|pulse~feeder_combout\ : std_logic;
SIGNAL \inst5|pulse~q\ : std_logic;
SIGNAL \inst5|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst2|internal_count[0]~4_combout\ : std_logic;
SIGNAL \inst2|internal_count[1]~3_combout\ : std_logic;
SIGNAL \inst2|internal_count[2]~2_combout\ : std_logic;
SIGNAL \inst2|internal_count[3]~0_combout\ : std_logic;
SIGNAL \inst2|internal_count[3]~1_combout\ : std_logic;
SIGNAL \inst5|counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst2|internal_count\ : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

LEDR <= ww_LEDR;
ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\inst5|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst5|pulse~q\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|internal_count\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|internal_count\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|internal_count\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|internal_count\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

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

-- Location: LCCOMB_X42_Y47_N0
\inst5|counter[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[0]~32_combout\ = \inst5|counter\(0) $ (VCC)
-- \inst5|counter[0]~33\ = CARRY(\inst5|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(0),
	datad => VCC,
	combout => \inst5|counter[0]~32_combout\,
	cout => \inst5|counter[0]~33\);

-- Location: FF_X42_Y47_N1
\inst5|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[0]~32_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(0));

-- Location: LCCOMB_X42_Y47_N2
\inst5|counter[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[1]~34_combout\ = (\inst5|counter\(1) & (!\inst5|counter[0]~33\)) # (!\inst5|counter\(1) & ((\inst5|counter[0]~33\) # (GND)))
-- \inst5|counter[1]~35\ = CARRY((!\inst5|counter[0]~33\) # (!\inst5|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(1),
	datad => VCC,
	cin => \inst5|counter[0]~33\,
	combout => \inst5|counter[1]~34_combout\,
	cout => \inst5|counter[1]~35\);

-- Location: FF_X42_Y47_N3
\inst5|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[1]~34_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(1));

-- Location: LCCOMB_X42_Y47_N4
\inst5|counter[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[2]~36_combout\ = (\inst5|counter\(2) & (\inst5|counter[1]~35\ $ (GND))) # (!\inst5|counter\(2) & (!\inst5|counter[1]~35\ & VCC))
-- \inst5|counter[2]~37\ = CARRY((\inst5|counter\(2) & !\inst5|counter[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(2),
	datad => VCC,
	cin => \inst5|counter[1]~35\,
	combout => \inst5|counter[2]~36_combout\,
	cout => \inst5|counter[2]~37\);

-- Location: FF_X42_Y47_N5
\inst5|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[2]~36_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(2));

-- Location: LCCOMB_X42_Y47_N6
\inst5|counter[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[3]~38_combout\ = (\inst5|counter\(3) & (!\inst5|counter[2]~37\)) # (!\inst5|counter\(3) & ((\inst5|counter[2]~37\) # (GND)))
-- \inst5|counter[3]~39\ = CARRY((!\inst5|counter[2]~37\) # (!\inst5|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(3),
	datad => VCC,
	cin => \inst5|counter[2]~37\,
	combout => \inst5|counter[3]~38_combout\,
	cout => \inst5|counter[3]~39\);

-- Location: FF_X42_Y47_N7
\inst5|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[3]~38_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(3));

-- Location: LCCOMB_X42_Y47_N8
\inst5|counter[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[4]~40_combout\ = (\inst5|counter\(4) & (\inst5|counter[3]~39\ $ (GND))) # (!\inst5|counter\(4) & (!\inst5|counter[3]~39\ & VCC))
-- \inst5|counter[4]~41\ = CARRY((\inst5|counter\(4) & !\inst5|counter[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(4),
	datad => VCC,
	cin => \inst5|counter[3]~39\,
	combout => \inst5|counter[4]~40_combout\,
	cout => \inst5|counter[4]~41\);

-- Location: FF_X42_Y47_N9
\inst5|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[4]~40_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(4));

-- Location: LCCOMB_X42_Y47_N10
\inst5|counter[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[5]~42_combout\ = (\inst5|counter\(5) & (!\inst5|counter[4]~41\)) # (!\inst5|counter\(5) & ((\inst5|counter[4]~41\) # (GND)))
-- \inst5|counter[5]~43\ = CARRY((!\inst5|counter[4]~41\) # (!\inst5|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(5),
	datad => VCC,
	cin => \inst5|counter[4]~41\,
	combout => \inst5|counter[5]~42_combout\,
	cout => \inst5|counter[5]~43\);

-- Location: FF_X42_Y47_N11
\inst5|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[5]~42_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(5));

-- Location: LCCOMB_X42_Y47_N12
\inst5|counter[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[6]~44_combout\ = (\inst5|counter\(6) & (\inst5|counter[5]~43\ $ (GND))) # (!\inst5|counter\(6) & (!\inst5|counter[5]~43\ & VCC))
-- \inst5|counter[6]~45\ = CARRY((\inst5|counter\(6) & !\inst5|counter[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(6),
	datad => VCC,
	cin => \inst5|counter[5]~43\,
	combout => \inst5|counter[6]~44_combout\,
	cout => \inst5|counter[6]~45\);

-- Location: FF_X42_Y47_N13
\inst5|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[6]~44_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(6));

-- Location: LCCOMB_X42_Y47_N14
\inst5|counter[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[7]~46_combout\ = (\inst5|counter\(7) & (!\inst5|counter[6]~45\)) # (!\inst5|counter\(7) & ((\inst5|counter[6]~45\) # (GND)))
-- \inst5|counter[7]~47\ = CARRY((!\inst5|counter[6]~45\) # (!\inst5|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(7),
	datad => VCC,
	cin => \inst5|counter[6]~45\,
	combout => \inst5|counter[7]~46_combout\,
	cout => \inst5|counter[7]~47\);

-- Location: FF_X42_Y47_N15
\inst5|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[7]~46_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(7));

-- Location: LCCOMB_X42_Y47_N16
\inst5|counter[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[8]~48_combout\ = (\inst5|counter\(8) & (\inst5|counter[7]~47\ $ (GND))) # (!\inst5|counter\(8) & (!\inst5|counter[7]~47\ & VCC))
-- \inst5|counter[8]~49\ = CARRY((\inst5|counter\(8) & !\inst5|counter[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(8),
	datad => VCC,
	cin => \inst5|counter[7]~47\,
	combout => \inst5|counter[8]~48_combout\,
	cout => \inst5|counter[8]~49\);

-- Location: FF_X42_Y47_N17
\inst5|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[8]~48_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(8));

-- Location: LCCOMB_X42_Y47_N18
\inst5|counter[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[9]~50_combout\ = (\inst5|counter\(9) & (!\inst5|counter[8]~49\)) # (!\inst5|counter\(9) & ((\inst5|counter[8]~49\) # (GND)))
-- \inst5|counter[9]~51\ = CARRY((!\inst5|counter[8]~49\) # (!\inst5|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(9),
	datad => VCC,
	cin => \inst5|counter[8]~49\,
	combout => \inst5|counter[9]~50_combout\,
	cout => \inst5|counter[9]~51\);

-- Location: FF_X42_Y47_N19
\inst5|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[9]~50_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(9));

-- Location: LCCOMB_X42_Y47_N20
\inst5|counter[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[10]~52_combout\ = (\inst5|counter\(10) & (\inst5|counter[9]~51\ $ (GND))) # (!\inst5|counter\(10) & (!\inst5|counter[9]~51\ & VCC))
-- \inst5|counter[10]~53\ = CARRY((\inst5|counter\(10) & !\inst5|counter[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(10),
	datad => VCC,
	cin => \inst5|counter[9]~51\,
	combout => \inst5|counter[10]~52_combout\,
	cout => \inst5|counter[10]~53\);

-- Location: FF_X42_Y47_N21
\inst5|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[10]~52_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(10));

-- Location: LCCOMB_X42_Y47_N22
\inst5|counter[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[11]~54_combout\ = (\inst5|counter\(11) & (!\inst5|counter[10]~53\)) # (!\inst5|counter\(11) & ((\inst5|counter[10]~53\) # (GND)))
-- \inst5|counter[11]~55\ = CARRY((!\inst5|counter[10]~53\) # (!\inst5|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(11),
	datad => VCC,
	cin => \inst5|counter[10]~53\,
	combout => \inst5|counter[11]~54_combout\,
	cout => \inst5|counter[11]~55\);

-- Location: FF_X42_Y47_N23
\inst5|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[11]~54_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(11));

-- Location: LCCOMB_X42_Y47_N24
\inst5|counter[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[12]~56_combout\ = (\inst5|counter\(12) & (\inst5|counter[11]~55\ $ (GND))) # (!\inst5|counter\(12) & (!\inst5|counter[11]~55\ & VCC))
-- \inst5|counter[12]~57\ = CARRY((\inst5|counter\(12) & !\inst5|counter[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(12),
	datad => VCC,
	cin => \inst5|counter[11]~55\,
	combout => \inst5|counter[12]~56_combout\,
	cout => \inst5|counter[12]~57\);

-- Location: FF_X42_Y47_N25
\inst5|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[12]~56_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(12));

-- Location: LCCOMB_X42_Y47_N26
\inst5|counter[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[13]~58_combout\ = (\inst5|counter\(13) & (!\inst5|counter[12]~57\)) # (!\inst5|counter\(13) & ((\inst5|counter[12]~57\) # (GND)))
-- \inst5|counter[13]~59\ = CARRY((!\inst5|counter[12]~57\) # (!\inst5|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(13),
	datad => VCC,
	cin => \inst5|counter[12]~57\,
	combout => \inst5|counter[13]~58_combout\,
	cout => \inst5|counter[13]~59\);

-- Location: FF_X42_Y47_N27
\inst5|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[13]~58_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(13));

-- Location: LCCOMB_X42_Y47_N28
\inst5|counter[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[14]~60_combout\ = (\inst5|counter\(14) & (\inst5|counter[13]~59\ $ (GND))) # (!\inst5|counter\(14) & (!\inst5|counter[13]~59\ & VCC))
-- \inst5|counter[14]~61\ = CARRY((\inst5|counter\(14) & !\inst5|counter[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(14),
	datad => VCC,
	cin => \inst5|counter[13]~59\,
	combout => \inst5|counter[14]~60_combout\,
	cout => \inst5|counter[14]~61\);

-- Location: FF_X42_Y47_N29
\inst5|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[14]~60_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(14));

-- Location: LCCOMB_X42_Y47_N30
\inst5|counter[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[15]~62_combout\ = (\inst5|counter\(15) & (!\inst5|counter[14]~61\)) # (!\inst5|counter\(15) & ((\inst5|counter[14]~61\) # (GND)))
-- \inst5|counter[15]~63\ = CARRY((!\inst5|counter[14]~61\) # (!\inst5|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(15),
	datad => VCC,
	cin => \inst5|counter[14]~61\,
	combout => \inst5|counter[15]~62_combout\,
	cout => \inst5|counter[15]~63\);

-- Location: FF_X42_Y47_N31
\inst5|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[15]~62_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(15));

-- Location: LCCOMB_X42_Y46_N0
\inst5|counter[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[16]~64_combout\ = (\inst5|counter\(16) & (\inst5|counter[15]~63\ $ (GND))) # (!\inst5|counter\(16) & (!\inst5|counter[15]~63\ & VCC))
-- \inst5|counter[16]~65\ = CARRY((\inst5|counter\(16) & !\inst5|counter[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(16),
	datad => VCC,
	cin => \inst5|counter[15]~63\,
	combout => \inst5|counter[16]~64_combout\,
	cout => \inst5|counter[16]~65\);

-- Location: FF_X42_Y46_N1
\inst5|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[16]~64_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(16));

-- Location: LCCOMB_X42_Y46_N2
\inst5|counter[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[17]~66_combout\ = (\inst5|counter\(17) & (!\inst5|counter[16]~65\)) # (!\inst5|counter\(17) & ((\inst5|counter[16]~65\) # (GND)))
-- \inst5|counter[17]~67\ = CARRY((!\inst5|counter[16]~65\) # (!\inst5|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(17),
	datad => VCC,
	cin => \inst5|counter[16]~65\,
	combout => \inst5|counter[17]~66_combout\,
	cout => \inst5|counter[17]~67\);

-- Location: FF_X42_Y46_N3
\inst5|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[17]~66_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(17));

-- Location: LCCOMB_X42_Y46_N4
\inst5|counter[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[18]~68_combout\ = (\inst5|counter\(18) & (\inst5|counter[17]~67\ $ (GND))) # (!\inst5|counter\(18) & (!\inst5|counter[17]~67\ & VCC))
-- \inst5|counter[18]~69\ = CARRY((\inst5|counter\(18) & !\inst5|counter[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(18),
	datad => VCC,
	cin => \inst5|counter[17]~67\,
	combout => \inst5|counter[18]~68_combout\,
	cout => \inst5|counter[18]~69\);

-- Location: FF_X42_Y46_N5
\inst5|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[18]~68_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(18));

-- Location: LCCOMB_X42_Y46_N6
\inst5|counter[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[19]~70_combout\ = (\inst5|counter\(19) & (!\inst5|counter[18]~69\)) # (!\inst5|counter\(19) & ((\inst5|counter[18]~69\) # (GND)))
-- \inst5|counter[19]~71\ = CARRY((!\inst5|counter[18]~69\) # (!\inst5|counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(19),
	datad => VCC,
	cin => \inst5|counter[18]~69\,
	combout => \inst5|counter[19]~70_combout\,
	cout => \inst5|counter[19]~71\);

-- Location: FF_X42_Y46_N7
\inst5|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[19]~70_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(19));

-- Location: LCCOMB_X42_Y46_N8
\inst5|counter[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[20]~72_combout\ = (\inst5|counter\(20) & (\inst5|counter[19]~71\ $ (GND))) # (!\inst5|counter\(20) & (!\inst5|counter[19]~71\ & VCC))
-- \inst5|counter[20]~73\ = CARRY((\inst5|counter\(20) & !\inst5|counter[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(20),
	datad => VCC,
	cin => \inst5|counter[19]~71\,
	combout => \inst5|counter[20]~72_combout\,
	cout => \inst5|counter[20]~73\);

-- Location: FF_X42_Y46_N9
\inst5|counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[20]~72_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(20));

-- Location: LCCOMB_X42_Y46_N10
\inst5|counter[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[21]~74_combout\ = (\inst5|counter\(21) & (!\inst5|counter[20]~73\)) # (!\inst5|counter\(21) & ((\inst5|counter[20]~73\) # (GND)))
-- \inst5|counter[21]~75\ = CARRY((!\inst5|counter[20]~73\) # (!\inst5|counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(21),
	datad => VCC,
	cin => \inst5|counter[20]~73\,
	combout => \inst5|counter[21]~74_combout\,
	cout => \inst5|counter[21]~75\);

-- Location: FF_X42_Y46_N11
\inst5|counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[21]~74_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(21));

-- Location: LCCOMB_X42_Y46_N12
\inst5|counter[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[22]~76_combout\ = (\inst5|counter\(22) & (\inst5|counter[21]~75\ $ (GND))) # (!\inst5|counter\(22) & (!\inst5|counter[21]~75\ & VCC))
-- \inst5|counter[22]~77\ = CARRY((\inst5|counter\(22) & !\inst5|counter[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(22),
	datad => VCC,
	cin => \inst5|counter[21]~75\,
	combout => \inst5|counter[22]~76_combout\,
	cout => \inst5|counter[22]~77\);

-- Location: FF_X42_Y46_N13
\inst5|counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[22]~76_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(22));

-- Location: LCCOMB_X42_Y46_N14
\inst5|counter[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[23]~78_combout\ = (\inst5|counter\(23) & (!\inst5|counter[22]~77\)) # (!\inst5|counter\(23) & ((\inst5|counter[22]~77\) # (GND)))
-- \inst5|counter[23]~79\ = CARRY((!\inst5|counter[22]~77\) # (!\inst5|counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(23),
	datad => VCC,
	cin => \inst5|counter[22]~77\,
	combout => \inst5|counter[23]~78_combout\,
	cout => \inst5|counter[23]~79\);

-- Location: FF_X42_Y46_N15
\inst5|counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[23]~78_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(23));

-- Location: LCCOMB_X42_Y46_N16
\inst5|counter[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[24]~80_combout\ = (\inst5|counter\(24) & (\inst5|counter[23]~79\ $ (GND))) # (!\inst5|counter\(24) & (!\inst5|counter[23]~79\ & VCC))
-- \inst5|counter[24]~81\ = CARRY((\inst5|counter\(24) & !\inst5|counter[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(24),
	datad => VCC,
	cin => \inst5|counter[23]~79\,
	combout => \inst5|counter[24]~80_combout\,
	cout => \inst5|counter[24]~81\);

-- Location: FF_X42_Y46_N17
\inst5|counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[24]~80_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(24));

-- Location: LCCOMB_X42_Y46_N18
\inst5|counter[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[25]~82_combout\ = (\inst5|counter\(25) & (!\inst5|counter[24]~81\)) # (!\inst5|counter\(25) & ((\inst5|counter[24]~81\) # (GND)))
-- \inst5|counter[25]~83\ = CARRY((!\inst5|counter[24]~81\) # (!\inst5|counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(25),
	datad => VCC,
	cin => \inst5|counter[24]~81\,
	combout => \inst5|counter[25]~82_combout\,
	cout => \inst5|counter[25]~83\);

-- Location: FF_X42_Y46_N19
\inst5|counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[25]~82_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(25));

-- Location: LCCOMB_X42_Y46_N20
\inst5|counter[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[26]~84_combout\ = (\inst5|counter\(26) & (\inst5|counter[25]~83\ $ (GND))) # (!\inst5|counter\(26) & (!\inst5|counter[25]~83\ & VCC))
-- \inst5|counter[26]~85\ = CARRY((\inst5|counter\(26) & !\inst5|counter[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(26),
	datad => VCC,
	cin => \inst5|counter[25]~83\,
	combout => \inst5|counter[26]~84_combout\,
	cout => \inst5|counter[26]~85\);

-- Location: FF_X42_Y46_N21
\inst5|counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[26]~84_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(26));

-- Location: LCCOMB_X42_Y46_N22
\inst5|counter[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[27]~86_combout\ = (\inst5|counter\(27) & (!\inst5|counter[26]~85\)) # (!\inst5|counter\(27) & ((\inst5|counter[26]~85\) # (GND)))
-- \inst5|counter[27]~87\ = CARRY((!\inst5|counter[26]~85\) # (!\inst5|counter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(27),
	datad => VCC,
	cin => \inst5|counter[26]~85\,
	combout => \inst5|counter[27]~86_combout\,
	cout => \inst5|counter[27]~87\);

-- Location: FF_X42_Y46_N23
\inst5|counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[27]~86_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(27));

-- Location: LCCOMB_X42_Y46_N24
\inst5|counter[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[28]~88_combout\ = (\inst5|counter\(28) & (\inst5|counter[27]~87\ $ (GND))) # (!\inst5|counter\(28) & (!\inst5|counter[27]~87\ & VCC))
-- \inst5|counter[28]~89\ = CARRY((\inst5|counter\(28) & !\inst5|counter[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(28),
	datad => VCC,
	cin => \inst5|counter[27]~87\,
	combout => \inst5|counter[28]~88_combout\,
	cout => \inst5|counter[28]~89\);

-- Location: FF_X42_Y46_N25
\inst5|counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[28]~88_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(28));

-- Location: LCCOMB_X42_Y46_N26
\inst5|counter[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[29]~90_combout\ = (\inst5|counter\(29) & (!\inst5|counter[28]~89\)) # (!\inst5|counter\(29) & ((\inst5|counter[28]~89\) # (GND)))
-- \inst5|counter[29]~91\ = CARRY((!\inst5|counter[28]~89\) # (!\inst5|counter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(29),
	datad => VCC,
	cin => \inst5|counter[28]~89\,
	combout => \inst5|counter[29]~90_combout\,
	cout => \inst5|counter[29]~91\);

-- Location: FF_X42_Y46_N27
\inst5|counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[29]~90_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(29));

-- Location: LCCOMB_X42_Y46_N28
\inst5|counter[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[30]~92_combout\ = (\inst5|counter\(30) & (\inst5|counter[29]~91\ $ (GND))) # (!\inst5|counter\(30) & (!\inst5|counter[29]~91\ & VCC))
-- \inst5|counter[30]~93\ = CARRY((\inst5|counter\(30) & !\inst5|counter[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst5|counter\(30),
	datad => VCC,
	cin => \inst5|counter[29]~91\,
	combout => \inst5|counter[30]~92_combout\,
	cout => \inst5|counter[30]~93\);

-- Location: FF_X42_Y46_N29
\inst5|counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[30]~92_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(30));

-- Location: LCCOMB_X42_Y46_N30
\inst5|counter[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|counter[31]~94_combout\ = \inst5|counter\(31) $ (\inst5|counter[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(31),
	cin => \inst5|counter[30]~93\,
	combout => \inst5|counter[31]~94_combout\);

-- Location: FF_X42_Y46_N31
\inst5|counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|counter[31]~94_combout\,
	sclr => \inst5|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|counter\(31));

-- Location: LCCOMB_X43_Y47_N10
\inst5|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~0_combout\ = (!\inst5|counter\(28) & (!\inst5|counter\(26) & (!\inst5|counter\(27) & !\inst5|counter\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(28),
	datab => \inst5|counter\(26),
	datac => \inst5|counter\(27),
	datad => \inst5|counter\(29),
	combout => \inst5|LessThan0~0_combout\);

-- Location: LCCOMB_X43_Y47_N26
\inst5|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~1_combout\ = (\inst5|counter\(31)) # ((!\inst5|counter\(25) & (!\inst5|counter\(30) & \inst5|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(31),
	datab => \inst5|counter\(25),
	datac => \inst5|counter\(30),
	datad => \inst5|LessThan0~0_combout\,
	combout => \inst5|LessThan0~1_combout\);

-- Location: LCCOMB_X43_Y47_N8
\inst5|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~5_combout\ = (!\inst5|counter\(8) & (!\inst5|counter\(9) & (!\inst5|counter\(7) & !\inst5|counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(8),
	datab => \inst5|counter\(9),
	datac => \inst5|counter\(7),
	datad => \inst5|counter\(10),
	combout => \inst5|LessThan0~5_combout\);

-- Location: LCCOMB_X43_Y47_N28
\inst5|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~4_combout\ = (((!\inst5|counter\(15)) # (!\inst5|counter\(12))) # (!\inst5|counter\(14))) # (!\inst5|counter\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(13),
	datab => \inst5|counter\(14),
	datac => \inst5|counter\(12),
	datad => \inst5|counter\(15),
	combout => \inst5|LessThan0~4_combout\);

-- Location: LCCOMB_X43_Y47_N22
\inst5|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~6_combout\ = (!\inst5|counter\(16) & ((\inst5|LessThan0~4_combout\) # ((!\inst5|counter\(11) & \inst5|LessThan0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(16),
	datab => \inst5|counter\(11),
	datac => \inst5|LessThan0~5_combout\,
	datad => \inst5|LessThan0~4_combout\,
	combout => \inst5|LessThan0~6_combout\);

-- Location: LCCOMB_X43_Y47_N18
\inst5|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~2_combout\ = (((!\inst5|counter\(18) & !\inst5|counter\(17))) # (!\inst5|counter\(20))) # (!\inst5|counter\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(18),
	datab => \inst5|counter\(19),
	datac => \inst5|counter\(17),
	datad => \inst5|counter\(20),
	combout => \inst5|LessThan0~2_combout\);

-- Location: LCCOMB_X43_Y47_N16
\inst5|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~3_combout\ = (((\inst5|LessThan0~2_combout\) # (!\inst5|counter\(22))) # (!\inst5|counter\(23))) # (!\inst5|counter\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(21),
	datab => \inst5|counter\(23),
	datac => \inst5|counter\(22),
	datad => \inst5|LessThan0~2_combout\,
	combout => \inst5|LessThan0~3_combout\);

-- Location: LCCOMB_X43_Y47_N12
\inst5|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~7_combout\ = (\inst5|LessThan0~0_combout\ & ((\inst5|LessThan0~3_combout\) # ((!\inst5|counter\(18) & \inst5|LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|LessThan0~0_combout\,
	datab => \inst5|counter\(18),
	datac => \inst5|LessThan0~6_combout\,
	datad => \inst5|LessThan0~3_combout\,
	combout => \inst5|LessThan0~7_combout\);

-- Location: LCCOMB_X43_Y47_N30
\inst5|LessThan0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|LessThan0~8_combout\ = (!\inst5|LessThan0~1_combout\ & ((\inst5|counter\(24)) # ((\inst5|counter\(30)) # (!\inst5|LessThan0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|counter\(24),
	datab => \inst5|counter\(30),
	datac => \inst5|LessThan0~1_combout\,
	datad => \inst5|LessThan0~7_combout\,
	combout => \inst5|LessThan0~8_combout\);

-- Location: LCCOMB_X43_Y47_N24
\inst5|pulse~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5|pulse~feeder_combout\ = \inst5|LessThan0~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst5|LessThan0~8_combout\,
	combout => \inst5|pulse~feeder_combout\);

-- Location: FF_X43_Y47_N25
\inst5|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst5|pulse~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|pulse~q\);

-- Location: CLKCTRL_G11
\inst5|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst5|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst5|pulse~clkctrl_outclk\);

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

-- Location: LCCOMB_X96_Y72_N18
\inst2|internal_count[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|internal_count[0]~4_combout\ = \SW[0]~input_o\ $ (\inst2|internal_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \inst2|internal_count\(0),
	combout => \inst2|internal_count[0]~4_combout\);

-- Location: FF_X96_Y72_N19
\inst2|internal_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5|pulse~clkctrl_outclk\,
	d => \inst2|internal_count[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|internal_count\(0));

-- Location: LCCOMB_X96_Y72_N16
\inst2|internal_count[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|internal_count[1]~3_combout\ = \inst2|internal_count\(1) $ (((\SW[0]~input_o\ & \inst2|internal_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \inst2|internal_count\(1),
	datad => \inst2|internal_count\(0),
	combout => \inst2|internal_count[1]~3_combout\);

-- Location: FF_X96_Y72_N17
\inst2|internal_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5|pulse~clkctrl_outclk\,
	d => \inst2|internal_count[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|internal_count\(1));

-- Location: LCCOMB_X96_Y72_N10
\inst2|internal_count[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|internal_count[2]~2_combout\ = \inst2|internal_count\(2) $ (((\SW[0]~input_o\ & (\inst2|internal_count\(1) & \inst2|internal_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \inst2|internal_count\(1),
	datac => \inst2|internal_count\(2),
	datad => \inst2|internal_count\(0),
	combout => \inst2|internal_count[2]~2_combout\);

-- Location: FF_X96_Y72_N11
\inst2|internal_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5|pulse~clkctrl_outclk\,
	d => \inst2|internal_count[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|internal_count\(2));

-- Location: LCCOMB_X96_Y72_N12
\inst2|internal_count[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|internal_count[3]~0_combout\ = (!\inst2|internal_count\(1)) # (!\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \inst2|internal_count\(1),
	combout => \inst2|internal_count[3]~0_combout\);

-- Location: LCCOMB_X96_Y72_N28
\inst2|internal_count[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|internal_count[3]~1_combout\ = \inst2|internal_count\(3) $ (((\inst2|internal_count\(2) & (\inst2|internal_count\(0) & !\inst2|internal_count[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|internal_count\(2),
	datab => \inst2|internal_count\(0),
	datac => \inst2|internal_count\(3),
	datad => \inst2|internal_count[3]~0_combout\,
	combout => \inst2|internal_count[3]~1_combout\);

-- Location: FF_X96_Y72_N29
\inst2|internal_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst5|pulse~clkctrl_outclk\,
	d => \inst2|internal_count[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|internal_count\(3));

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


