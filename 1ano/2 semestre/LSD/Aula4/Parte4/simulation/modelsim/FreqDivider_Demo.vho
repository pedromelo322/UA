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

-- DATE "04/11/2023 09:46:38"

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

ENTITY 	FreqDivider_Demo IS
    PORT (
	clk : IN std_logic;
	LEDR : BUFFER std_logic_vector(0 DOWNTO 0)
	);
END FreqDivider_Demo;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FreqDivider_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \freq_div|Add0~0_combout\ : std_logic;
SIGNAL \freq_div|Add0~1\ : std_logic;
SIGNAL \freq_div|Add0~2_combout\ : std_logic;
SIGNAL \freq_div|Add0~3\ : std_logic;
SIGNAL \freq_div|Add0~4_combout\ : std_logic;
SIGNAL \freq_div|Add0~5\ : std_logic;
SIGNAL \freq_div|Add0~6_combout\ : std_logic;
SIGNAL \freq_div|Add0~7\ : std_logic;
SIGNAL \freq_div|Add0~8_combout\ : std_logic;
SIGNAL \freq_div|Add0~9\ : std_logic;
SIGNAL \freq_div|Add0~10_combout\ : std_logic;
SIGNAL \freq_div|Add0~11\ : std_logic;
SIGNAL \freq_div|Add0~12_combout\ : std_logic;
SIGNAL \freq_div|s_counter~7_combout\ : std_logic;
SIGNAL \freq_div|Add0~13\ : std_logic;
SIGNAL \freq_div|Add0~14_combout\ : std_logic;
SIGNAL \freq_div|Equal0~5_combout\ : std_logic;
SIGNAL \freq_div|Add0~15\ : std_logic;
SIGNAL \freq_div|Add0~16_combout\ : std_logic;
SIGNAL \freq_div|Add0~17\ : std_logic;
SIGNAL \freq_div|Add0~18_combout\ : std_logic;
SIGNAL \freq_div|Add0~19\ : std_logic;
SIGNAL \freq_div|Add0~20_combout\ : std_logic;
SIGNAL \freq_div|Add0~21\ : std_logic;
SIGNAL \freq_div|Add0~22_combout\ : std_logic;
SIGNAL \freq_div|s_counter~6_combout\ : std_logic;
SIGNAL \freq_div|Add0~23\ : std_logic;
SIGNAL \freq_div|Add0~24_combout\ : std_logic;
SIGNAL \freq_div|s_counter~5_combout\ : std_logic;
SIGNAL \freq_div|Add0~25\ : std_logic;
SIGNAL \freq_div|Add0~26_combout\ : std_logic;
SIGNAL \freq_div|s_counter~4_combout\ : std_logic;
SIGNAL \freq_div|Add0~27\ : std_logic;
SIGNAL \freq_div|Add0~28_combout\ : std_logic;
SIGNAL \freq_div|s_counter~11_combout\ : std_logic;
SIGNAL \freq_div|Add0~29\ : std_logic;
SIGNAL \freq_div|Add0~30_combout\ : std_logic;
SIGNAL \freq_div|Add0~31\ : std_logic;
SIGNAL \freq_div|Add0~32_combout\ : std_logic;
SIGNAL \freq_div|s_counter~10_combout\ : std_logic;
SIGNAL \freq_div|Equal0~9_combout\ : std_logic;
SIGNAL \freq_div|Add0~33\ : std_logic;
SIGNAL \freq_div|Add0~34_combout\ : std_logic;
SIGNAL \freq_div|Add0~35\ : std_logic;
SIGNAL \freq_div|Add0~36_combout\ : std_logic;
SIGNAL \freq_div|s_counter~3_combout\ : std_logic;
SIGNAL \freq_div|Add0~37\ : std_logic;
SIGNAL \freq_div|Add0~38_combout\ : std_logic;
SIGNAL \freq_div|s_counter~2_combout\ : std_logic;
SIGNAL \freq_div|Add0~39\ : std_logic;
SIGNAL \freq_div|Add0~40_combout\ : std_logic;
SIGNAL \freq_div|s_counter~1_combout\ : std_logic;
SIGNAL \freq_div|Add0~41\ : std_logic;
SIGNAL \freq_div|Add0~42_combout\ : std_logic;
SIGNAL \freq_div|s_counter~0_combout\ : std_logic;
SIGNAL \freq_div|Add0~43\ : std_logic;
SIGNAL \freq_div|Add0~44_combout\ : std_logic;
SIGNAL \freq_div|s_counter~9_combout\ : std_logic;
SIGNAL \freq_div|Add0~45\ : std_logic;
SIGNAL \freq_div|Add0~46_combout\ : std_logic;
SIGNAL \freq_div|Add0~47\ : std_logic;
SIGNAL \freq_div|Add0~48_combout\ : std_logic;
SIGNAL \freq_div|s_counter~8_combout\ : std_logic;
SIGNAL \freq_div|Equal0~8_combout\ : std_logic;
SIGNAL \freq_div|Equal0~10_combout\ : std_logic;
SIGNAL \freq_div|Equal0~6_combout\ : std_logic;
SIGNAL \freq_div|Equal0~2_combout\ : std_logic;
SIGNAL \freq_div|Add0~49\ : std_logic;
SIGNAL \freq_div|Add0~50_combout\ : std_logic;
SIGNAL \freq_div|Add0~51\ : std_logic;
SIGNAL \freq_div|Add0~52_combout\ : std_logic;
SIGNAL \freq_div|Add0~53\ : std_logic;
SIGNAL \freq_div|Add0~54_combout\ : std_logic;
SIGNAL \freq_div|Equal0~1_combout\ : std_logic;
SIGNAL \freq_div|Add0~55\ : std_logic;
SIGNAL \freq_div|Add0~56_combout\ : std_logic;
SIGNAL \freq_div|Add0~57\ : std_logic;
SIGNAL \freq_div|Add0~58_combout\ : std_logic;
SIGNAL \freq_div|Add0~59\ : std_logic;
SIGNAL \freq_div|Add0~60_combout\ : std_logic;
SIGNAL \freq_div|Add0~61\ : std_logic;
SIGNAL \freq_div|Add0~62_combout\ : std_logic;
SIGNAL \freq_div|Equal0~0_combout\ : std_logic;
SIGNAL \freq_div|Equal0~3_combout\ : std_logic;
SIGNAL \freq_div|Equal0~4_combout\ : std_logic;
SIGNAL \freq_div|Equal0~11_combout\ : std_logic;
SIGNAL \freq_div|Equal0~7_combout\ : std_logic;
SIGNAL \freq_div|clkOut~0_combout\ : std_logic;
SIGNAL \freq_div|clkOut~1_combout\ : std_logic;
SIGNAL \freq_div|clkOut~2_combout\ : std_logic;
SIGNAL \freq_div|clkOut~3_combout\ : std_logic;
SIGNAL \freq_div|clkOut~q\ : std_logic;
SIGNAL \freq_div|s_counter\ : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
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
	i => \freq_div|clkOut~q\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOIBUF_X56_Y73_N1
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G14
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X77_Y66_N0
\freq_div|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~0_combout\ = \freq_div|s_counter\(0) $ (VCC)
-- \freq_div|Add0~1\ = CARRY(\freq_div|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(0),
	datad => VCC,
	combout => \freq_div|Add0~0_combout\,
	cout => \freq_div|Add0~1\);

-- Location: FF_X77_Y66_N1
\freq_div|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(0));

-- Location: LCCOMB_X77_Y66_N2
\freq_div|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~2_combout\ = (\freq_div|s_counter\(1) & (!\freq_div|Add0~1\)) # (!\freq_div|s_counter\(1) & ((\freq_div|Add0~1\) # (GND)))
-- \freq_div|Add0~3\ = CARRY((!\freq_div|Add0~1\) # (!\freq_div|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(1),
	datad => VCC,
	cin => \freq_div|Add0~1\,
	combout => \freq_div|Add0~2_combout\,
	cout => \freq_div|Add0~3\);

-- Location: FF_X77_Y66_N3
\freq_div|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(1));

-- Location: LCCOMB_X77_Y66_N4
\freq_div|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~4_combout\ = (\freq_div|s_counter\(2) & (\freq_div|Add0~3\ $ (GND))) # (!\freq_div|s_counter\(2) & (!\freq_div|Add0~3\ & VCC))
-- \freq_div|Add0~5\ = CARRY((\freq_div|s_counter\(2) & !\freq_div|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(2),
	datad => VCC,
	cin => \freq_div|Add0~3\,
	combout => \freq_div|Add0~4_combout\,
	cout => \freq_div|Add0~5\);

-- Location: FF_X77_Y66_N5
\freq_div|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(2));

-- Location: LCCOMB_X77_Y66_N6
\freq_div|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~6_combout\ = (\freq_div|s_counter\(3) & (!\freq_div|Add0~5\)) # (!\freq_div|s_counter\(3) & ((\freq_div|Add0~5\) # (GND)))
-- \freq_div|Add0~7\ = CARRY((!\freq_div|Add0~5\) # (!\freq_div|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(3),
	datad => VCC,
	cin => \freq_div|Add0~5\,
	combout => \freq_div|Add0~6_combout\,
	cout => \freq_div|Add0~7\);

-- Location: FF_X77_Y66_N7
\freq_div|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(3));

-- Location: LCCOMB_X77_Y66_N8
\freq_div|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~8_combout\ = (\freq_div|s_counter\(4) & (\freq_div|Add0~7\ $ (GND))) # (!\freq_div|s_counter\(4) & (!\freq_div|Add0~7\ & VCC))
-- \freq_div|Add0~9\ = CARRY((\freq_div|s_counter\(4) & !\freq_div|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(4),
	datad => VCC,
	cin => \freq_div|Add0~7\,
	combout => \freq_div|Add0~8_combout\,
	cout => \freq_div|Add0~9\);

-- Location: FF_X77_Y66_N9
\freq_div|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(4));

-- Location: LCCOMB_X77_Y66_N10
\freq_div|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~10_combout\ = (\freq_div|s_counter\(5) & (!\freq_div|Add0~9\)) # (!\freq_div|s_counter\(5) & ((\freq_div|Add0~9\) # (GND)))
-- \freq_div|Add0~11\ = CARRY((!\freq_div|Add0~9\) # (!\freq_div|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(5),
	datad => VCC,
	cin => \freq_div|Add0~9\,
	combout => \freq_div|Add0~10_combout\,
	cout => \freq_div|Add0~11\);

-- Location: FF_X77_Y66_N11
\freq_div|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(5));

-- Location: LCCOMB_X77_Y66_N12
\freq_div|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~12_combout\ = (\freq_div|s_counter\(6) & (\freq_div|Add0~11\ $ (GND))) # (!\freq_div|s_counter\(6) & (!\freq_div|Add0~11\ & VCC))
-- \freq_div|Add0~13\ = CARRY((\freq_div|s_counter\(6) & !\freq_div|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(6),
	datad => VCC,
	cin => \freq_div|Add0~11\,
	combout => \freq_div|Add0~12_combout\,
	cout => \freq_div|Add0~13\);

-- Location: LCCOMB_X76_Y66_N14
\freq_div|s_counter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~7_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~12_combout\,
	combout => \freq_div|s_counter~7_combout\);

-- Location: FF_X76_Y66_N15
\freq_div|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(6));

-- Location: LCCOMB_X77_Y66_N14
\freq_div|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~14_combout\ = (\freq_div|s_counter\(7) & (!\freq_div|Add0~13\)) # (!\freq_div|s_counter\(7) & ((\freq_div|Add0~13\) # (GND)))
-- \freq_div|Add0~15\ = CARRY((!\freq_div|Add0~13\) # (!\freq_div|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(7),
	datad => VCC,
	cin => \freq_div|Add0~13\,
	combout => \freq_div|Add0~14_combout\,
	cout => \freq_div|Add0~15\);

-- Location: FF_X77_Y66_N15
\freq_div|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(7));

-- Location: LCCOMB_X76_Y66_N12
\freq_div|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~5_combout\ = (!\freq_div|s_counter\(6) & (\freq_div|s_counter\(4) & (!\freq_div|s_counter\(7) & \freq_div|s_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(6),
	datab => \freq_div|s_counter\(4),
	datac => \freq_div|s_counter\(7),
	datad => \freq_div|s_counter\(3),
	combout => \freq_div|Equal0~5_combout\);

-- Location: LCCOMB_X77_Y66_N16
\freq_div|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~16_combout\ = (\freq_div|s_counter\(8) & (\freq_div|Add0~15\ $ (GND))) # (!\freq_div|s_counter\(8) & (!\freq_div|Add0~15\ & VCC))
-- \freq_div|Add0~17\ = CARRY((\freq_div|s_counter\(8) & !\freq_div|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(8),
	datad => VCC,
	cin => \freq_div|Add0~15\,
	combout => \freq_div|Add0~16_combout\,
	cout => \freq_div|Add0~17\);

-- Location: FF_X77_Y66_N17
\freq_div|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(8));

-- Location: LCCOMB_X77_Y66_N18
\freq_div|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~18_combout\ = (\freq_div|s_counter\(9) & (!\freq_div|Add0~17\)) # (!\freq_div|s_counter\(9) & ((\freq_div|Add0~17\) # (GND)))
-- \freq_div|Add0~19\ = CARRY((!\freq_div|Add0~17\) # (!\freq_div|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(9),
	datad => VCC,
	cin => \freq_div|Add0~17\,
	combout => \freq_div|Add0~18_combout\,
	cout => \freq_div|Add0~19\);

-- Location: FF_X77_Y66_N19
\freq_div|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(9));

-- Location: LCCOMB_X77_Y66_N20
\freq_div|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~20_combout\ = (\freq_div|s_counter\(10) & (\freq_div|Add0~19\ $ (GND))) # (!\freq_div|s_counter\(10) & (!\freq_div|Add0~19\ & VCC))
-- \freq_div|Add0~21\ = CARRY((\freq_div|s_counter\(10) & !\freq_div|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(10),
	datad => VCC,
	cin => \freq_div|Add0~19\,
	combout => \freq_div|Add0~20_combout\,
	cout => \freq_div|Add0~21\);

-- Location: FF_X77_Y66_N21
\freq_div|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(10));

-- Location: LCCOMB_X77_Y66_N22
\freq_div|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~22_combout\ = (\freq_div|s_counter\(11) & (!\freq_div|Add0~21\)) # (!\freq_div|s_counter\(11) & ((\freq_div|Add0~21\) # (GND)))
-- \freq_div|Add0~23\ = CARRY((!\freq_div|Add0~21\) # (!\freq_div|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(11),
	datad => VCC,
	cin => \freq_div|Add0~21\,
	combout => \freq_div|Add0~22_combout\,
	cout => \freq_div|Add0~23\);

-- Location: LCCOMB_X76_Y65_N22
\freq_div|s_counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~6_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~22_combout\,
	combout => \freq_div|s_counter~6_combout\);

-- Location: FF_X76_Y65_N23
\freq_div|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(11));

-- Location: LCCOMB_X77_Y66_N24
\freq_div|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~24_combout\ = (\freq_div|s_counter\(12) & (\freq_div|Add0~23\ $ (GND))) # (!\freq_div|s_counter\(12) & (!\freq_div|Add0~23\ & VCC))
-- \freq_div|Add0~25\ = CARRY((\freq_div|s_counter\(12) & !\freq_div|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(12),
	datad => VCC,
	cin => \freq_div|Add0~23\,
	combout => \freq_div|Add0~24_combout\,
	cout => \freq_div|Add0~25\);

-- Location: LCCOMB_X76_Y65_N24
\freq_div|s_counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~5_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~11_combout\,
	datac => \freq_div|Add0~24_combout\,
	combout => \freq_div|s_counter~5_combout\);

-- Location: FF_X76_Y65_N25
\freq_div|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(12));

-- Location: LCCOMB_X77_Y66_N26
\freq_div|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~26_combout\ = (\freq_div|s_counter\(13) & (!\freq_div|Add0~25\)) # (!\freq_div|s_counter\(13) & ((\freq_div|Add0~25\) # (GND)))
-- \freq_div|Add0~27\ = CARRY((!\freq_div|Add0~25\) # (!\freq_div|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(13),
	datad => VCC,
	cin => \freq_div|Add0~25\,
	combout => \freq_div|Add0~26_combout\,
	cout => \freq_div|Add0~27\);

-- Location: LCCOMB_X76_Y65_N28
\freq_div|s_counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~4_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~26_combout\,
	combout => \freq_div|s_counter~4_combout\);

-- Location: FF_X76_Y65_N29
\freq_div|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(13));

-- Location: LCCOMB_X77_Y66_N28
\freq_div|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~28_combout\ = (\freq_div|s_counter\(14) & (\freq_div|Add0~27\ $ (GND))) # (!\freq_div|s_counter\(14) & (!\freq_div|Add0~27\ & VCC))
-- \freq_div|Add0~29\ = CARRY((\freq_div|s_counter\(14) & !\freq_div|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(14),
	datad => VCC,
	cin => \freq_div|Add0~27\,
	combout => \freq_div|Add0~28_combout\,
	cout => \freq_div|Add0~29\);

-- Location: LCCOMB_X76_Y66_N18
\freq_div|s_counter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~11_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~28_combout\,
	combout => \freq_div|s_counter~11_combout\);

-- Location: FF_X76_Y66_N19
\freq_div|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(14));

-- Location: LCCOMB_X77_Y66_N30
\freq_div|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~30_combout\ = (\freq_div|s_counter\(15) & (!\freq_div|Add0~29\)) # (!\freq_div|s_counter\(15) & ((\freq_div|Add0~29\) # (GND)))
-- \freq_div|Add0~31\ = CARRY((!\freq_div|Add0~29\) # (!\freq_div|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(15),
	datad => VCC,
	cin => \freq_div|Add0~29\,
	combout => \freq_div|Add0~30_combout\,
	cout => \freq_div|Add0~31\);

-- Location: FF_X77_Y66_N31
\freq_div|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(15));

-- Location: LCCOMB_X77_Y65_N0
\freq_div|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~32_combout\ = (\freq_div|s_counter\(16) & (\freq_div|Add0~31\ $ (GND))) # (!\freq_div|s_counter\(16) & (!\freq_div|Add0~31\ & VCC))
-- \freq_div|Add0~33\ = CARRY((\freq_div|s_counter\(16) & !\freq_div|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(16),
	datad => VCC,
	cin => \freq_div|Add0~31\,
	combout => \freq_div|Add0~32_combout\,
	cout => \freq_div|Add0~33\);

-- Location: LCCOMB_X76_Y66_N4
\freq_div|s_counter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~10_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~32_combout\,
	combout => \freq_div|s_counter~10_combout\);

-- Location: FF_X76_Y66_N5
\freq_div|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(16));

-- Location: LCCOMB_X76_Y66_N2
\freq_div|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~9_combout\ = (!\freq_div|s_counter\(10) & (\freq_div|s_counter\(16) & (!\freq_div|s_counter\(15) & \freq_div|s_counter\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(10),
	datab => \freq_div|s_counter\(16),
	datac => \freq_div|s_counter\(15),
	datad => \freq_div|s_counter\(14),
	combout => \freq_div|Equal0~9_combout\);

-- Location: LCCOMB_X77_Y65_N2
\freq_div|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~34_combout\ = (\freq_div|s_counter\(17) & (!\freq_div|Add0~33\)) # (!\freq_div|s_counter\(17) & ((\freq_div|Add0~33\) # (GND)))
-- \freq_div|Add0~35\ = CARRY((!\freq_div|Add0~33\) # (!\freq_div|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(17),
	datad => VCC,
	cin => \freq_div|Add0~33\,
	combout => \freq_div|Add0~34_combout\,
	cout => \freq_div|Add0~35\);

-- Location: FF_X77_Y65_N3
\freq_div|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(17));

-- Location: LCCOMB_X77_Y65_N4
\freq_div|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~36_combout\ = (\freq_div|s_counter\(18) & (\freq_div|Add0~35\ $ (GND))) # (!\freq_div|s_counter\(18) & (!\freq_div|Add0~35\ & VCC))
-- \freq_div|Add0~37\ = CARRY((\freq_div|s_counter\(18) & !\freq_div|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(18),
	datad => VCC,
	cin => \freq_div|Add0~35\,
	combout => \freq_div|Add0~36_combout\,
	cout => \freq_div|Add0~37\);

-- Location: LCCOMB_X76_Y65_N6
\freq_div|s_counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~3_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~36_combout\,
	combout => \freq_div|s_counter~3_combout\);

-- Location: FF_X76_Y65_N7
\freq_div|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(18));

-- Location: LCCOMB_X77_Y65_N6
\freq_div|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~38_combout\ = (\freq_div|s_counter\(19) & (!\freq_div|Add0~37\)) # (!\freq_div|s_counter\(19) & ((\freq_div|Add0~37\) # (GND)))
-- \freq_div|Add0~39\ = CARRY((!\freq_div|Add0~37\) # (!\freq_div|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(19),
	datad => VCC,
	cin => \freq_div|Add0~37\,
	combout => \freq_div|Add0~38_combout\,
	cout => \freq_div|Add0~39\);

-- Location: LCCOMB_X76_Y65_N16
\freq_div|s_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~2_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~38_combout\,
	combout => \freq_div|s_counter~2_combout\);

-- Location: FF_X76_Y65_N17
\freq_div|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(19));

-- Location: LCCOMB_X77_Y65_N8
\freq_div|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~40_combout\ = (\freq_div|s_counter\(20) & (\freq_div|Add0~39\ $ (GND))) # (!\freq_div|s_counter\(20) & (!\freq_div|Add0~39\ & VCC))
-- \freq_div|Add0~41\ = CARRY((\freq_div|s_counter\(20) & !\freq_div|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(20),
	datad => VCC,
	cin => \freq_div|Add0~39\,
	combout => \freq_div|Add0~40_combout\,
	cout => \freq_div|Add0~41\);

-- Location: LCCOMB_X76_Y65_N14
\freq_div|s_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~1_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~11_combout\,
	datac => \freq_div|Add0~40_combout\,
	combout => \freq_div|s_counter~1_combout\);

-- Location: FF_X76_Y65_N15
\freq_div|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(20));

-- Location: LCCOMB_X77_Y65_N10
\freq_div|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~42_combout\ = (\freq_div|s_counter\(21) & (!\freq_div|Add0~41\)) # (!\freq_div|s_counter\(21) & ((\freq_div|Add0~41\) # (GND)))
-- \freq_div|Add0~43\ = CARRY((!\freq_div|Add0~41\) # (!\freq_div|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(21),
	datad => VCC,
	cin => \freq_div|Add0~41\,
	combout => \freq_div|Add0~42_combout\,
	cout => \freq_div|Add0~43\);

-- Location: LCCOMB_X76_Y65_N26
\freq_div|s_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~0_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~11_combout\,
	datac => \freq_div|Add0~42_combout\,
	combout => \freq_div|s_counter~0_combout\);

-- Location: FF_X76_Y65_N27
\freq_div|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(21));

-- Location: LCCOMB_X77_Y65_N12
\freq_div|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~44_combout\ = (\freq_div|s_counter\(22) & (\freq_div|Add0~43\ $ (GND))) # (!\freq_div|s_counter\(22) & (!\freq_div|Add0~43\ & VCC))
-- \freq_div|Add0~45\ = CARRY((\freq_div|s_counter\(22) & !\freq_div|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(22),
	datad => VCC,
	cin => \freq_div|Add0~43\,
	combout => \freq_div|Add0~44_combout\,
	cout => \freq_div|Add0~45\);

-- Location: LCCOMB_X76_Y66_N8
\freq_div|s_counter~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~9_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~44_combout\,
	combout => \freq_div|s_counter~9_combout\);

-- Location: FF_X76_Y66_N9
\freq_div|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(22));

-- Location: LCCOMB_X77_Y65_N14
\freq_div|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~46_combout\ = (\freq_div|s_counter\(23) & (!\freq_div|Add0~45\)) # (!\freq_div|s_counter\(23) & ((\freq_div|Add0~45\) # (GND)))
-- \freq_div|Add0~47\ = CARRY((!\freq_div|Add0~45\) # (!\freq_div|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(23),
	datad => VCC,
	cin => \freq_div|Add0~45\,
	combout => \freq_div|Add0~46_combout\,
	cout => \freq_div|Add0~47\);

-- Location: FF_X77_Y65_N15
\freq_div|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(23));

-- Location: LCCOMB_X77_Y65_N16
\freq_div|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~48_combout\ = (\freq_div|s_counter\(24) & (\freq_div|Add0~47\ $ (GND))) # (!\freq_div|s_counter\(24) & (!\freq_div|Add0~47\ & VCC))
-- \freq_div|Add0~49\ = CARRY((\freq_div|s_counter\(24) & !\freq_div|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(24),
	datad => VCC,
	cin => \freq_div|Add0~47\,
	combout => \freq_div|Add0~48_combout\,
	cout => \freq_div|Add0~49\);

-- Location: LCCOMB_X76_Y66_N6
\freq_div|s_counter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|s_counter~8_combout\ = (!\freq_div|Equal0~11_combout\ & \freq_div|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \freq_div|Equal0~11_combout\,
	datad => \freq_div|Add0~48_combout\,
	combout => \freq_div|s_counter~8_combout\);

-- Location: FF_X76_Y66_N7
\freq_div|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|s_counter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(24));

-- Location: LCCOMB_X76_Y66_N24
\freq_div|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~8_combout\ = (\freq_div|s_counter\(24) & (\freq_div|s_counter\(22) & (!\freq_div|s_counter\(23) & !\freq_div|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(24),
	datab => \freq_div|s_counter\(22),
	datac => \freq_div|s_counter\(23),
	datad => \freq_div|s_counter\(17),
	combout => \freq_div|Equal0~8_combout\);

-- Location: LCCOMB_X76_Y66_N28
\freq_div|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~10_combout\ = (\freq_div|Equal0~9_combout\ & (\freq_div|s_counter\(5) & \freq_div|Equal0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|Equal0~9_combout\,
	datac => \freq_div|s_counter\(5),
	datad => \freq_div|Equal0~8_combout\,
	combout => \freq_div|Equal0~10_combout\);

-- Location: LCCOMB_X76_Y66_N26
\freq_div|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~6_combout\ = (\freq_div|s_counter\(1) & (\freq_div|s_counter\(0) & \freq_div|s_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(1),
	datac => \freq_div|s_counter\(0),
	datad => \freq_div|s_counter\(2),
	combout => \freq_div|Equal0~6_combout\);

-- Location: LCCOMB_X76_Y65_N30
\freq_div|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~2_combout\ = (\freq_div|s_counter\(18) & (\freq_div|s_counter\(19) & (\freq_div|s_counter\(20) & \freq_div|s_counter\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(18),
	datab => \freq_div|s_counter\(19),
	datac => \freq_div|s_counter\(20),
	datad => \freq_div|s_counter\(13),
	combout => \freq_div|Equal0~2_combout\);

-- Location: LCCOMB_X77_Y65_N18
\freq_div|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~50_combout\ = (\freq_div|s_counter\(25) & (!\freq_div|Add0~49\)) # (!\freq_div|s_counter\(25) & ((\freq_div|Add0~49\) # (GND)))
-- \freq_div|Add0~51\ = CARRY((!\freq_div|Add0~49\) # (!\freq_div|s_counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(25),
	datad => VCC,
	cin => \freq_div|Add0~49\,
	combout => \freq_div|Add0~50_combout\,
	cout => \freq_div|Add0~51\);

-- Location: FF_X77_Y65_N19
\freq_div|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(25));

-- Location: LCCOMB_X77_Y65_N20
\freq_div|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~52_combout\ = (\freq_div|s_counter\(26) & (\freq_div|Add0~51\ $ (GND))) # (!\freq_div|s_counter\(26) & (!\freq_div|Add0~51\ & VCC))
-- \freq_div|Add0~53\ = CARRY((\freq_div|s_counter\(26) & !\freq_div|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(26),
	datad => VCC,
	cin => \freq_div|Add0~51\,
	combout => \freq_div|Add0~52_combout\,
	cout => \freq_div|Add0~53\);

-- Location: FF_X77_Y65_N21
\freq_div|s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(26));

-- Location: LCCOMB_X77_Y65_N22
\freq_div|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~54_combout\ = (\freq_div|s_counter\(27) & (!\freq_div|Add0~53\)) # (!\freq_div|s_counter\(27) & ((\freq_div|Add0~53\) # (GND)))
-- \freq_div|Add0~55\ = CARRY((!\freq_div|Add0~53\) # (!\freq_div|s_counter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(27),
	datad => VCC,
	cin => \freq_div|Add0~53\,
	combout => \freq_div|Add0~54_combout\,
	cout => \freq_div|Add0~55\);

-- Location: FF_X77_Y65_N23
\freq_div|s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(27));

-- Location: LCCOMB_X76_Y65_N20
\freq_div|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~1_combout\ = (\freq_div|s_counter\(21) & (!\freq_div|s_counter\(27) & (!\freq_div|s_counter\(26) & !\freq_div|s_counter\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(21),
	datab => \freq_div|s_counter\(27),
	datac => \freq_div|s_counter\(26),
	datad => \freq_div|s_counter\(25),
	combout => \freq_div|Equal0~1_combout\);

-- Location: LCCOMB_X77_Y65_N24
\freq_div|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~56_combout\ = (\freq_div|s_counter\(28) & (\freq_div|Add0~55\ $ (GND))) # (!\freq_div|s_counter\(28) & (!\freq_div|Add0~55\ & VCC))
-- \freq_div|Add0~57\ = CARRY((\freq_div|s_counter\(28) & !\freq_div|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(28),
	datad => VCC,
	cin => \freq_div|Add0~55\,
	combout => \freq_div|Add0~56_combout\,
	cout => \freq_div|Add0~57\);

-- Location: FF_X77_Y65_N25
\freq_div|s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(28));

-- Location: LCCOMB_X77_Y65_N26
\freq_div|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~58_combout\ = (\freq_div|s_counter\(29) & (!\freq_div|Add0~57\)) # (!\freq_div|s_counter\(29) & ((\freq_div|Add0~57\) # (GND)))
-- \freq_div|Add0~59\ = CARRY((!\freq_div|Add0~57\) # (!\freq_div|s_counter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(29),
	datad => VCC,
	cin => \freq_div|Add0~57\,
	combout => \freq_div|Add0~58_combout\,
	cout => \freq_div|Add0~59\);

-- Location: FF_X77_Y65_N27
\freq_div|s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(29));

-- Location: LCCOMB_X77_Y65_N28
\freq_div|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~60_combout\ = (\freq_div|s_counter\(30) & (\freq_div|Add0~59\ $ (GND))) # (!\freq_div|s_counter\(30) & (!\freq_div|Add0~59\ & VCC))
-- \freq_div|Add0~61\ = CARRY((\freq_div|s_counter\(30) & !\freq_div|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(30),
	datad => VCC,
	cin => \freq_div|Add0~59\,
	combout => \freq_div|Add0~60_combout\,
	cout => \freq_div|Add0~61\);

-- Location: FF_X77_Y65_N29
\freq_div|s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(30));

-- Location: LCCOMB_X77_Y65_N30
\freq_div|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Add0~62_combout\ = \freq_div|s_counter\(31) $ (\freq_div|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(31),
	cin => \freq_div|Add0~61\,
	combout => \freq_div|Add0~62_combout\);

-- Location: FF_X77_Y65_N31
\freq_div|s_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|Add0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|s_counter\(31));

-- Location: LCCOMB_X76_Y65_N8
\freq_div|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~0_combout\ = (!\freq_div|s_counter\(31) & (!\freq_div|s_counter\(30) & (!\freq_div|s_counter\(29) & !\freq_div|s_counter\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(31),
	datab => \freq_div|s_counter\(30),
	datac => \freq_div|s_counter\(29),
	datad => \freq_div|s_counter\(28),
	combout => \freq_div|Equal0~0_combout\);

-- Location: LCCOMB_X76_Y65_N12
\freq_div|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~3_combout\ = (\freq_div|s_counter\(11) & (\freq_div|s_counter\(12) & (!\freq_div|s_counter\(9) & !\freq_div|s_counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(11),
	datab => \freq_div|s_counter\(12),
	datac => \freq_div|s_counter\(9),
	datad => \freq_div|s_counter\(8),
	combout => \freq_div|Equal0~3_combout\);

-- Location: LCCOMB_X76_Y65_N10
\freq_div|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~4_combout\ = (\freq_div|Equal0~2_combout\ & (\freq_div|Equal0~1_combout\ & (\freq_div|Equal0~0_combout\ & \freq_div|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~2_combout\,
	datab => \freq_div|Equal0~1_combout\,
	datac => \freq_div|Equal0~0_combout\,
	datad => \freq_div|Equal0~3_combout\,
	combout => \freq_div|Equal0~4_combout\);

-- Location: LCCOMB_X76_Y66_N30
\freq_div|Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~11_combout\ = (\freq_div|Equal0~5_combout\ & (\freq_div|Equal0~10_combout\ & (\freq_div|Equal0~6_combout\ & \freq_div|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~5_combout\,
	datab => \freq_div|Equal0~10_combout\,
	datac => \freq_div|Equal0~6_combout\,
	datad => \freq_div|Equal0~4_combout\,
	combout => \freq_div|Equal0~11_combout\);

-- Location: LCCOMB_X76_Y66_N20
\freq_div|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|Equal0~7_combout\ = (\freq_div|Equal0~5_combout\ & (\freq_div|Equal0~6_combout\ & \freq_div|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~5_combout\,
	datac => \freq_div|Equal0~6_combout\,
	datad => \freq_div|Equal0~4_combout\,
	combout => \freq_div|Equal0~7_combout\);

-- Location: LCCOMB_X76_Y66_N22
\freq_div|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|clkOut~0_combout\ = (!\freq_div|s_counter\(24) & (!\freq_div|s_counter\(22) & (\freq_div|s_counter\(23) & \freq_div|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(24),
	datab => \freq_div|s_counter\(22),
	datac => \freq_div|s_counter\(23),
	datad => \freq_div|s_counter\(17),
	combout => \freq_div|clkOut~0_combout\);

-- Location: LCCOMB_X76_Y66_N16
\freq_div|clkOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|clkOut~1_combout\ = (\freq_div|s_counter\(10) & (!\freq_div|s_counter\(16) & (\freq_div|s_counter\(15) & !\freq_div|s_counter\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|s_counter\(10),
	datab => \freq_div|s_counter\(16),
	datac => \freq_div|s_counter\(15),
	datad => \freq_div|s_counter\(14),
	combout => \freq_div|clkOut~1_combout\);

-- Location: LCCOMB_X76_Y66_N10
\freq_div|clkOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|clkOut~2_combout\ = (!\freq_div|s_counter\(5) & (\freq_div|clkOut~0_combout\ & \freq_div|clkOut~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \freq_div|s_counter\(5),
	datac => \freq_div|clkOut~0_combout\,
	datad => \freq_div|clkOut~1_combout\,
	combout => \freq_div|clkOut~2_combout\);

-- Location: LCCOMB_X76_Y66_N0
\freq_div|clkOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \freq_div|clkOut~3_combout\ = (!\freq_div|Equal0~11_combout\ & ((\freq_div|clkOut~q\) # ((\freq_div|Equal0~7_combout\ & \freq_div|clkOut~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \freq_div|Equal0~11_combout\,
	datab => \freq_div|Equal0~7_combout\,
	datac => \freq_div|clkOut~q\,
	datad => \freq_div|clkOut~2_combout\,
	combout => \freq_div|clkOut~3_combout\);

-- Location: FF_X76_Y66_N1
\freq_div|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \freq_div|clkOut~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq_div|clkOut~q\);

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


