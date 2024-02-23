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

-- DATE "04/05/2023 14:06:01"

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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	PEnc4_2Demo IS
    PORT (
	LEDG : OUT std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(15 DOWNTO 0);
	LEDR : OUT std_logic_vector(0 DOWNTO 0)
	);
END PEnc4_2Demo;

-- Design Ports Information
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PEnc4_2Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDG : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(0 DOWNTO 0);
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \inst|Equal4~1_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \inst|Equal12~0_combout\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \inst|Equal9~0_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \inst|Equal0~2_combout\ : std_logic;
SIGNAL \inst|Equal1~0_combout\ : std_logic;
SIGNAL \inst|Equal2~0_combout\ : std_logic;
SIGNAL \inst|Equal4~0_combout\ : std_logic;
SIGNAL \inst|Equal5~0_combout\ : std_logic;
SIGNAL \inst|Equal3~0_combout\ : std_logic;
SIGNAL \inst|Equal1~1_combout\ : std_logic;
SIGNAL \inst|encodedOut[2]~6_combout\ : std_logic;
SIGNAL \inst|Equal14~0_combout\ : std_logic;
SIGNAL \inst|Equal15~0_combout\ : std_logic;
SIGNAL \inst|Equal10~0_combout\ : std_logic;
SIGNAL \inst|Equal15~1_combout\ : std_logic;
SIGNAL \inst|Equal12~1_combout\ : std_logic;
SIGNAL \inst|encodedOut~7_combout\ : std_logic;
SIGNAL \inst|Equal13~0_combout\ : std_logic;
SIGNAL \inst|Equal12~2_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~8_combout\ : std_logic;
SIGNAL \inst|encodedOut~9_combout\ : std_logic;
SIGNAL \inst|Equal11~0_combout\ : std_logic;
SIGNAL \inst|Equal10~1_combout\ : std_logic;
SIGNAL \inst|Equal8~0_combout\ : std_logic;
SIGNAL \inst|Equal8~1_combout\ : std_logic;
SIGNAL \inst|Equal9~1_combout\ : std_logic;
SIGNAL \inst|encodedOut[2]~23_combout\ : std_logic;
SIGNAL \inst|Equal4~2_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~4_combout\ : std_logic;
SIGNAL \inst|Equal6~0_combout\ : std_logic;
SIGNAL \inst|Equal6~1_combout\ : std_logic;
SIGNAL \inst|Equal7~0_combout\ : std_logic;
SIGNAL \inst|encodedOut[2]~5_combout\ : std_logic;
SIGNAL \inst|encodedOut[3]~10_combout\ : std_logic;
SIGNAL \inst|encodedOut[2]~11_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~14_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~15_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~12_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~13_combout\ : std_logic;
SIGNAL \inst|encodedOut[1]~16_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~21_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~17_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~20_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~25_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~26_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~18_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~24_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~19_combout\ : std_logic;
SIGNAL \inst|encodedOut[0]~22_combout\ : std_logic;
SIGNAL \inst|validOut~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

LEDG <= ww_LEDG;
ww_SW <= SW;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|encodedOut[3]~10_combout\,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|encodedOut[2]~11_combout\,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|encodedOut[1]~16_combout\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|encodedOut[0]~22_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|validOut~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

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

-- Location: LCCOMB_X113_Y14_N2
\inst|Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal4~1_combout\ = (!\SW[5]~input_o\ & (!\SW[6]~input_o\ & !\SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[5]~input_o\,
	datac => \SW[6]~input_o\,
	datad => \SW[3]~input_o\,
	combout => \inst|Equal4~1_combout\);

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

-- Location: LCCOMB_X114_Y14_N0
\inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = (\inst|Equal4~1_combout\ & (!\SW[7]~input_o\ & (!\SW[4]~input_o\ & \SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~1_combout\,
	datab => \SW[7]~input_o\,
	datac => \SW[4]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst|Equal0~1_combout\);

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

-- Location: LCCOMB_X113_Y10_N8
\inst|Equal12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal12~0_combout\ = (!\SW[11]~input_o\ & !\SW[13]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[11]~input_o\,
	datac => \SW[13]~input_o\,
	combout => \inst|Equal12~0_combout\);

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

-- Location: LCCOMB_X114_Y10_N0
\inst|Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal9~0_combout\ = (\inst|Equal12~0_combout\ & (!\SW[15]~input_o\ & (!\SW[12]~input_o\ & !\SW[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal12~0_combout\,
	datab => \SW[15]~input_o\,
	datac => \SW[12]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \inst|Equal9~0_combout\);

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

-- Location: LCCOMB_X114_Y14_N8
\inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (!\SW[8]~input_o\ & (!\SW[10]~input_o\ & (\inst|Equal9~0_combout\ & !\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[10]~input_o\,
	datac => \inst|Equal9~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal0~0_combout\);

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

-- Location: LCCOMB_X114_Y14_N2
\inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~2_combout\ = (!\SW[1]~input_o\ & (\inst|Equal0~1_combout\ & (\inst|Equal0~0_combout\ & !\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \inst|Equal0~1_combout\,
	datac => \inst|Equal0~0_combout\,
	datad => \SW[2]~input_o\,
	combout => \inst|Equal0~2_combout\);

-- Location: LCCOMB_X114_Y14_N4
\inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal1~0_combout\ = (\inst|Equal4~1_combout\ & (!\SW[7]~input_o\ & (!\SW[4]~input_o\ & !\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~1_combout\,
	datab => \SW[7]~input_o\,
	datac => \SW[4]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst|Equal1~0_combout\);

-- Location: LCCOMB_X114_Y14_N24
\inst|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal2~0_combout\ = (!\SW[1]~input_o\ & (\inst|Equal1~0_combout\ & (\inst|Equal0~0_combout\ & \SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \inst|Equal1~0_combout\,
	datac => \inst|Equal0~0_combout\,
	datad => \SW[2]~input_o\,
	combout => \inst|Equal2~0_combout\);

-- Location: LCCOMB_X114_Y14_N18
\inst|Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal4~0_combout\ = (!\SW[1]~input_o\ & (!\SW[2]~input_o\ & (\inst|Equal0~0_combout\ & !\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \inst|Equal0~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \inst|Equal4~0_combout\);

-- Location: LCCOMB_X113_Y14_N8
\inst|Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal5~0_combout\ = (!\SW[7]~input_o\ & (\inst|Equal4~0_combout\ & (!\SW[6]~input_o\ & !\SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \inst|Equal4~0_combout\,
	datac => \SW[6]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \inst|Equal5~0_combout\);

-- Location: LCCOMB_X113_Y14_N4
\inst|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal3~0_combout\ = (!\SW[5]~input_o\ & (\inst|Equal5~0_combout\ & \SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[5]~input_o\,
	datac => \inst|Equal5~0_combout\,
	datad => \SW[3]~input_o\,
	combout => \inst|Equal3~0_combout\);

-- Location: LCCOMB_X114_Y14_N22
\inst|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal1~1_combout\ = (\SW[1]~input_o\ & (\inst|Equal1~0_combout\ & (\inst|Equal0~0_combout\ & !\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \inst|Equal1~0_combout\,
	datac => \inst|Equal0~0_combout\,
	datad => \SW[2]~input_o\,
	combout => \inst|Equal1~1_combout\);

-- Location: LCCOMB_X113_Y14_N6
\inst|encodedOut[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[2]~6_combout\ = (!\inst|Equal0~2_combout\ & (!\inst|Equal2~0_combout\ & (!\inst|Equal3~0_combout\ & !\inst|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~2_combout\,
	datab => \inst|Equal2~0_combout\,
	datac => \inst|Equal3~0_combout\,
	datad => \inst|Equal1~1_combout\,
	combout => \inst|encodedOut[2]~6_combout\);

-- Location: LCCOMB_X113_Y10_N26
\inst|Equal14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal14~0_combout\ = (!\SW[11]~input_o\ & (!\SW[13]~input_o\ & \SW[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[11]~input_o\,
	datac => \SW[13]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \inst|Equal14~0_combout\);

-- Location: LCCOMB_X114_Y10_N10
\inst|Equal15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal15~0_combout\ = (\inst|Equal12~0_combout\ & (\SW[15]~input_o\ & (!\SW[12]~input_o\ & !\SW[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal12~0_combout\,
	datab => \SW[15]~input_o\,
	datac => \SW[12]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \inst|Equal15~0_combout\);

-- Location: LCCOMB_X114_Y14_N26
\inst|Equal10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal10~0_combout\ = (!\SW[1]~input_o\ & (\inst|Equal1~0_combout\ & (!\SW[8]~input_o\ & !\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \inst|Equal1~0_combout\,
	datac => \SW[8]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \inst|Equal10~0_combout\);

-- Location: LCCOMB_X114_Y10_N20
\inst|Equal15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal15~1_combout\ = (\inst|Equal15~0_combout\ & (!\SW[10]~input_o\ & (\inst|Equal10~0_combout\ & !\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal15~0_combout\,
	datab => \SW[10]~input_o\,
	datac => \inst|Equal10~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal15~1_combout\);

-- Location: LCCOMB_X114_Y10_N6
\inst|Equal12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal12~1_combout\ = (\inst|Equal10~0_combout\ & (!\SW[15]~input_o\ & (!\SW[10]~input_o\ & !\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal10~0_combout\,
	datab => \SW[15]~input_o\,
	datac => \SW[10]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal12~1_combout\);

-- Location: LCCOMB_X113_Y10_N12
\inst|encodedOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut~7_combout\ = (\inst|Equal15~1_combout\) # ((\inst|Equal14~0_combout\ & (!\SW[12]~input_o\ & \inst|Equal12~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal14~0_combout\,
	datab => \SW[12]~input_o\,
	datac => \inst|Equal15~1_combout\,
	datad => \inst|Equal12~1_combout\,
	combout => \inst|encodedOut~7_combout\);

-- Location: LCCOMB_X113_Y10_N6
\inst|Equal13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal13~0_combout\ = (\inst|Equal12~1_combout\ & (!\SW[12]~input_o\ & !\SW[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal12~1_combout\,
	datab => \SW[12]~input_o\,
	datad => \SW[14]~input_o\,
	combout => \inst|Equal13~0_combout\);

-- Location: LCCOMB_X113_Y10_N24
\inst|Equal12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal12~2_combout\ = (\inst|Equal12~1_combout\ & (\SW[12]~input_o\ & (\inst|Equal12~0_combout\ & !\SW[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal12~1_combout\,
	datab => \SW[12]~input_o\,
	datac => \inst|Equal12~0_combout\,
	datad => \SW[14]~input_o\,
	combout => \inst|Equal12~2_combout\);

-- Location: LCCOMB_X113_Y10_N18
\inst|encodedOut[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~8_combout\ = (!\inst|Equal12~2_combout\ & (((\SW[11]~input_o\) # (!\SW[13]~input_o\)) # (!\inst|Equal13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal13~0_combout\,
	datab => \inst|Equal12~2_combout\,
	datac => \SW[13]~input_o\,
	datad => \SW[11]~input_o\,
	combout => \inst|encodedOut[1]~8_combout\);

-- Location: LCCOMB_X112_Y10_N0
\inst|encodedOut~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut~9_combout\ = (\inst|encodedOut~7_combout\) # (!\inst|encodedOut[1]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|encodedOut~7_combout\,
	datad => \inst|encodedOut[1]~8_combout\,
	combout => \inst|encodedOut~9_combout\);

-- Location: LCCOMB_X113_Y10_N28
\inst|Equal11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal11~0_combout\ = (\inst|Equal13~0_combout\ & (\SW[11]~input_o\ & !\SW[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal13~0_combout\,
	datab => \SW[11]~input_o\,
	datac => \SW[13]~input_o\,
	combout => \inst|Equal11~0_combout\);

-- Location: LCCOMB_X114_Y10_N16
\inst|Equal10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal10~1_combout\ = (\inst|Equal10~0_combout\ & (\inst|Equal9~0_combout\ & (\SW[10]~input_o\ & !\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal10~0_combout\,
	datab => \inst|Equal9~0_combout\,
	datac => \SW[10]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal10~1_combout\);

-- Location: LCCOMB_X114_Y14_N28
\inst|Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal8~0_combout\ = (\SW[8]~input_o\ & (!\SW[10]~input_o\ & (\inst|Equal9~0_combout\ & !\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[10]~input_o\,
	datac => \inst|Equal9~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal8~0_combout\);

-- Location: LCCOMB_X114_Y14_N30
\inst|Equal8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal8~1_combout\ = (!\SW[1]~input_o\ & (!\SW[2]~input_o\ & (\inst|Equal1~0_combout\ & \inst|Equal8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \inst|Equal1~0_combout\,
	datad => \inst|Equal8~0_combout\,
	combout => \inst|Equal8~1_combout\);

-- Location: LCCOMB_X114_Y14_N16
\inst|Equal9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal9~1_combout\ = (\inst|Equal10~0_combout\ & (!\SW[10]~input_o\ & (\inst|Equal9~0_combout\ & \SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal10~0_combout\,
	datab => \SW[10]~input_o\,
	datac => \inst|Equal9~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \inst|Equal9~1_combout\);

-- Location: LCCOMB_X113_Y10_N10
\inst|encodedOut[2]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[2]~23_combout\ = (!\inst|Equal11~0_combout\ & (!\inst|Equal10~1_combout\ & (!\inst|Equal8~1_combout\ & !\inst|Equal9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal11~0_combout\,
	datab => \inst|Equal10~1_combout\,
	datac => \inst|Equal8~1_combout\,
	datad => \inst|Equal9~1_combout\,
	combout => \inst|encodedOut[2]~23_combout\);

-- Location: LCCOMB_X113_Y14_N12
\inst|Equal4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal4~2_combout\ = (\SW[4]~input_o\ & (\inst|Equal4~0_combout\ & (!\SW[7]~input_o\ & \inst|Equal4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \inst|Equal4~0_combout\,
	datac => \SW[7]~input_o\,
	datad => \inst|Equal4~1_combout\,
	combout => \inst|Equal4~2_combout\);

-- Location: LCCOMB_X113_Y14_N14
\inst|encodedOut[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~4_combout\ = (!\inst|Equal4~2_combout\ & (((\SW[3]~input_o\) # (!\inst|Equal5~0_combout\)) # (!\SW[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~2_combout\,
	datab => \SW[5]~input_o\,
	datac => \inst|Equal5~0_combout\,
	datad => \SW[3]~input_o\,
	combout => \inst|encodedOut[1]~4_combout\);

-- Location: LCCOMB_X113_Y14_N16
\inst|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal6~0_combout\ = (!\SW[5]~input_o\ & (\SW[6]~input_o\ & !\SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[5]~input_o\,
	datac => \SW[6]~input_o\,
	datad => \SW[3]~input_o\,
	combout => \inst|Equal6~0_combout\);

-- Location: LCCOMB_X113_Y14_N18
\inst|Equal6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal6~1_combout\ = (!\SW[4]~input_o\ & (\inst|Equal4~0_combout\ & (!\SW[7]~input_o\ & \inst|Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \inst|Equal4~0_combout\,
	datac => \SW[7]~input_o\,
	datad => \inst|Equal6~0_combout\,
	combout => \inst|Equal6~1_combout\);

-- Location: LCCOMB_X114_Y14_N12
\inst|Equal7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal7~0_combout\ = (\inst|Equal4~1_combout\ & (\inst|Equal4~0_combout\ & (!\SW[4]~input_o\ & \SW[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~1_combout\,
	datab => \inst|Equal4~0_combout\,
	datac => \SW[4]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \inst|Equal7~0_combout\);

-- Location: LCCOMB_X114_Y14_N14
\inst|encodedOut[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[2]~5_combout\ = (\inst|encodedOut[1]~4_combout\ & (!\inst|Equal6~1_combout\ & !\inst|Equal7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[1]~4_combout\,
	datab => \inst|Equal6~1_combout\,
	datad => \inst|Equal7~0_combout\,
	combout => \inst|encodedOut[2]~5_combout\);

-- Location: LCCOMB_X111_Y14_N8
\inst|encodedOut[3]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[3]~10_combout\ = (\inst|encodedOut[2]~6_combout\ & (\inst|encodedOut[2]~5_combout\ & ((\inst|encodedOut~9_combout\) # (!\inst|encodedOut[2]~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[2]~6_combout\,
	datab => \inst|encodedOut~9_combout\,
	datac => \inst|encodedOut[2]~23_combout\,
	datad => \inst|encodedOut[2]~5_combout\,
	combout => \inst|encodedOut[3]~10_combout\);

-- Location: LCCOMB_X111_Y14_N2
\inst|encodedOut[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[2]~11_combout\ = (\inst|encodedOut[2]~6_combout\ & (((\inst|encodedOut~9_combout\ & \inst|encodedOut[2]~23_combout\)) # (!\inst|encodedOut[2]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[2]~6_combout\,
	datab => \inst|encodedOut~9_combout\,
	datac => \inst|encodedOut[2]~23_combout\,
	datad => \inst|encodedOut[2]~5_combout\,
	combout => \inst|encodedOut[2]~11_combout\);

-- Location: LCCOMB_X113_Y14_N0
\inst|encodedOut[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~14_combout\ = (!\inst|Equal2~0_combout\ & (((\SW[5]~input_o\) # (!\inst|Equal5~0_combout\)) # (!\SW[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \inst|Equal5~0_combout\,
	datac => \SW[5]~input_o\,
	datad => \inst|Equal2~0_combout\,
	combout => \inst|encodedOut[1]~14_combout\);

-- Location: LCCOMB_X113_Y14_N10
\inst|encodedOut[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~15_combout\ = ((\inst|encodedOut[1]~4_combout\ & ((\inst|Equal7~0_combout\) # (\inst|Equal6~1_combout\)))) # (!\inst|encodedOut[1]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[1]~14_combout\,
	datab => \inst|encodedOut[1]~4_combout\,
	datac => \inst|Equal7~0_combout\,
	datad => \inst|Equal6~1_combout\,
	combout => \inst|encodedOut[1]~15_combout\);

-- Location: LCCOMB_X113_Y10_N14
\inst|encodedOut[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~12_combout\ = (\inst|Equal11~0_combout\) # ((\inst|Equal10~1_combout\) # ((\inst|encodedOut~7_combout\ & \inst|encodedOut[1]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut~7_combout\,
	datab => \inst|encodedOut[1]~8_combout\,
	datac => \inst|Equal11~0_combout\,
	datad => \inst|Equal10~1_combout\,
	combout => \inst|encodedOut[1]~12_combout\);

-- Location: LCCOMB_X114_Y14_N10
\inst|encodedOut[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~13_combout\ = (\inst|encodedOut[1]~4_combout\ & (!\inst|Equal9~1_combout\ & (!\inst|Equal8~1_combout\ & \inst|encodedOut[1]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[1]~4_combout\,
	datab => \inst|Equal9~1_combout\,
	datac => \inst|Equal8~1_combout\,
	datad => \inst|encodedOut[1]~12_combout\,
	combout => \inst|encodedOut[1]~13_combout\);

-- Location: LCCOMB_X113_Y14_N28
\inst|encodedOut[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[1]~16_combout\ = (!\inst|Equal1~1_combout\ & (!\inst|Equal0~2_combout\ & ((\inst|encodedOut[1]~15_combout\) # (\inst|encodedOut[1]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[1]~15_combout\,
	datab => \inst|Equal1~1_combout\,
	datac => \inst|encodedOut[1]~13_combout\,
	datad => \inst|Equal0~2_combout\,
	combout => \inst|encodedOut[1]~16_combout\);

-- Location: LCCOMB_X113_Y14_N20
\inst|encodedOut[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~21_combout\ = (\inst|Equal1~1_combout\) # ((!\inst|Equal2~0_combout\ & \inst|Equal3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Equal2~0_combout\,
	datac => \inst|Equal3~0_combout\,
	datad => \inst|Equal1~1_combout\,
	combout => \inst|encodedOut[0]~21_combout\);

-- Location: LCCOMB_X113_Y14_N30
\inst|encodedOut[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~17_combout\ = (!\inst|Equal4~2_combout\ & !\inst|Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~2_combout\,
	datad => \inst|Equal2~0_combout\,
	combout => \inst|encodedOut[0]~17_combout\);

-- Location: LCCOMB_X113_Y14_N26
\inst|encodedOut[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~20_combout\ = (\inst|encodedOut[0]~17_combout\ & (\inst|Equal5~0_combout\ & (\SW[5]~input_o\ & !\SW[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[0]~17_combout\,
	datab => \inst|Equal5~0_combout\,
	datac => \SW[5]~input_o\,
	datad => \SW[3]~input_o\,
	combout => \inst|encodedOut[0]~20_combout\);

-- Location: LCCOMB_X113_Y10_N22
\inst|encodedOut[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~25_combout\ = (\inst|Equal13~0_combout\ & (!\inst|Equal10~1_combout\ & (!\SW[13]~input_o\ & \SW[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal13~0_combout\,
	datab => \inst|Equal10~1_combout\,
	datac => \SW[13]~input_o\,
	datad => \SW[11]~input_o\,
	combout => \inst|encodedOut[0]~25_combout\);

-- Location: LCCOMB_X114_Y14_N20
\inst|encodedOut[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~26_combout\ = (\inst|Equal7~0_combout\) # ((!\inst|Equal8~1_combout\ & ((\inst|encodedOut[0]~25_combout\) # (\inst|Equal9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal7~0_combout\,
	datab => \inst|encodedOut[0]~25_combout\,
	datac => \inst|Equal8~1_combout\,
	datad => \inst|Equal9~1_combout\,
	combout => \inst|encodedOut[0]~26_combout\);

-- Location: LCCOMB_X113_Y10_N16
\inst|encodedOut[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~18_combout\ = (\inst|Equal15~1_combout\) # ((!\SW[11]~input_o\ & (\SW[13]~input_o\ & \inst|Equal13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal15~1_combout\,
	datab => \SW[11]~input_o\,
	datac => \SW[13]~input_o\,
	datad => \inst|Equal13~0_combout\,
	combout => \inst|encodedOut[0]~18_combout\);

-- Location: LCCOMB_X113_Y10_N4
\inst|encodedOut[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~24_combout\ = (\inst|encodedOut[0]~18_combout\ & (!\inst|Equal12~2_combout\ & (!\inst|Equal8~1_combout\ & !\inst|Equal10~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[0]~18_combout\,
	datab => \inst|Equal12~2_combout\,
	datac => \inst|Equal8~1_combout\,
	datad => \inst|Equal10~1_combout\,
	combout => \inst|encodedOut[0]~24_combout\);

-- Location: LCCOMB_X113_Y14_N24
\inst|encodedOut[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~19_combout\ = (\inst|encodedOut[0]~17_combout\ & (!\inst|Equal6~1_combout\ & ((\inst|encodedOut[0]~26_combout\) # (\inst|encodedOut[0]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[0]~17_combout\,
	datab => \inst|Equal6~1_combout\,
	datac => \inst|encodedOut[0]~26_combout\,
	datad => \inst|encodedOut[0]~24_combout\,
	combout => \inst|encodedOut[0]~19_combout\);

-- Location: LCCOMB_X113_Y14_N22
\inst|encodedOut[0]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|encodedOut[0]~22_combout\ = (!\inst|Equal0~2_combout\ & ((\inst|encodedOut[0]~21_combout\) # ((\inst|encodedOut[0]~20_combout\) # (\inst|encodedOut[0]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~2_combout\,
	datab => \inst|encodedOut[0]~21_combout\,
	datac => \inst|encodedOut[0]~20_combout\,
	datad => \inst|encodedOut[0]~19_combout\,
	combout => \inst|encodedOut[0]~22_combout\);

-- Location: LCCOMB_X111_Y14_N20
\inst|validOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|validOut~0_combout\ = ((\inst|encodedOut~9_combout\) # ((!\inst|encodedOut[2]~5_combout\) # (!\inst|encodedOut[2]~23_combout\))) # (!\inst|encodedOut[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|encodedOut[2]~6_combout\,
	datab => \inst|encodedOut~9_combout\,
	datac => \inst|encodedOut[2]~23_combout\,
	datad => \inst|encodedOut[2]~5_combout\,
	combout => \inst|validOut~0_combout\);

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


