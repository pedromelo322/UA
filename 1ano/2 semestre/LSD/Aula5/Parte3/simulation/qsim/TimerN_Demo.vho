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

-- DATE "04/11/2023 11:14:50"

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

ENTITY 	TimerN IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	en : IN std_logic;
	start : IN std_logic;
	s_count : BUFFER std_logic_vector(4 DOWNTO 0);
	TimerOut : BUFFER std_logic
	);
END TimerN;

-- Design Ports Information
-- s_count[0]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_count[1]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_count[2]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_count[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s_count[4]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TimerOut	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF TimerN IS
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
SIGNAL ww_rst : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_s_count : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_TimerOut : std_logic;
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \s_count[0]~output_o\ : std_logic;
SIGNAL \s_count[1]~output_o\ : std_logic;
SIGNAL \s_count[2]~output_o\ : std_logic;
SIGNAL \s_count[3]~output_o\ : std_logic;
SIGNAL \s_count[4]~output_o\ : std_logic;
SIGNAL \TimerOut~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \count[0]~5_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \count[0]~6\ : std_logic;
SIGNAL \count[1]~11_combout\ : std_logic;
SIGNAL \count[0]~10_combout\ : std_logic;
SIGNAL \count[1]~12\ : std_logic;
SIGNAL \count[2]~13_combout\ : std_logic;
SIGNAL \count[2]~14\ : std_logic;
SIGNAL \count[3]~15_combout\ : std_logic;
SIGNAL \count[3]~16\ : std_logic;
SIGNAL \count[4]~17_combout\ : std_logic;
SIGNAL \count~8_combout\ : std_logic;
SIGNAL \count_en~0_combout\ : std_logic;
SIGNAL \count_en~q\ : std_logic;
SIGNAL \count~7_combout\ : std_logic;
SIGNAL \count~9_combout\ : std_logic;
SIGNAL count : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_en <= en;
ww_start <= start;
s_count <= ww_s_count;
TimerOut <= ww_TimerOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y62_N23
\s_count[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(0),
	devoe => ww_devoe,
	o => \s_count[0]~output_o\);

-- Location: IOOBUF_X0_Y62_N16
\s_count[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(1),
	devoe => ww_devoe,
	o => \s_count[1]~output_o\);

-- Location: IOOBUF_X0_Y61_N23
\s_count[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(2),
	devoe => ww_devoe,
	o => \s_count[2]~output_o\);

-- Location: IOOBUF_X0_Y63_N16
\s_count[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(3),
	devoe => ww_devoe,
	o => \s_count[3]~output_o\);

-- Location: IOOBUF_X0_Y63_N23
\s_count[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => count(4),
	devoe => ww_devoe,
	o => \s_count[4]~output_o\);

-- Location: IOOBUF_X0_Y60_N16
\TimerOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \count_en~q\,
	devoe => ww_devoe,
	o => \TimerOut~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
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

-- Location: LCCOMB_X1_Y62_N16
\count[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~5_combout\ = count(0) $ (VCC)
-- \count[0]~6\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	combout => \count[0]~5_combout\,
	cout => \count[0]~6\);

-- Location: IOIBUF_X0_Y36_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G4
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y59_N15
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X0_Y59_N22
\en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LCCOMB_X1_Y62_N18
\count[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~11_combout\ = (count(1) & (!\count[0]~6\)) # (!count(1) & ((\count[0]~6\) # (GND)))
-- \count[1]~12\ = CARRY((!\count[0]~6\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \count[0]~6\,
	combout => \count[1]~11_combout\,
	cout => \count[1]~12\);

-- Location: LCCOMB_X1_Y62_N28
\count[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~10_combout\ = (\en~input_o\ & ((\start~input_o\) # (\count_en~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datac => \start~input_o\,
	datad => \count_en~q\,
	combout => \count[0]~10_combout\);

-- Location: FF_X1_Y62_N19
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[1]~11_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \count~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X1_Y62_N20
\count[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[2]~13_combout\ = (count(2) & (\count[1]~12\ $ (GND))) # (!count(2) & (!\count[1]~12\ & VCC))
-- \count[2]~14\ = CARRY((count(2) & !\count[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~12\,
	combout => \count[2]~13_combout\,
	cout => \count[2]~14\);

-- Location: FF_X1_Y62_N21
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[2]~13_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \count~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X1_Y62_N22
\count[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[3]~15_combout\ = (count(3) & (!\count[2]~14\)) # (!count(3) & ((\count[2]~14\) # (GND)))
-- \count[3]~16\ = CARRY((!\count[2]~14\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datad => VCC,
	cin => \count[2]~14\,
	combout => \count[3]~15_combout\,
	cout => \count[3]~16\);

-- Location: FF_X1_Y62_N23
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[3]~15_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \count~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X1_Y62_N24
\count[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[4]~17_combout\ = count(4) $ (!\count[3]~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	cin => \count[3]~16\,
	combout => \count[4]~17_combout\);

-- Location: FF_X1_Y62_N25
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[4]~17_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \count~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X1_Y62_N12
\count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~8_combout\ = (\count_en~q\ & ((count(3)) # ((count(4)) # (!count(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datab => count(2),
	datac => \count_en~q\,
	datad => count(4),
	combout => \count~8_combout\);

-- Location: LCCOMB_X1_Y62_N8
\count_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_en~0_combout\ = (\en~input_o\ & ((\count~7_combout\) # ((\count~8_combout\)))) # (!\en~input_o\ & (((\count_en~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \count~7_combout\,
	datac => \count_en~q\,
	datad => \count~8_combout\,
	combout => \count_en~0_combout\);

-- Location: FF_X1_Y62_N9
count_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_en~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count_en~q\);

-- Location: LCCOMB_X1_Y62_N30
\count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~7_combout\ = (\count_en~q\ & (((count(0)) # (!count(1))))) # (!\count_en~q\ & (\start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => count(0),
	datac => \count_en~q\,
	datad => count(1),
	combout => \count~7_combout\);

-- Location: LCCOMB_X1_Y62_N10
\count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~9_combout\ = (!\count~7_combout\ & !\count~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \count~7_combout\,
	datad => \count~8_combout\,
	combout => \count~9_combout\);

-- Location: FF_X1_Y62_N17
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[0]~5_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sclr => \count~9_combout\,
	ena => \count[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

ww_s_count(0) <= \s_count[0]~output_o\;

ww_s_count(1) <= \s_count[1]~output_o\;

ww_s_count(2) <= \s_count[2]~output_o\;

ww_s_count(3) <= \s_count[3]~output_o\;

ww_s_count(4) <= \s_count[4]~output_o\;

ww_TimerOut <= \TimerOut~output_o\;
END structure;


