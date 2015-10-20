-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "04/14/2015 14:35:21"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	roues_codeuses IS
    PORT (
	icodeurAD : IN std_logic;
	icodeurBD : IN std_logic;
	icodeurAG : IN std_logic;
	icodeurBG : IN std_logic;
	iRst : IN std_logic;
	iClk : IN std_logic;
	oImpD : BUFFER std_logic;
	oImpG : BUFFER std_logic;
	oSensD : BUFFER std_logic;
	oSensG : BUFFER std_logic;
	LedD : BUFFER std_logic;
	ledG : BUFFER std_logic;
	DebugD : BUFFER std_logic_vector(1 DOWNTO 0);
	DebugG : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END roues_codeuses;

-- Design Ports Information
-- oImpD	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- oImpG	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- oSensD	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- oSensG	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- LedD	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- ledG	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- DebugD[0]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- DebugD[1]	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- DebugG[0]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- DebugG[1]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- iRst	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- iClk	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- icodeurBD	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- icodeurAD	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- icodeurAG	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- icodeurBG	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default


ARCHITECTURE structure OF roues_codeuses IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_icodeurAD : std_logic;
SIGNAL ww_icodeurBD : std_logic;
SIGNAL ww_icodeurAG : std_logic;
SIGNAL ww_icodeurBG : std_logic;
SIGNAL ww_iRst : std_logic;
SIGNAL ww_iClk : std_logic;
SIGNAL ww_oImpD : std_logic;
SIGNAL ww_oImpG : std_logic;
SIGNAL ww_oSensD : std_logic;
SIGNAL ww_oSensG : std_logic;
SIGNAL ww_LedD : std_logic;
SIGNAL ww_ledG : std_logic;
SIGNAL ww_DebugD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_DebugG : std_logic_vector(1 DOWNTO 0);
SIGNAL \rcG|oImp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rcD|oImp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \oImpD~output_o\ : std_logic;
SIGNAL \oImpG~output_o\ : std_logic;
SIGNAL \oSensD~output_o\ : std_logic;
SIGNAL \oSensG~output_o\ : std_logic;
SIGNAL \LedD~output_o\ : std_logic;
SIGNAL \ledG~output_o\ : std_logic;
SIGNAL \DebugD[0]~output_o\ : std_logic;
SIGNAL \DebugD[1]~output_o\ : std_logic;
SIGNAL \DebugG[0]~output_o\ : std_logic;
SIGNAL \DebugG[1]~output_o\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \iClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rcD|U0|cnt_1[0]~8_combout\ : std_logic;
SIGNAL \iRst~input_o\ : std_logic;
SIGNAL \rcD|U0|cnt[0]~8_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[0]~9\ : std_logic;
SIGNAL \rcD|U0|cnt[1]~10_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[1]~11\ : std_logic;
SIGNAL \rcD|U0|cnt[2]~12_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[2]~13\ : std_logic;
SIGNAL \rcD|U0|cnt[3]~14_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[3]~15\ : std_logic;
SIGNAL \rcD|U0|cnt[4]~16_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[4]~17\ : std_logic;
SIGNAL \rcD|U0|cnt[5]~18_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[5]~19\ : std_logic;
SIGNAL \rcD|U0|cnt[6]~20_combout\ : std_logic;
SIGNAL \rcD|U0|cnt[6]~21\ : std_logic;
SIGNAL \rcD|U0|cnt[7]~22_combout\ : std_logic;
SIGNAL \rcG|U0|Equal0~1_combout\ : std_logic;
SIGNAL \rcG|U0|Equal0~0_combout\ : std_logic;
SIGNAL \rcG|U1|CodeurFil~0_combout\ : std_logic;
SIGNAL \icodeurAD~input_o\ : std_logic;
SIGNAL \rcD|U0|cnt_1[7]~12_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[0]~9\ : std_logic;
SIGNAL \rcD|U0|cnt_1[1]~10_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[1]~11\ : std_logic;
SIGNAL \rcD|U0|cnt_1[2]~13_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[2]~14\ : std_logic;
SIGNAL \rcD|U0|cnt_1[3]~15_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[3]~16\ : std_logic;
SIGNAL \rcD|U0|cnt_1[4]~17_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[4]~18\ : std_logic;
SIGNAL \rcD|U0|cnt_1[5]~19_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[5]~20\ : std_logic;
SIGNAL \rcD|U0|cnt_1[6]~21_combout\ : std_logic;
SIGNAL \rcD|U0|cnt_1[6]~22\ : std_logic;
SIGNAL \rcD|U0|cnt_1[7]~23_combout\ : std_logic;
SIGNAL \rcD|U0|LessThan0~0_combout\ : std_logic;
SIGNAL \rcD|U0|LessThan0~1_combout\ : std_logic;
SIGNAL \rcD|U0|CodeurFil~feeder_combout\ : std_logic;
SIGNAL \rcD|U0|CodeurFil~q\ : std_logic;
SIGNAL \rcD|U1|cnt_1[0]~8_combout\ : std_logic;
SIGNAL \icodeurBD~input_o\ : std_logic;
SIGNAL \rcD|U1|cnt_1[3]~12_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[0]~9\ : std_logic;
SIGNAL \rcD|U1|cnt_1[1]~10_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[1]~11\ : std_logic;
SIGNAL \rcD|U1|cnt_1[2]~13_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[2]~14\ : std_logic;
SIGNAL \rcD|U1|cnt_1[3]~15_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[3]~16\ : std_logic;
SIGNAL \rcD|U1|cnt_1[4]~17_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[4]~18\ : std_logic;
SIGNAL \rcD|U1|cnt_1[5]~19_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[5]~20\ : std_logic;
SIGNAL \rcD|U1|cnt_1[6]~21_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1[6]~22\ : std_logic;
SIGNAL \rcD|U1|cnt_1[7]~23_combout\ : std_logic;
SIGNAL \rcD|U1|LessThan0~0_combout\ : std_logic;
SIGNAL \rcD|U1|LessThan0~1_combout\ : std_logic;
SIGNAL \rcD|U1|CodeurFil~feeder_combout\ : std_logic;
SIGNAL \rcD|U1|CodeurFil~q\ : std_logic;
SIGNAL \rcD|oImp~combout\ : std_logic;
SIGNAL \rcD|oImp~clkctrl_outclk\ : std_logic;
SIGNAL \clk_divD|Add0~1\ : std_logic;
SIGNAL \clk_divD|Add0~2_combout\ : std_logic;
SIGNAL \clk_divD|Add0~3\ : std_logic;
SIGNAL \clk_divD|Add0~4_combout\ : std_logic;
SIGNAL \clk_divD|bCount_Next~0_combout\ : std_logic;
SIGNAL \clk_divD|Add0~5\ : std_logic;
SIGNAL \clk_divD|Add0~6_combout\ : std_logic;
SIGNAL \clk_divD|Add0~7\ : std_logic;
SIGNAL \clk_divD|Add0~8_combout\ : std_logic;
SIGNAL \clk_divD|Add0~9\ : std_logic;
SIGNAL \clk_divD|Add0~10_combout\ : std_logic;
SIGNAL \clk_divD|Add0~11\ : std_logic;
SIGNAL \clk_divD|Add0~12_combout\ : std_logic;
SIGNAL \clk_divD|Add0~13\ : std_logic;
SIGNAL \clk_divD|Add0~14_combout\ : std_logic;
SIGNAL \clk_divD|Equal0~0_combout\ : std_logic;
SIGNAL \clk_divD|Add0~0_combout\ : std_logic;
SIGNAL \clk_divD|bCount_Next~1_combout\ : std_logic;
SIGNAL \clk_divD|Equal0~1_combout\ : std_logic;
SIGNAL \clk_divD|bNew_clk~0_combout\ : std_logic;
SIGNAL \clk_divD|bNew_clk~q\ : std_logic;
SIGNAL \rcG|U0|cnt_1[0]~8_combout\ : std_logic;
SIGNAL \icodeurAG~input_o\ : std_logic;
SIGNAL \rcG|U0|cnt_1[0]~12_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[0]~9\ : std_logic;
SIGNAL \rcG|U0|cnt_1[1]~10_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[1]~11\ : std_logic;
SIGNAL \rcG|U0|cnt_1[2]~13_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[2]~14\ : std_logic;
SIGNAL \rcG|U0|cnt_1[3]~15_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[3]~16\ : std_logic;
SIGNAL \rcG|U0|cnt_1[4]~17_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[4]~18\ : std_logic;
SIGNAL \rcG|U0|cnt_1[5]~19_combout\ : std_logic;
SIGNAL \rcG|U0|LessThan0~0_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[5]~20\ : std_logic;
SIGNAL \rcG|U0|cnt_1[6]~21_combout\ : std_logic;
SIGNAL \rcG|U0|cnt_1[6]~22\ : std_logic;
SIGNAL \rcG|U0|cnt_1[7]~23_combout\ : std_logic;
SIGNAL \rcG|U0|LessThan0~1_combout\ : std_logic;
SIGNAL \rcG|U0|CodeurFil~feeder_combout\ : std_logic;
SIGNAL \rcG|U0|CodeurFil~q\ : std_logic;
SIGNAL \rcG|U1|cnt_1[0]~8_combout\ : std_logic;
SIGNAL \icodeurBG~input_o\ : std_logic;
SIGNAL \rcG|U1|cnt_1[5]~12_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[0]~9\ : std_logic;
SIGNAL \rcG|U1|cnt_1[1]~10_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[1]~11\ : std_logic;
SIGNAL \rcG|U1|cnt_1[2]~13_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[2]~14\ : std_logic;
SIGNAL \rcG|U1|cnt_1[3]~15_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[3]~16\ : std_logic;
SIGNAL \rcG|U1|cnt_1[4]~17_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[4]~18\ : std_logic;
SIGNAL \rcG|U1|cnt_1[5]~19_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[5]~20\ : std_logic;
SIGNAL \rcG|U1|cnt_1[6]~21_combout\ : std_logic;
SIGNAL \rcG|U1|cnt_1[6]~22\ : std_logic;
SIGNAL \rcG|U1|cnt_1[7]~23_combout\ : std_logic;
SIGNAL \rcG|U1|LessThan0~0_combout\ : std_logic;
SIGNAL \rcG|U1|LessThan0~1_combout\ : std_logic;
SIGNAL \rcG|U1|CodeurFil~feeder_combout\ : std_logic;
SIGNAL \rcG|U1|CodeurFil~q\ : std_logic;
SIGNAL \rcG|oImp~combout\ : std_logic;
SIGNAL \rcG|oImp~clkctrl_outclk\ : std_logic;
SIGNAL \clk_divG|Add0~0_combout\ : std_logic;
SIGNAL \clk_divG|Add0~5\ : std_logic;
SIGNAL \clk_divG|Add0~6_combout\ : std_logic;
SIGNAL \clk_divG|Add0~7\ : std_logic;
SIGNAL \clk_divG|Add0~8_combout\ : std_logic;
SIGNAL \clk_divG|Add0~9\ : std_logic;
SIGNAL \clk_divG|Add0~10_combout\ : std_logic;
SIGNAL \clk_divG|Add0~11\ : std_logic;
SIGNAL \clk_divG|Add0~12_combout\ : std_logic;
SIGNAL \clk_divG|Add0~13\ : std_logic;
SIGNAL \clk_divG|Add0~14_combout\ : std_logic;
SIGNAL \clk_divG|Equal0~0_combout\ : std_logic;
SIGNAL \clk_divG|bCount_Next~1_combout\ : std_logic;
SIGNAL \clk_divG|Add0~1\ : std_logic;
SIGNAL \clk_divG|Add0~2_combout\ : std_logic;
SIGNAL \clk_divG|Add0~3\ : std_logic;
SIGNAL \clk_divG|Add0~4_combout\ : std_logic;
SIGNAL \clk_divG|bCount_Next~0_combout\ : std_logic;
SIGNAL \clk_divG|Equal0~1_combout\ : std_logic;
SIGNAL \clk_divG|bNew_clk~0_combout\ : std_logic;
SIGNAL \clk_divG|bNew_clk~q\ : std_logic;
SIGNAL \rcD|oDebug[0]~0_combout\ : std_logic;
SIGNAL \rcD|Selector3~0_combout\ : std_logic;
SIGNAL \rcD|nextstate.S2~0_combout\ : std_logic;
SIGNAL \rcD|state.S2~q\ : std_logic;
SIGNAL \rcD|nextstate.S3~0_combout\ : std_logic;
SIGNAL \rcD|Selector2~0_combout\ : std_logic;
SIGNAL \rcD|nextstate.S1~0_combout\ : std_logic;
SIGNAL \rcD|state.S1~q\ : std_logic;
SIGNAL \rcD|nextstate.S3~1_combout\ : std_logic;
SIGNAL \rcD|nextstate~0_combout\ : std_logic;
SIGNAL \rcD|nextstate.S3~2_combout\ : std_logic;
SIGNAL \rcD|state.S3~q\ : std_logic;
SIGNAL \rcD|Selector6~6_combout\ : std_logic;
SIGNAL \rcD|oDebug[0]~1_combout\ : std_logic;
SIGNAL \rcD|state.S0~q\ : std_logic;
SIGNAL \rcD|Selector5~0_combout\ : std_logic;
SIGNAL \rcD|Selector5~1_combout\ : std_logic;
SIGNAL \rcD|Selector5~2_combout\ : std_logic;
SIGNAL \rcD|Selector6~7_combout\ : std_logic;
SIGNAL \rcD|bSens~combout\ : std_logic;
SIGNAL \rcG|nextstate~0_combout\ : std_logic;
SIGNAL \rcG|Selector3~0_combout\ : std_logic;
SIGNAL \rcG|nextstate.S2~0_combout\ : std_logic;
SIGNAL \rcG|state.S2~q\ : std_logic;
SIGNAL \rcG|nextstate.S3~0_combout\ : std_logic;
SIGNAL \rcG|Selector2~0_combout\ : std_logic;
SIGNAL \rcG|nextstate.S1~0_combout\ : std_logic;
SIGNAL \rcG|state.S1~q\ : std_logic;
SIGNAL \rcG|Selector6~6_combout\ : std_logic;
SIGNAL \rcG|oDebug[0]~0_combout\ : std_logic;
SIGNAL \rcG|oDebug[0]~1_combout\ : std_logic;
SIGNAL \rcG|state.S0~q\ : std_logic;
SIGNAL \rcG|nextstate.S3~1_combout\ : std_logic;
SIGNAL \rcG|nextstate.S3~2_combout\ : std_logic;
SIGNAL \rcG|state.S3~feeder_combout\ : std_logic;
SIGNAL \rcG|state.S3~q\ : std_logic;
SIGNAL \rcG|Selector5~0_combout\ : std_logic;
SIGNAL \rcG|Selector5~1_combout\ : std_logic;
SIGNAL \rcG|Selector5~2_combout\ : std_logic;
SIGNAL \rcG|Selector6~7_combout\ : std_logic;
SIGNAL \rcG|bSens~combout\ : std_logic;
SIGNAL \rcD|oDebug[1]~2_combout\ : std_logic;
SIGNAL \rcD|oDebug[0]~3_combout\ : std_logic;
SIGNAL \rcD|comb~1_combout\ : std_logic;
SIGNAL \rcD|comb~0_combout\ : std_logic;
SIGNAL \rcD|oDebug[1]~4_combout\ : std_logic;
SIGNAL \rcG|oDebug[1]~2_combout\ : std_logic;
SIGNAL \rcG|oDebug[0]~3_combout\ : std_logic;
SIGNAL \rcG|comb~1_combout\ : std_logic;
SIGNAL \rcG|comb~0_combout\ : std_logic;
SIGNAL \rcG|oDebug[1]~4_combout\ : std_logic;
SIGNAL \rcD|U1|cnt_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rcD|U0|cnt_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk_divD|bCount_Next\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rcG|U1|cnt_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rcD|U0|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rcD|oDebug\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \clk_divG|bCount_Next\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rcG|oDebug\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \rcG|U0|cnt_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_iRst~input_o\ : std_logic;

BEGIN

ww_icodeurAD <= icodeurAD;
ww_icodeurBD <= icodeurBD;
ww_icodeurAG <= icodeurAG;
ww_icodeurBG <= icodeurBG;
ww_iRst <= iRst;
ww_iClk <= iClk;
oImpD <= ww_oImpD;
oImpG <= ww_oImpG;
oSensD <= ww_oSensD;
oSensG <= ww_oSensG;
LedD <= ww_LedD;
ledG <= ww_ledG;
DebugD <= ww_DebugD;
DebugG <= ww_DebugG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rcG|oImp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rcG|oImp~combout\);

\rcD|oImp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rcD|oImp~combout\);

\iClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iClk~input_o\);
\ALT_INV_iRst~input_o\ <= NOT \iRst~input_o\;

-- Location: IOOBUF_X31_Y34_N9
\oImpD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_divD|bNew_clk~q\,
	devoe => ww_devoe,
	o => \oImpD~output_o\);

-- Location: IOOBUF_X40_Y34_N9
\oImpG~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_divG|bNew_clk~q\,
	devoe => ww_devoe,
	o => \oImpG~output_o\);

-- Location: IOOBUF_X45_Y34_N16
\oSensD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcD|bSens~combout\,
	devoe => ww_devoe,
	o => \oSensD~output_o\);

-- Location: IOOBUF_X51_Y34_N16
\oSensG~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcG|bSens~combout\,
	devoe => ww_devoe,
	o => \oSensG~output_o\);

-- Location: IOOBUF_X0_Y25_N9
\LedD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcD|bSens~combout\,
	devoe => ww_devoe,
	o => \LedD~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\ledG~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcG|bSens~combout\,
	devoe => ww_devoe,
	o => \ledG~output_o\);

-- Location: IOOBUF_X49_Y34_N2
\DebugD[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcD|oDebug\(0),
	devoe => ww_devoe,
	o => \DebugD[0]~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\DebugD[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcD|oDebug\(1),
	devoe => ww_devoe,
	o => \DebugD[1]~output_o\);

-- Location: IOOBUF_X40_Y34_N2
\DebugG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcG|oDebug\(0),
	devoe => ww_devoe,
	o => \DebugG[0]~output_o\);

-- Location: IOOBUF_X49_Y34_N9
\DebugG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rcG|oDebug\(1),
	devoe => ww_devoe,
	o => \DebugG[1]~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\iClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: CLKCTRL_G18
\iClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iClk~inputclkctrl_outclk\);

-- Location: LCCOMB_X47_Y17_N2
\rcD|U0|cnt_1[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[0]~8_combout\ = \rcD|U0|cnt_1\(0) $ (VCC)
-- \rcD|U0|cnt_1[0]~9\ = CARRY(\rcD|U0|cnt_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt_1\(0),
	datad => VCC,
	combout => \rcD|U0|cnt_1[0]~8_combout\,
	cout => \rcD|U0|cnt_1[0]~9\);

-- Location: IOIBUF_X53_Y14_N1
\iRst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iRst,
	o => \iRst~input_o\);

-- Location: LCCOMB_X48_Y17_N10
\rcD|U0|cnt[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[0]~8_combout\ = \rcD|U0|cnt\(0) $ (VCC)
-- \rcD|U0|cnt[0]~9\ = CARRY(\rcD|U0|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt\(0),
	datad => VCC,
	combout => \rcD|U0|cnt[0]~8_combout\,
	cout => \rcD|U0|cnt[0]~9\);

-- Location: FF_X48_Y17_N11
\rcD|U0|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[0]~8_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(0));

-- Location: LCCOMB_X48_Y17_N12
\rcD|U0|cnt[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[1]~10_combout\ = (\rcD|U0|cnt\(1) & (!\rcD|U0|cnt[0]~9\)) # (!\rcD|U0|cnt\(1) & ((\rcD|U0|cnt[0]~9\) # (GND)))
-- \rcD|U0|cnt[1]~11\ = CARRY((!\rcD|U0|cnt[0]~9\) # (!\rcD|U0|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt\(1),
	datad => VCC,
	cin => \rcD|U0|cnt[0]~9\,
	combout => \rcD|U0|cnt[1]~10_combout\,
	cout => \rcD|U0|cnt[1]~11\);

-- Location: FF_X48_Y17_N13
\rcD|U0|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[1]~10_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(1));

-- Location: LCCOMB_X48_Y17_N14
\rcD|U0|cnt[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[2]~12_combout\ = (\rcD|U0|cnt\(2) & (\rcD|U0|cnt[1]~11\ $ (GND))) # (!\rcD|U0|cnt\(2) & (!\rcD|U0|cnt[1]~11\ & VCC))
-- \rcD|U0|cnt[2]~13\ = CARRY((\rcD|U0|cnt\(2) & !\rcD|U0|cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(2),
	datad => VCC,
	cin => \rcD|U0|cnt[1]~11\,
	combout => \rcD|U0|cnt[2]~12_combout\,
	cout => \rcD|U0|cnt[2]~13\);

-- Location: FF_X48_Y17_N15
\rcD|U0|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[2]~12_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(2));

-- Location: LCCOMB_X48_Y17_N16
\rcD|U0|cnt[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[3]~14_combout\ = (\rcD|U0|cnt\(3) & (!\rcD|U0|cnt[2]~13\)) # (!\rcD|U0|cnt\(3) & ((\rcD|U0|cnt[2]~13\) # (GND)))
-- \rcD|U0|cnt[3]~15\ = CARRY((!\rcD|U0|cnt[2]~13\) # (!\rcD|U0|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(3),
	datad => VCC,
	cin => \rcD|U0|cnt[2]~13\,
	combout => \rcD|U0|cnt[3]~14_combout\,
	cout => \rcD|U0|cnt[3]~15\);

-- Location: FF_X48_Y17_N17
\rcD|U0|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[3]~14_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(3));

-- Location: LCCOMB_X48_Y17_N18
\rcD|U0|cnt[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[4]~16_combout\ = (\rcD|U0|cnt\(4) & (\rcD|U0|cnt[3]~15\ $ (GND))) # (!\rcD|U0|cnt\(4) & (!\rcD|U0|cnt[3]~15\ & VCC))
-- \rcD|U0|cnt[4]~17\ = CARRY((\rcD|U0|cnt\(4) & !\rcD|U0|cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(4),
	datad => VCC,
	cin => \rcD|U0|cnt[3]~15\,
	combout => \rcD|U0|cnt[4]~16_combout\,
	cout => \rcD|U0|cnt[4]~17\);

-- Location: FF_X48_Y17_N19
\rcD|U0|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[4]~16_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(4));

-- Location: LCCOMB_X48_Y17_N20
\rcD|U0|cnt[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[5]~18_combout\ = (\rcD|U0|cnt\(5) & (!\rcD|U0|cnt[4]~17\)) # (!\rcD|U0|cnt\(5) & ((\rcD|U0|cnt[4]~17\) # (GND)))
-- \rcD|U0|cnt[5]~19\ = CARRY((!\rcD|U0|cnt[4]~17\) # (!\rcD|U0|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(5),
	datad => VCC,
	cin => \rcD|U0|cnt[4]~17\,
	combout => \rcD|U0|cnt[5]~18_combout\,
	cout => \rcD|U0|cnt[5]~19\);

-- Location: FF_X48_Y17_N21
\rcD|U0|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[5]~18_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(5));

-- Location: LCCOMB_X48_Y17_N22
\rcD|U0|cnt[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[6]~20_combout\ = (\rcD|U0|cnt\(6) & (\rcD|U0|cnt[5]~19\ $ (GND))) # (!\rcD|U0|cnt\(6) & (!\rcD|U0|cnt[5]~19\ & VCC))
-- \rcD|U0|cnt[6]~21\ = CARRY((\rcD|U0|cnt\(6) & !\rcD|U0|cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(6),
	datad => VCC,
	cin => \rcD|U0|cnt[5]~19\,
	combout => \rcD|U0|cnt[6]~20_combout\,
	cout => \rcD|U0|cnt[6]~21\);

-- Location: FF_X48_Y17_N23
\rcD|U0|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[6]~20_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(6));

-- Location: LCCOMB_X48_Y17_N24
\rcD|U0|cnt[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt[7]~22_combout\ = \rcD|U0|cnt[6]~21\ $ (\rcD|U0|cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \rcD|U0|cnt\(7),
	cin => \rcD|U0|cnt[6]~21\,
	combout => \rcD|U0|cnt[7]~22_combout\);

-- Location: FF_X48_Y17_N25
\rcD|U0|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt[7]~22_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt\(7));

-- Location: LCCOMB_X48_Y17_N6
\rcG|U0|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|Equal0~1_combout\ = (\rcD|U0|cnt\(5)) # ((\rcD|U0|cnt\(4)) # ((\rcD|U0|cnt\(6)) # (\rcD|U0|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(5),
	datab => \rcD|U0|cnt\(4),
	datac => \rcD|U0|cnt\(6),
	datad => \rcD|U0|cnt\(7),
	combout => \rcG|U0|Equal0~1_combout\);

-- Location: LCCOMB_X48_Y17_N8
\rcG|U0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|Equal0~0_combout\ = ((\rcD|U0|cnt\(3)) # ((\rcD|U0|cnt\(2)) # (!\rcD|U0|cnt\(0)))) # (!\rcD|U0|cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt\(1),
	datab => \rcD|U0|cnt\(3),
	datac => \rcD|U0|cnt\(2),
	datad => \rcD|U0|cnt\(0),
	combout => \rcG|U0|Equal0~0_combout\);

-- Location: LCCOMB_X49_Y17_N0
\rcG|U1|CodeurFil~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|CodeurFil~0_combout\ = ((!\rcG|U0|Equal0~1_combout\ & !\rcG|U0|Equal0~0_combout\)) # (!\iRst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst~input_o\,
	datac => \rcG|U0|Equal0~1_combout\,
	datad => \rcG|U0|Equal0~0_combout\,
	combout => \rcG|U1|CodeurFil~0_combout\);

-- Location: IOIBUF_X31_Y34_N1
\icodeurAD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_icodeurAD,
	o => \icodeurAD~input_o\);

-- Location: LCCOMB_X47_Y17_N0
\rcD|U0|cnt_1[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[7]~12_combout\ = (\icodeurAD~input_o\) # (((!\rcG|U0|Equal0~0_combout\ & !\rcG|U0|Equal0~1_combout\)) # (!\iRst~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \icodeurAD~input_o\,
	datab => \rcG|U0|Equal0~0_combout\,
	datac => \iRst~input_o\,
	datad => \rcG|U0|Equal0~1_combout\,
	combout => \rcD|U0|cnt_1[7]~12_combout\);

-- Location: FF_X47_Y17_N3
\rcD|U0|cnt_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[0]~8_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(0));

-- Location: LCCOMB_X47_Y17_N4
\rcD|U0|cnt_1[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[1]~10_combout\ = (\rcD|U0|cnt_1\(1) & (!\rcD|U0|cnt_1[0]~9\)) # (!\rcD|U0|cnt_1\(1) & ((\rcD|U0|cnt_1[0]~9\) # (GND)))
-- \rcD|U0|cnt_1[1]~11\ = CARRY((!\rcD|U0|cnt_1[0]~9\) # (!\rcD|U0|cnt_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt_1\(1),
	datad => VCC,
	cin => \rcD|U0|cnt_1[0]~9\,
	combout => \rcD|U0|cnt_1[1]~10_combout\,
	cout => \rcD|U0|cnt_1[1]~11\);

-- Location: FF_X47_Y17_N5
\rcD|U0|cnt_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[1]~10_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(1));

-- Location: LCCOMB_X47_Y17_N6
\rcD|U0|cnt_1[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[2]~13_combout\ = (\rcD|U0|cnt_1\(2) & (\rcD|U0|cnt_1[1]~11\ $ (GND))) # (!\rcD|U0|cnt_1\(2) & (!\rcD|U0|cnt_1[1]~11\ & VCC))
-- \rcD|U0|cnt_1[2]~14\ = CARRY((\rcD|U0|cnt_1\(2) & !\rcD|U0|cnt_1[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt_1\(2),
	datad => VCC,
	cin => \rcD|U0|cnt_1[1]~11\,
	combout => \rcD|U0|cnt_1[2]~13_combout\,
	cout => \rcD|U0|cnt_1[2]~14\);

-- Location: FF_X47_Y17_N7
\rcD|U0|cnt_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[2]~13_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(2));

-- Location: LCCOMB_X47_Y17_N8
\rcD|U0|cnt_1[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[3]~15_combout\ = (\rcD|U0|cnt_1\(3) & (!\rcD|U0|cnt_1[2]~14\)) # (!\rcD|U0|cnt_1\(3) & ((\rcD|U0|cnt_1[2]~14\) # (GND)))
-- \rcD|U0|cnt_1[3]~16\ = CARRY((!\rcD|U0|cnt_1[2]~14\) # (!\rcD|U0|cnt_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt_1\(3),
	datad => VCC,
	cin => \rcD|U0|cnt_1[2]~14\,
	combout => \rcD|U0|cnt_1[3]~15_combout\,
	cout => \rcD|U0|cnt_1[3]~16\);

-- Location: FF_X47_Y17_N9
\rcD|U0|cnt_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[3]~15_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(3));

-- Location: LCCOMB_X47_Y17_N10
\rcD|U0|cnt_1[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[4]~17_combout\ = (\rcD|U0|cnt_1\(4) & (\rcD|U0|cnt_1[3]~16\ $ (GND))) # (!\rcD|U0|cnt_1\(4) & (!\rcD|U0|cnt_1[3]~16\ & VCC))
-- \rcD|U0|cnt_1[4]~18\ = CARRY((\rcD|U0|cnt_1\(4) & !\rcD|U0|cnt_1[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt_1\(4),
	datad => VCC,
	cin => \rcD|U0|cnt_1[3]~16\,
	combout => \rcD|U0|cnt_1[4]~17_combout\,
	cout => \rcD|U0|cnt_1[4]~18\);

-- Location: FF_X47_Y17_N11
\rcD|U0|cnt_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[4]~17_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(4));

-- Location: LCCOMB_X47_Y17_N12
\rcD|U0|cnt_1[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[5]~19_combout\ = (\rcD|U0|cnt_1\(5) & (!\rcD|U0|cnt_1[4]~18\)) # (!\rcD|U0|cnt_1\(5) & ((\rcD|U0|cnt_1[4]~18\) # (GND)))
-- \rcD|U0|cnt_1[5]~20\ = CARRY((!\rcD|U0|cnt_1[4]~18\) # (!\rcD|U0|cnt_1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt_1\(5),
	datad => VCC,
	cin => \rcD|U0|cnt_1[4]~18\,
	combout => \rcD|U0|cnt_1[5]~19_combout\,
	cout => \rcD|U0|cnt_1[5]~20\);

-- Location: FF_X47_Y17_N13
\rcD|U0|cnt_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[5]~19_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(5));

-- Location: LCCOMB_X47_Y17_N14
\rcD|U0|cnt_1[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[6]~21_combout\ = (\rcD|U0|cnt_1\(6) & (\rcD|U0|cnt_1[5]~20\ $ (GND))) # (!\rcD|U0|cnt_1\(6) & (!\rcD|U0|cnt_1[5]~20\ & VCC))
-- \rcD|U0|cnt_1[6]~22\ = CARRY((\rcD|U0|cnt_1\(6) & !\rcD|U0|cnt_1[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U0|cnt_1\(6),
	datad => VCC,
	cin => \rcD|U0|cnt_1[5]~20\,
	combout => \rcD|U0|cnt_1[6]~21_combout\,
	cout => \rcD|U0|cnt_1[6]~22\);

-- Location: FF_X47_Y17_N15
\rcD|U0|cnt_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[6]~21_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(6));

-- Location: LCCOMB_X47_Y17_N16
\rcD|U0|cnt_1[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|cnt_1[7]~23_combout\ = \rcD|U0|cnt_1[6]~22\ $ (\rcD|U0|cnt_1\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \rcD|U0|cnt_1\(7),
	cin => \rcD|U0|cnt_1[6]~22\,
	combout => \rcD|U0|cnt_1[7]~23_combout\);

-- Location: FF_X47_Y17_N17
\rcD|U0|cnt_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|cnt_1[7]~23_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U0|cnt_1[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|cnt_1\(7));

-- Location: LCCOMB_X47_Y17_N28
\rcD|U0|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|LessThan0~0_combout\ = (\rcD|U0|cnt_1\(2)) # ((\rcD|U0|cnt_1\(3)) # ((\rcD|U0|cnt_1\(1)) # (\rcD|U0|cnt_1\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt_1\(2),
	datab => \rcD|U0|cnt_1\(3),
	datac => \rcD|U0|cnt_1\(1),
	datad => \rcD|U0|cnt_1\(4),
	combout => \rcD|U0|LessThan0~0_combout\);

-- Location: LCCOMB_X47_Y17_N22
\rcD|U0|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|LessThan0~1_combout\ = (\rcD|U0|cnt_1\(5)) # ((\rcD|U0|cnt_1\(7)) # ((\rcD|U0|cnt_1\(6)) # (\rcD|U0|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|cnt_1\(5),
	datab => \rcD|U0|cnt_1\(7),
	datac => \rcD|U0|cnt_1\(6),
	datad => \rcD|U0|LessThan0~0_combout\,
	combout => \rcD|U0|LessThan0~1_combout\);

-- Location: LCCOMB_X52_Y17_N6
\rcD|U0|CodeurFil~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U0|CodeurFil~feeder_combout\ = \rcD|U0|LessThan0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rcD|U0|LessThan0~1_combout\,
	combout => \rcD|U0|CodeurFil~feeder_combout\);

-- Location: FF_X52_Y17_N7
\rcD|U0|CodeurFil\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U0|CodeurFil~feeder_combout\,
	asdata => \icodeurAD~input_o\,
	sload => \ALT_INV_iRst~input_o\,
	ena => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U0|CodeurFil~q\);

-- Location: LCCOMB_X50_Y17_N8
\rcD|U1|cnt_1[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[0]~8_combout\ = \rcD|U1|cnt_1\(0) $ (VCC)
-- \rcD|U1|cnt_1[0]~9\ = CARRY(\rcD|U1|cnt_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U1|cnt_1\(0),
	datad => VCC,
	combout => \rcD|U1|cnt_1[0]~8_combout\,
	cout => \rcD|U1|cnt_1[0]~9\);

-- Location: IOIBUF_X45_Y34_N8
\icodeurBD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_icodeurBD,
	o => \icodeurBD~input_o\);

-- Location: LCCOMB_X50_Y17_N24
\rcD|U1|cnt_1[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[3]~12_combout\ = ((\icodeurBD~input_o\) # ((!\rcG|U0|Equal0~1_combout\ & !\rcG|U0|Equal0~0_combout\))) # (!\iRst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst~input_o\,
	datab => \icodeurBD~input_o\,
	datac => \rcG|U0|Equal0~1_combout\,
	datad => \rcG|U0|Equal0~0_combout\,
	combout => \rcD|U1|cnt_1[3]~12_combout\);

-- Location: FF_X50_Y17_N9
\rcD|U1|cnt_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[0]~8_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(0));

-- Location: LCCOMB_X50_Y17_N10
\rcD|U1|cnt_1[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[1]~10_combout\ = (\rcD|U1|cnt_1\(1) & (!\rcD|U1|cnt_1[0]~9\)) # (!\rcD|U1|cnt_1\(1) & ((\rcD|U1|cnt_1[0]~9\) # (GND)))
-- \rcD|U1|cnt_1[1]~11\ = CARRY((!\rcD|U1|cnt_1[0]~9\) # (!\rcD|U1|cnt_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|cnt_1\(1),
	datad => VCC,
	cin => \rcD|U1|cnt_1[0]~9\,
	combout => \rcD|U1|cnt_1[1]~10_combout\,
	cout => \rcD|U1|cnt_1[1]~11\);

-- Location: FF_X50_Y17_N11
\rcD|U1|cnt_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[1]~10_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(1));

-- Location: LCCOMB_X50_Y17_N12
\rcD|U1|cnt_1[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[2]~13_combout\ = (\rcD|U1|cnt_1\(2) & (\rcD|U1|cnt_1[1]~11\ $ (GND))) # (!\rcD|U1|cnt_1\(2) & (!\rcD|U1|cnt_1[1]~11\ & VCC))
-- \rcD|U1|cnt_1[2]~14\ = CARRY((\rcD|U1|cnt_1\(2) & !\rcD|U1|cnt_1[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|cnt_1\(2),
	datad => VCC,
	cin => \rcD|U1|cnt_1[1]~11\,
	combout => \rcD|U1|cnt_1[2]~13_combout\,
	cout => \rcD|U1|cnt_1[2]~14\);

-- Location: FF_X50_Y17_N13
\rcD|U1|cnt_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[2]~13_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(2));

-- Location: LCCOMB_X50_Y17_N14
\rcD|U1|cnt_1[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[3]~15_combout\ = (\rcD|U1|cnt_1\(3) & (!\rcD|U1|cnt_1[2]~14\)) # (!\rcD|U1|cnt_1\(3) & ((\rcD|U1|cnt_1[2]~14\) # (GND)))
-- \rcD|U1|cnt_1[3]~16\ = CARRY((!\rcD|U1|cnt_1[2]~14\) # (!\rcD|U1|cnt_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U1|cnt_1\(3),
	datad => VCC,
	cin => \rcD|U1|cnt_1[2]~14\,
	combout => \rcD|U1|cnt_1[3]~15_combout\,
	cout => \rcD|U1|cnt_1[3]~16\);

-- Location: FF_X50_Y17_N15
\rcD|U1|cnt_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[3]~15_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(3));

-- Location: LCCOMB_X50_Y17_N16
\rcD|U1|cnt_1[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[4]~17_combout\ = (\rcD|U1|cnt_1\(4) & (\rcD|U1|cnt_1[3]~16\ $ (GND))) # (!\rcD|U1|cnt_1\(4) & (!\rcD|U1|cnt_1[3]~16\ & VCC))
-- \rcD|U1|cnt_1[4]~18\ = CARRY((\rcD|U1|cnt_1\(4) & !\rcD|U1|cnt_1[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U1|cnt_1\(4),
	datad => VCC,
	cin => \rcD|U1|cnt_1[3]~16\,
	combout => \rcD|U1|cnt_1[4]~17_combout\,
	cout => \rcD|U1|cnt_1[4]~18\);

-- Location: FF_X50_Y17_N17
\rcD|U1|cnt_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[4]~17_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(4));

-- Location: LCCOMB_X50_Y17_N18
\rcD|U1|cnt_1[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[5]~19_combout\ = (\rcD|U1|cnt_1\(5) & (!\rcD|U1|cnt_1[4]~18\)) # (!\rcD|U1|cnt_1\(5) & ((\rcD|U1|cnt_1[4]~18\) # (GND)))
-- \rcD|U1|cnt_1[5]~20\ = CARRY((!\rcD|U1|cnt_1[4]~18\) # (!\rcD|U1|cnt_1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U1|cnt_1\(5),
	datad => VCC,
	cin => \rcD|U1|cnt_1[4]~18\,
	combout => \rcD|U1|cnt_1[5]~19_combout\,
	cout => \rcD|U1|cnt_1[5]~20\);

-- Location: FF_X50_Y17_N19
\rcD|U1|cnt_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[5]~19_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(5));

-- Location: LCCOMB_X50_Y17_N20
\rcD|U1|cnt_1[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[6]~21_combout\ = (\rcD|U1|cnt_1\(6) & (\rcD|U1|cnt_1[5]~20\ $ (GND))) # (!\rcD|U1|cnt_1\(6) & (!\rcD|U1|cnt_1[5]~20\ & VCC))
-- \rcD|U1|cnt_1[6]~22\ = CARRY((\rcD|U1|cnt_1\(6) & !\rcD|U1|cnt_1[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcD|U1|cnt_1\(6),
	datad => VCC,
	cin => \rcD|U1|cnt_1[5]~20\,
	combout => \rcD|U1|cnt_1[6]~21_combout\,
	cout => \rcD|U1|cnt_1[6]~22\);

-- Location: FF_X50_Y17_N21
\rcD|U1|cnt_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[6]~21_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(6));

-- Location: LCCOMB_X50_Y17_N22
\rcD|U1|cnt_1[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|cnt_1[7]~23_combout\ = \rcD|U1|cnt_1\(7) $ (\rcD|U1|cnt_1[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|cnt_1\(7),
	cin => \rcD|U1|cnt_1[6]~22\,
	combout => \rcD|U1|cnt_1[7]~23_combout\);

-- Location: FF_X50_Y17_N23
\rcD|U1|cnt_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcD|U1|cnt_1[7]~23_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcD|U1|cnt_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|cnt_1\(7));

-- Location: LCCOMB_X50_Y17_N4
\rcD|U1|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|LessThan0~0_combout\ = (\rcD|U1|cnt_1\(2)) # ((\rcD|U1|cnt_1\(4)) # ((\rcD|U1|cnt_1\(3)) # (\rcD|U1|cnt_1\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|cnt_1\(2),
	datab => \rcD|U1|cnt_1\(4),
	datac => \rcD|U1|cnt_1\(3),
	datad => \rcD|U1|cnt_1\(1),
	combout => \rcD|U1|LessThan0~0_combout\);

-- Location: LCCOMB_X50_Y17_N26
\rcD|U1|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|LessThan0~1_combout\ = (\rcD|U1|cnt_1\(7)) # ((\rcD|U1|cnt_1\(5)) # ((\rcD|U1|LessThan0~0_combout\) # (\rcD|U1|cnt_1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|cnt_1\(7),
	datab => \rcD|U1|cnt_1\(5),
	datac => \rcD|U1|LessThan0~0_combout\,
	datad => \rcD|U1|cnt_1\(6),
	combout => \rcD|U1|LessThan0~1_combout\);

-- Location: LCCOMB_X51_Y14_N14
\rcD|U1|CodeurFil~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|U1|CodeurFil~feeder_combout\ = \rcD|U1|LessThan0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rcD|U1|LessThan0~1_combout\,
	combout => \rcD|U1|CodeurFil~feeder_combout\);

-- Location: FF_X51_Y14_N15
\rcD|U1|CodeurFil\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcD|U1|CodeurFil~feeder_combout\,
	asdata => \icodeurBD~input_o\,
	sload => \ALT_INV_iRst~input_o\,
	ena => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|U1|CodeurFil~q\);

-- Location: LCCOMB_X52_Y17_N4
\rcD|oImp\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oImp~combout\ = LCELL((\iRst~input_o\ & (\rcD|U0|CodeurFil~q\ $ (!\rcD|U1|CodeurFil~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U0|CodeurFil~q\,
	datac => \iRst~input_o\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|oImp~combout\);

-- Location: CLKCTRL_G5
\rcD|oImp~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rcD|oImp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rcD|oImp~clkctrl_outclk\);

-- Location: LCCOMB_X52_Y16_N4
\clk_divD|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~0_combout\ = \clk_divD|bCount_Next\(0) $ (VCC)
-- \clk_divD|Add0~1\ = CARRY(\clk_divD|bCount_Next\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(0),
	datad => VCC,
	combout => \clk_divD|Add0~0_combout\,
	cout => \clk_divD|Add0~1\);

-- Location: LCCOMB_X52_Y16_N6
\clk_divD|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~2_combout\ = (\clk_divD|bCount_Next\(1) & (!\clk_divD|Add0~1\)) # (!\clk_divD|bCount_Next\(1) & ((\clk_divD|Add0~1\) # (GND)))
-- \clk_divD|Add0~3\ = CARRY((!\clk_divD|Add0~1\) # (!\clk_divD|bCount_Next\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|bCount_Next\(1),
	datad => VCC,
	cin => \clk_divD|Add0~1\,
	combout => \clk_divD|Add0~2_combout\,
	cout => \clk_divD|Add0~3\);

-- Location: FF_X52_Y16_N7
\clk_divD|bCount_Next[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~2_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(1));

-- Location: LCCOMB_X52_Y16_N8
\clk_divD|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~4_combout\ = (\clk_divD|bCount_Next\(2) & (\clk_divD|Add0~3\ $ (GND))) # (!\clk_divD|bCount_Next\(2) & (!\clk_divD|Add0~3\ & VCC))
-- \clk_divD|Add0~5\ = CARRY((\clk_divD|bCount_Next\(2) & !\clk_divD|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(2),
	datad => VCC,
	cin => \clk_divD|Add0~3\,
	combout => \clk_divD|Add0~4_combout\,
	cout => \clk_divD|Add0~5\);

-- Location: LCCOMB_X52_Y16_N0
\clk_divD|bCount_Next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|bCount_Next~0_combout\ = (\clk_divD|Add0~4_combout\ & ((!\clk_divD|Equal0~0_combout\) # (!\clk_divD|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|Equal0~1_combout\,
	datab => \clk_divD|Equal0~0_combout\,
	datad => \clk_divD|Add0~4_combout\,
	combout => \clk_divD|bCount_Next~0_combout\);

-- Location: FF_X52_Y16_N1
\clk_divD|bCount_Next[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|bCount_Next~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(2));

-- Location: LCCOMB_X52_Y16_N10
\clk_divD|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~6_combout\ = (\clk_divD|bCount_Next\(3) & (!\clk_divD|Add0~5\)) # (!\clk_divD|bCount_Next\(3) & ((\clk_divD|Add0~5\) # (GND)))
-- \clk_divD|Add0~7\ = CARRY((!\clk_divD|Add0~5\) # (!\clk_divD|bCount_Next\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(3),
	datad => VCC,
	cin => \clk_divD|Add0~5\,
	combout => \clk_divD|Add0~6_combout\,
	cout => \clk_divD|Add0~7\);

-- Location: FF_X52_Y16_N11
\clk_divD|bCount_Next[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~6_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(3));

-- Location: LCCOMB_X52_Y16_N12
\clk_divD|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~8_combout\ = (\clk_divD|bCount_Next\(4) & (\clk_divD|Add0~7\ $ (GND))) # (!\clk_divD|bCount_Next\(4) & (!\clk_divD|Add0~7\ & VCC))
-- \clk_divD|Add0~9\ = CARRY((\clk_divD|bCount_Next\(4) & !\clk_divD|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(4),
	datad => VCC,
	cin => \clk_divD|Add0~7\,
	combout => \clk_divD|Add0~8_combout\,
	cout => \clk_divD|Add0~9\);

-- Location: FF_X52_Y16_N13
\clk_divD|bCount_Next[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~8_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(4));

-- Location: LCCOMB_X52_Y16_N14
\clk_divD|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~10_combout\ = (\clk_divD|bCount_Next\(5) & (!\clk_divD|Add0~9\)) # (!\clk_divD|bCount_Next\(5) & ((\clk_divD|Add0~9\) # (GND)))
-- \clk_divD|Add0~11\ = CARRY((!\clk_divD|Add0~9\) # (!\clk_divD|bCount_Next\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(5),
	datad => VCC,
	cin => \clk_divD|Add0~9\,
	combout => \clk_divD|Add0~10_combout\,
	cout => \clk_divD|Add0~11\);

-- Location: FF_X52_Y16_N15
\clk_divD|bCount_Next[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~10_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(5));

-- Location: LCCOMB_X52_Y16_N16
\clk_divD|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~12_combout\ = (\clk_divD|bCount_Next\(6) & (\clk_divD|Add0~11\ $ (GND))) # (!\clk_divD|bCount_Next\(6) & (!\clk_divD|Add0~11\ & VCC))
-- \clk_divD|Add0~13\ = CARRY((\clk_divD|bCount_Next\(6) & !\clk_divD|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(6),
	datad => VCC,
	cin => \clk_divD|Add0~11\,
	combout => \clk_divD|Add0~12_combout\,
	cout => \clk_divD|Add0~13\);

-- Location: FF_X52_Y16_N17
\clk_divD|bCount_Next[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~12_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(6));

-- Location: LCCOMB_X52_Y16_N18
\clk_divD|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Add0~14_combout\ = \clk_divD|bCount_Next\(7) $ (\clk_divD|Add0~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divD|bCount_Next\(7),
	cin => \clk_divD|Add0~13\,
	combout => \clk_divD|Add0~14_combout\);

-- Location: FF_X52_Y16_N19
\clk_divD|bCount_Next[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|Add0~14_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(7));

-- Location: LCCOMB_X52_Y16_N26
\clk_divD|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Equal0~0_combout\ = (!\clk_divD|bCount_Next\(5) & (!\clk_divD|bCount_Next\(4) & (!\clk_divD|bCount_Next\(6) & !\clk_divD|bCount_Next\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|bCount_Next\(5),
	datab => \clk_divD|bCount_Next\(4),
	datac => \clk_divD|bCount_Next\(6),
	datad => \clk_divD|bCount_Next\(7),
	combout => \clk_divD|Equal0~0_combout\);

-- Location: LCCOMB_X52_Y16_N22
\clk_divD|bCount_Next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|bCount_Next~1_combout\ = (\clk_divD|Add0~0_combout\ & ((!\clk_divD|Equal0~0_combout\) # (!\clk_divD|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|Equal0~1_combout\,
	datab => \clk_divD|Equal0~0_combout\,
	datac => \clk_divD|Add0~0_combout\,
	combout => \clk_divD|bCount_Next~1_combout\);

-- Location: FF_X52_Y16_N23
\clk_divD|bCount_Next[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|bCount_Next~1_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bCount_Next\(0));

-- Location: LCCOMB_X52_Y16_N24
\clk_divD|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|Equal0~1_combout\ = (!\clk_divD|bCount_Next\(0) & (!\clk_divD|bCount_Next\(3) & (\clk_divD|bCount_Next\(2) & !\clk_divD|bCount_Next\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|bCount_Next\(0),
	datab => \clk_divD|bCount_Next\(3),
	datac => \clk_divD|bCount_Next\(2),
	datad => \clk_divD|bCount_Next\(1),
	combout => \clk_divD|Equal0~1_combout\);

-- Location: LCCOMB_X52_Y16_N28
\clk_divD|bNew_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divD|bNew_clk~0_combout\ = \clk_divD|bNew_clk~q\ $ (((\clk_divD|Equal0~1_combout\ & \clk_divD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divD|Equal0~1_combout\,
	datab => \clk_divD|Equal0~0_combout\,
	datac => \clk_divD|bNew_clk~q\,
	combout => \clk_divD|bNew_clk~0_combout\);

-- Location: FF_X52_Y16_N29
\clk_divD|bNew_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcD|oImp~clkctrl_outclk\,
	d => \clk_divD|bNew_clk~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divD|bNew_clk~q\);

-- Location: LCCOMB_X51_Y17_N0
\rcG|U0|cnt_1[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[0]~8_combout\ = \rcG|U0|cnt_1\(0) $ (VCC)
-- \rcG|U0|cnt_1[0]~9\ = CARRY(\rcG|U0|cnt_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U0|cnt_1\(0),
	datad => VCC,
	combout => \rcG|U0|cnt_1[0]~8_combout\,
	cout => \rcG|U0|cnt_1[0]~9\);

-- Location: IOIBUF_X38_Y34_N1
\icodeurAG~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_icodeurAG,
	o => \icodeurAG~input_o\);

-- Location: LCCOMB_X51_Y17_N16
\rcG|U0|cnt_1[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[0]~12_combout\ = ((\icodeurAG~input_o\) # ((!\rcG|U0|Equal0~1_combout\ & !\rcG|U0|Equal0~0_combout\))) # (!\iRst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst~input_o\,
	datab => \icodeurAG~input_o\,
	datac => \rcG|U0|Equal0~1_combout\,
	datad => \rcG|U0|Equal0~0_combout\,
	combout => \rcG|U0|cnt_1[0]~12_combout\);

-- Location: FF_X51_Y17_N1
\rcG|U0|cnt_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[0]~8_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(0));

-- Location: LCCOMB_X51_Y17_N2
\rcG|U0|cnt_1[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[1]~10_combout\ = (\rcG|U0|cnt_1\(1) & (!\rcG|U0|cnt_1[0]~9\)) # (!\rcG|U0|cnt_1\(1) & ((\rcG|U0|cnt_1[0]~9\) # (GND)))
-- \rcG|U0|cnt_1[1]~11\ = CARRY((!\rcG|U0|cnt_1[0]~9\) # (!\rcG|U0|cnt_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U0|cnt_1\(1),
	datad => VCC,
	cin => \rcG|U0|cnt_1[0]~9\,
	combout => \rcG|U0|cnt_1[1]~10_combout\,
	cout => \rcG|U0|cnt_1[1]~11\);

-- Location: FF_X51_Y17_N3
\rcG|U0|cnt_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[1]~10_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(1));

-- Location: LCCOMB_X51_Y17_N4
\rcG|U0|cnt_1[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[2]~13_combout\ = (\rcG|U0|cnt_1\(2) & (\rcG|U0|cnt_1[1]~11\ $ (GND))) # (!\rcG|U0|cnt_1\(2) & (!\rcG|U0|cnt_1[1]~11\ & VCC))
-- \rcG|U0|cnt_1[2]~14\ = CARRY((\rcG|U0|cnt_1\(2) & !\rcG|U0|cnt_1[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U0|cnt_1\(2),
	datad => VCC,
	cin => \rcG|U0|cnt_1[1]~11\,
	combout => \rcG|U0|cnt_1[2]~13_combout\,
	cout => \rcG|U0|cnt_1[2]~14\);

-- Location: FF_X51_Y17_N5
\rcG|U0|cnt_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[2]~13_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(2));

-- Location: LCCOMB_X51_Y17_N6
\rcG|U0|cnt_1[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[3]~15_combout\ = (\rcG|U0|cnt_1\(3) & (!\rcG|U0|cnt_1[2]~14\)) # (!\rcG|U0|cnt_1\(3) & ((\rcG|U0|cnt_1[2]~14\) # (GND)))
-- \rcG|U0|cnt_1[3]~16\ = CARRY((!\rcG|U0|cnt_1[2]~14\) # (!\rcG|U0|cnt_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|cnt_1\(3),
	datad => VCC,
	cin => \rcG|U0|cnt_1[2]~14\,
	combout => \rcG|U0|cnt_1[3]~15_combout\,
	cout => \rcG|U0|cnt_1[3]~16\);

-- Location: FF_X51_Y17_N7
\rcG|U0|cnt_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[3]~15_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(3));

-- Location: LCCOMB_X51_Y17_N8
\rcG|U0|cnt_1[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[4]~17_combout\ = (\rcG|U0|cnt_1\(4) & (\rcG|U0|cnt_1[3]~16\ $ (GND))) # (!\rcG|U0|cnt_1\(4) & (!\rcG|U0|cnt_1[3]~16\ & VCC))
-- \rcG|U0|cnt_1[4]~18\ = CARRY((\rcG|U0|cnt_1\(4) & !\rcG|U0|cnt_1[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U0|cnt_1\(4),
	datad => VCC,
	cin => \rcG|U0|cnt_1[3]~16\,
	combout => \rcG|U0|cnt_1[4]~17_combout\,
	cout => \rcG|U0|cnt_1[4]~18\);

-- Location: FF_X51_Y17_N9
\rcG|U0|cnt_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[4]~17_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(4));

-- Location: LCCOMB_X51_Y17_N10
\rcG|U0|cnt_1[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[5]~19_combout\ = (\rcG|U0|cnt_1\(5) & (!\rcG|U0|cnt_1[4]~18\)) # (!\rcG|U0|cnt_1\(5) & ((\rcG|U0|cnt_1[4]~18\) # (GND)))
-- \rcG|U0|cnt_1[5]~20\ = CARRY((!\rcG|U0|cnt_1[4]~18\) # (!\rcG|U0|cnt_1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|cnt_1\(5),
	datad => VCC,
	cin => \rcG|U0|cnt_1[4]~18\,
	combout => \rcG|U0|cnt_1[5]~19_combout\,
	cout => \rcG|U0|cnt_1[5]~20\);

-- Location: FF_X51_Y17_N11
\rcG|U0|cnt_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[5]~19_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(5));

-- Location: LCCOMB_X51_Y17_N28
\rcG|U0|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|LessThan0~0_combout\ = (\rcG|U0|cnt_1\(3)) # ((\rcG|U0|cnt_1\(4)) # ((\rcG|U0|cnt_1\(2)) # (\rcG|U0|cnt_1\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|cnt_1\(3),
	datab => \rcG|U0|cnt_1\(4),
	datac => \rcG|U0|cnt_1\(2),
	datad => \rcG|U0|cnt_1\(1),
	combout => \rcG|U0|LessThan0~0_combout\);

-- Location: LCCOMB_X51_Y17_N12
\rcG|U0|cnt_1[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[6]~21_combout\ = (\rcG|U0|cnt_1\(6) & (\rcG|U0|cnt_1[5]~20\ $ (GND))) # (!\rcG|U0|cnt_1\(6) & (!\rcG|U0|cnt_1[5]~20\ & VCC))
-- \rcG|U0|cnt_1[6]~22\ = CARRY((\rcG|U0|cnt_1\(6) & !\rcG|U0|cnt_1[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|cnt_1\(6),
	datad => VCC,
	cin => \rcG|U0|cnt_1[5]~20\,
	combout => \rcG|U0|cnt_1[6]~21_combout\,
	cout => \rcG|U0|cnt_1[6]~22\);

-- Location: FF_X51_Y17_N13
\rcG|U0|cnt_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[6]~21_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(6));

-- Location: LCCOMB_X51_Y17_N14
\rcG|U0|cnt_1[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|cnt_1[7]~23_combout\ = \rcG|U0|cnt_1\(7) $ (\rcG|U0|cnt_1[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U0|cnt_1\(7),
	cin => \rcG|U0|cnt_1[6]~22\,
	combout => \rcG|U0|cnt_1[7]~23_combout\);

-- Location: FF_X51_Y17_N15
\rcG|U0|cnt_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|cnt_1[7]~23_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U0|cnt_1[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|cnt_1\(7));

-- Location: LCCOMB_X51_Y17_N26
\rcG|U0|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|LessThan0~1_combout\ = (\rcG|U0|cnt_1\(5)) # ((\rcG|U0|LessThan0~0_combout\) # ((\rcG|U0|cnt_1\(7)) # (\rcG|U0|cnt_1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|cnt_1\(5),
	datab => \rcG|U0|LessThan0~0_combout\,
	datac => \rcG|U0|cnt_1\(7),
	datad => \rcG|U0|cnt_1\(6),
	combout => \rcG|U0|LessThan0~1_combout\);

-- Location: LCCOMB_X51_Y15_N30
\rcG|U0|CodeurFil~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U0|CodeurFil~feeder_combout\ = \rcG|U0|LessThan0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rcG|U0|LessThan0~1_combout\,
	combout => \rcG|U0|CodeurFil~feeder_combout\);

-- Location: FF_X51_Y15_N31
\rcG|U0|CodeurFil\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U0|CodeurFil~feeder_combout\,
	asdata => \icodeurAG~input_o\,
	sload => \ALT_INV_iRst~input_o\,
	ena => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U0|CodeurFil~q\);

-- Location: LCCOMB_X49_Y17_N4
\rcG|U1|cnt_1[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[0]~8_combout\ = \rcG|U1|cnt_1\(0) $ (VCC)
-- \rcG|U1|cnt_1[0]~9\ = CARRY(\rcG|U1|cnt_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U1|cnt_1\(0),
	datad => VCC,
	combout => \rcG|U1|cnt_1[0]~8_combout\,
	cout => \rcG|U1|cnt_1[0]~9\);

-- Location: IOIBUF_X43_Y34_N15
\icodeurBG~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_icodeurBG,
	o => \icodeurBG~input_o\);

-- Location: LCCOMB_X49_Y17_N26
\rcG|U1|cnt_1[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[5]~12_combout\ = ((\icodeurBG~input_o\) # ((!\rcG|U0|Equal0~0_combout\ & !\rcG|U0|Equal0~1_combout\))) # (!\iRst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|Equal0~0_combout\,
	datab => \iRst~input_o\,
	datac => \rcG|U0|Equal0~1_combout\,
	datad => \icodeurBG~input_o\,
	combout => \rcG|U1|cnt_1[5]~12_combout\);

-- Location: FF_X49_Y17_N5
\rcG|U1|cnt_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[0]~8_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(0));

-- Location: LCCOMB_X49_Y17_N6
\rcG|U1|cnt_1[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[1]~10_combout\ = (\rcG|U1|cnt_1\(1) & (!\rcG|U1|cnt_1[0]~9\)) # (!\rcG|U1|cnt_1\(1) & ((\rcG|U1|cnt_1[0]~9\) # (GND)))
-- \rcG|U1|cnt_1[1]~11\ = CARRY((!\rcG|U1|cnt_1[0]~9\) # (!\rcG|U1|cnt_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|cnt_1\(1),
	datad => VCC,
	cin => \rcG|U1|cnt_1[0]~9\,
	combout => \rcG|U1|cnt_1[1]~10_combout\,
	cout => \rcG|U1|cnt_1[1]~11\);

-- Location: FF_X49_Y17_N7
\rcG|U1|cnt_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[1]~10_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(1));

-- Location: LCCOMB_X49_Y17_N8
\rcG|U1|cnt_1[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[2]~13_combout\ = (\rcG|U1|cnt_1\(2) & (\rcG|U1|cnt_1[1]~11\ $ (GND))) # (!\rcG|U1|cnt_1\(2) & (!\rcG|U1|cnt_1[1]~11\ & VCC))
-- \rcG|U1|cnt_1[2]~14\ = CARRY((\rcG|U1|cnt_1\(2) & !\rcG|U1|cnt_1[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U1|cnt_1\(2),
	datad => VCC,
	cin => \rcG|U1|cnt_1[1]~11\,
	combout => \rcG|U1|cnt_1[2]~13_combout\,
	cout => \rcG|U1|cnt_1[2]~14\);

-- Location: FF_X49_Y17_N9
\rcG|U1|cnt_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[2]~13_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(2));

-- Location: LCCOMB_X49_Y17_N10
\rcG|U1|cnt_1[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[3]~15_combout\ = (\rcG|U1|cnt_1\(3) & (!\rcG|U1|cnt_1[2]~14\)) # (!\rcG|U1|cnt_1\(3) & ((\rcG|U1|cnt_1[2]~14\) # (GND)))
-- \rcG|U1|cnt_1[3]~16\ = CARRY((!\rcG|U1|cnt_1[2]~14\) # (!\rcG|U1|cnt_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|cnt_1\(3),
	datad => VCC,
	cin => \rcG|U1|cnt_1[2]~14\,
	combout => \rcG|U1|cnt_1[3]~15_combout\,
	cout => \rcG|U1|cnt_1[3]~16\);

-- Location: FF_X49_Y17_N11
\rcG|U1|cnt_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[3]~15_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(3));

-- Location: LCCOMB_X49_Y17_N12
\rcG|U1|cnt_1[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[4]~17_combout\ = (\rcG|U1|cnt_1\(4) & (\rcG|U1|cnt_1[3]~16\ $ (GND))) # (!\rcG|U1|cnt_1\(4) & (!\rcG|U1|cnt_1[3]~16\ & VCC))
-- \rcG|U1|cnt_1[4]~18\ = CARRY((\rcG|U1|cnt_1\(4) & !\rcG|U1|cnt_1[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U1|cnt_1\(4),
	datad => VCC,
	cin => \rcG|U1|cnt_1[3]~16\,
	combout => \rcG|U1|cnt_1[4]~17_combout\,
	cout => \rcG|U1|cnt_1[4]~18\);

-- Location: FF_X49_Y17_N13
\rcG|U1|cnt_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[4]~17_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(4));

-- Location: LCCOMB_X49_Y17_N14
\rcG|U1|cnt_1[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[5]~19_combout\ = (\rcG|U1|cnt_1\(5) & (!\rcG|U1|cnt_1[4]~18\)) # (!\rcG|U1|cnt_1\(5) & ((\rcG|U1|cnt_1[4]~18\) # (GND)))
-- \rcG|U1|cnt_1[5]~20\ = CARRY((!\rcG|U1|cnt_1[4]~18\) # (!\rcG|U1|cnt_1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U1|cnt_1\(5),
	datad => VCC,
	cin => \rcG|U1|cnt_1[4]~18\,
	combout => \rcG|U1|cnt_1[5]~19_combout\,
	cout => \rcG|U1|cnt_1[5]~20\);

-- Location: FF_X49_Y17_N15
\rcG|U1|cnt_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[5]~19_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(5));

-- Location: LCCOMB_X49_Y17_N16
\rcG|U1|cnt_1[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[6]~21_combout\ = (\rcG|U1|cnt_1\(6) & (\rcG|U1|cnt_1[5]~20\ $ (GND))) # (!\rcG|U1|cnt_1\(6) & (!\rcG|U1|cnt_1[5]~20\ & VCC))
-- \rcG|U1|cnt_1[6]~22\ = CARRY((\rcG|U1|cnt_1\(6) & !\rcG|U1|cnt_1[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rcG|U1|cnt_1\(6),
	datad => VCC,
	cin => \rcG|U1|cnt_1[5]~20\,
	combout => \rcG|U1|cnt_1[6]~21_combout\,
	cout => \rcG|U1|cnt_1[6]~22\);

-- Location: FF_X49_Y17_N17
\rcG|U1|cnt_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[6]~21_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(6));

-- Location: LCCOMB_X49_Y17_N18
\rcG|U1|cnt_1[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|cnt_1[7]~23_combout\ = \rcG|U1|cnt_1\(7) $ (\rcG|U1|cnt_1[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|cnt_1\(7),
	cin => \rcG|U1|cnt_1[6]~22\,
	combout => \rcG|U1|cnt_1[7]~23_combout\);

-- Location: FF_X49_Y17_N19
\rcG|U1|cnt_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \rcG|U1|cnt_1[7]~23_combout\,
	sclr => \rcG|U1|CodeurFil~0_combout\,
	ena => \rcG|U1|cnt_1[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|cnt_1\(7));

-- Location: LCCOMB_X49_Y17_N2
\rcG|U1|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|LessThan0~0_combout\ = (\rcG|U1|cnt_1\(1)) # ((\rcG|U1|cnt_1\(2)) # ((\rcG|U1|cnt_1\(4)) # (\rcG|U1|cnt_1\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|cnt_1\(1),
	datab => \rcG|U1|cnt_1\(2),
	datac => \rcG|U1|cnt_1\(4),
	datad => \rcG|U1|cnt_1\(3),
	combout => \rcG|U1|LessThan0~0_combout\);

-- Location: LCCOMB_X49_Y17_N28
\rcG|U1|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|LessThan0~1_combout\ = (\rcG|U1|cnt_1\(7)) # ((\rcG|U1|cnt_1\(6)) # ((\rcG|U1|cnt_1\(5)) # (\rcG|U1|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|cnt_1\(7),
	datab => \rcG|U1|cnt_1\(6),
	datac => \rcG|U1|cnt_1\(5),
	datad => \rcG|U1|LessThan0~0_combout\,
	combout => \rcG|U1|LessThan0~1_combout\);

-- Location: LCCOMB_X51_Y15_N24
\rcG|U1|CodeurFil~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|U1|CodeurFil~feeder_combout\ = \rcG|U1|LessThan0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rcG|U1|LessThan0~1_combout\,
	combout => \rcG|U1|CodeurFil~feeder_combout\);

-- Location: FF_X51_Y15_N25
\rcG|U1|CodeurFil\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcG|U1|CodeurFil~feeder_combout\,
	asdata => \icodeurBG~input_o\,
	sload => \ALT_INV_iRst~input_o\,
	ena => \rcG|U1|CodeurFil~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|U1|CodeurFil~q\);

-- Location: LCCOMB_X51_Y15_N20
\rcG|oImp\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oImp~combout\ = LCELL((\iRst~input_o\ & (\rcG|U0|CodeurFil~q\ $ (!\rcG|U1|CodeurFil~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst~input_o\,
	datac => \rcG|U0|CodeurFil~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|oImp~combout\);

-- Location: CLKCTRL_G7
\rcG|oImp~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rcG|oImp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rcG|oImp~clkctrl_outclk\);

-- Location: LCCOMB_X48_Y14_N12
\clk_divG|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~0_combout\ = \clk_divG|bCount_Next\(0) $ (VCC)
-- \clk_divG|Add0~1\ = CARRY(\clk_divG|bCount_Next\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk_divG|bCount_Next\(0),
	datad => VCC,
	combout => \clk_divG|Add0~0_combout\,
	cout => \clk_divG|Add0~1\);

-- Location: LCCOMB_X48_Y14_N16
\clk_divG|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~4_combout\ = (\clk_divG|bCount_Next\(2) & (\clk_divG|Add0~3\ $ (GND))) # (!\clk_divG|bCount_Next\(2) & (!\clk_divG|Add0~3\ & VCC))
-- \clk_divG|Add0~5\ = CARRY((\clk_divG|bCount_Next\(2) & !\clk_divG|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|bCount_Next\(2),
	datad => VCC,
	cin => \clk_divG|Add0~3\,
	combout => \clk_divG|Add0~4_combout\,
	cout => \clk_divG|Add0~5\);

-- Location: LCCOMB_X48_Y14_N18
\clk_divG|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~6_combout\ = (\clk_divG|bCount_Next\(3) & (!\clk_divG|Add0~5\)) # (!\clk_divG|bCount_Next\(3) & ((\clk_divG|Add0~5\) # (GND)))
-- \clk_divG|Add0~7\ = CARRY((!\clk_divG|Add0~5\) # (!\clk_divG|bCount_Next\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divG|bCount_Next\(3),
	datad => VCC,
	cin => \clk_divG|Add0~5\,
	combout => \clk_divG|Add0~6_combout\,
	cout => \clk_divG|Add0~7\);

-- Location: FF_X48_Y14_N19
\clk_divG|bCount_Next[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~6_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(3));

-- Location: LCCOMB_X48_Y14_N20
\clk_divG|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~8_combout\ = (\clk_divG|bCount_Next\(4) & (\clk_divG|Add0~7\ $ (GND))) # (!\clk_divG|bCount_Next\(4) & (!\clk_divG|Add0~7\ & VCC))
-- \clk_divG|Add0~9\ = CARRY((\clk_divG|bCount_Next\(4) & !\clk_divG|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|bCount_Next\(4),
	datad => VCC,
	cin => \clk_divG|Add0~7\,
	combout => \clk_divG|Add0~8_combout\,
	cout => \clk_divG|Add0~9\);

-- Location: FF_X48_Y14_N21
\clk_divG|bCount_Next[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~8_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(4));

-- Location: LCCOMB_X48_Y14_N22
\clk_divG|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~10_combout\ = (\clk_divG|bCount_Next\(5) & (!\clk_divG|Add0~9\)) # (!\clk_divG|bCount_Next\(5) & ((\clk_divG|Add0~9\) # (GND)))
-- \clk_divG|Add0~11\ = CARRY((!\clk_divG|Add0~9\) # (!\clk_divG|bCount_Next\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|bCount_Next\(5),
	datad => VCC,
	cin => \clk_divG|Add0~9\,
	combout => \clk_divG|Add0~10_combout\,
	cout => \clk_divG|Add0~11\);

-- Location: FF_X48_Y14_N23
\clk_divG|bCount_Next[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~10_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(5));

-- Location: LCCOMB_X48_Y14_N24
\clk_divG|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~12_combout\ = (\clk_divG|bCount_Next\(6) & (\clk_divG|Add0~11\ $ (GND))) # (!\clk_divG|bCount_Next\(6) & (!\clk_divG|Add0~11\ & VCC))
-- \clk_divG|Add0~13\ = CARRY((\clk_divG|bCount_Next\(6) & !\clk_divG|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divG|bCount_Next\(6),
	datad => VCC,
	cin => \clk_divG|Add0~11\,
	combout => \clk_divG|Add0~12_combout\,
	cout => \clk_divG|Add0~13\);

-- Location: FF_X48_Y14_N25
\clk_divG|bCount_Next[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~12_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(6));

-- Location: LCCOMB_X48_Y14_N26
\clk_divG|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~14_combout\ = \clk_divG|bCount_Next\(7) $ (\clk_divG|Add0~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divG|bCount_Next\(7),
	cin => \clk_divG|Add0~13\,
	combout => \clk_divG|Add0~14_combout\);

-- Location: FF_X48_Y14_N27
\clk_divG|bCount_Next[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~14_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(7));

-- Location: LCCOMB_X48_Y14_N10
\clk_divG|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Equal0~0_combout\ = (!\clk_divG|bCount_Next\(6) & (!\clk_divG|bCount_Next\(7) & (!\clk_divG|bCount_Next\(4) & !\clk_divG|bCount_Next\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|bCount_Next\(6),
	datab => \clk_divG|bCount_Next\(7),
	datac => \clk_divG|bCount_Next\(4),
	datad => \clk_divG|bCount_Next\(5),
	combout => \clk_divG|Equal0~0_combout\);

-- Location: LCCOMB_X48_Y14_N6
\clk_divG|bCount_Next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|bCount_Next~1_combout\ = (\clk_divG|Add0~0_combout\ & ((!\clk_divG|Equal0~1_combout\) # (!\clk_divG|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|Add0~0_combout\,
	datab => \clk_divG|Equal0~0_combout\,
	datac => \clk_divG|Equal0~1_combout\,
	combout => \clk_divG|bCount_Next~1_combout\);

-- Location: FF_X48_Y14_N7
\clk_divG|bCount_Next[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|bCount_Next~1_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(0));

-- Location: LCCOMB_X48_Y14_N14
\clk_divG|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Add0~2_combout\ = (\clk_divG|bCount_Next\(1) & (!\clk_divG|Add0~1\)) # (!\clk_divG|bCount_Next\(1) & ((\clk_divG|Add0~1\) # (GND)))
-- \clk_divG|Add0~3\ = CARRY((!\clk_divG|Add0~1\) # (!\clk_divG|bCount_Next\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clk_divG|bCount_Next\(1),
	datad => VCC,
	cin => \clk_divG|Add0~1\,
	combout => \clk_divG|Add0~2_combout\,
	cout => \clk_divG|Add0~3\);

-- Location: FF_X48_Y14_N15
\clk_divG|bCount_Next[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|Add0~2_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(1));

-- Location: LCCOMB_X48_Y14_N28
\clk_divG|bCount_Next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|bCount_Next~0_combout\ = (\clk_divG|Add0~4_combout\ & ((!\clk_divG|Equal0~0_combout\) # (!\clk_divG|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|Equal0~1_combout\,
	datab => \clk_divG|Add0~4_combout\,
	datac => \clk_divG|Equal0~0_combout\,
	combout => \clk_divG|bCount_Next~0_combout\);

-- Location: FF_X48_Y14_N29
\clk_divG|bCount_Next[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|bCount_Next~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bCount_Next\(2));

-- Location: LCCOMB_X48_Y14_N4
\clk_divG|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|Equal0~1_combout\ = (\clk_divG|bCount_Next\(2) & (!\clk_divG|bCount_Next\(0) & (!\clk_divG|bCount_Next\(3) & !\clk_divG|bCount_Next\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|bCount_Next\(2),
	datab => \clk_divG|bCount_Next\(0),
	datac => \clk_divG|bCount_Next\(3),
	datad => \clk_divG|bCount_Next\(1),
	combout => \clk_divG|Equal0~1_combout\);

-- Location: LCCOMB_X48_Y14_N8
\clk_divG|bNew_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_divG|bNew_clk~0_combout\ = \clk_divG|bNew_clk~q\ $ (((\clk_divG|Equal0~1_combout\ & \clk_divG|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_divG|Equal0~1_combout\,
	datab => \clk_divG|Equal0~0_combout\,
	datac => \clk_divG|bNew_clk~q\,
	combout => \clk_divG|bNew_clk~0_combout\);

-- Location: FF_X48_Y14_N9
\clk_divG|bNew_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rcG|oImp~clkctrl_outclk\,
	d => \clk_divG|bNew_clk~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_divG|bNew_clk~q\);

-- Location: LCCOMB_X52_Y14_N0
\rcD|oDebug[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug[0]~0_combout\ = (\iRst~input_o\ & ((\rcD|state.S0~q\) # (\rcD|U0|CodeurFil~q\ $ (\rcD|U1|CodeurFil~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst~input_o\,
	datab => \rcD|state.S0~q\,
	datac => \rcD|U0|CodeurFil~q\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|oDebug[0]~0_combout\);

-- Location: LCCOMB_X52_Y14_N22
\rcD|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector3~0_combout\ = (\rcD|state.S2~q\ & ((\rcD|U0|CodeurFil~q\ $ (!\rcD|U1|CodeurFil~q\)))) # (!\rcD|state.S2~q\ & (\rcD|Selector6~6_combout\ & (\rcD|U0|CodeurFil~q\ & \rcD|U1|CodeurFil~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|Selector6~6_combout\,
	datab => \rcD|state.S2~q\,
	datac => \rcD|U0|CodeurFil~q\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|Selector3~0_combout\);

-- Location: LCCOMB_X52_Y14_N18
\rcD|nextstate.S2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate.S2~0_combout\ = (\iRst~input_o\ & \rcD|Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst~input_o\,
	datad => \rcD|Selector3~0_combout\,
	combout => \rcD|nextstate.S2~0_combout\);

-- Location: FF_X52_Y14_N15
\rcD|state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	asdata => \rcD|nextstate.S2~0_combout\,
	clrn => \iRst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|state.S2~q\);

-- Location: LCCOMB_X52_Y14_N14
\rcD|nextstate.S3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate.S3~0_combout\ = (\rcD|state.S2~q\) # (!\rcD|state.S0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcD|state.S2~q\,
	datad => \rcD|state.S0~q\,
	combout => \rcD|nextstate.S3~0_combout\);

-- Location: LCCOMB_X52_Y14_N16
\rcD|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector2~0_combout\ = (\rcD|state.S1~q\ & (\rcD|U1|CodeurFil~q\ $ ((\rcD|U0|CodeurFil~q\)))) # (!\rcD|state.S1~q\ & (!\rcD|U1|CodeurFil~q\ & (\rcD|U0|CodeurFil~q\ & \rcD|nextstate.S3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|state.S1~q\,
	datab => \rcD|U1|CodeurFil~q\,
	datac => \rcD|U0|CodeurFil~q\,
	datad => \rcD|nextstate.S3~0_combout\,
	combout => \rcD|Selector2~0_combout\);

-- Location: LCCOMB_X52_Y14_N26
\rcD|nextstate.S1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate.S1~0_combout\ = (\rcD|Selector2~0_combout\ & \iRst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcD|Selector2~0_combout\,
	datad => \iRst~input_o\,
	combout => \rcD|nextstate.S1~0_combout\);

-- Location: FF_X52_Y14_N27
\rcD|state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcD|nextstate.S1~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|state.S1~q\);

-- Location: LCCOMB_X52_Y14_N20
\rcD|nextstate.S3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate.S3~1_combout\ = (\rcD|U1|CodeurFil~q\ & (!\rcD|U0|CodeurFil~q\ & ((\rcD|state.S2~q\) # (!\rcD|state.S0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|CodeurFil~q\,
	datab => \rcD|state.S0~q\,
	datac => \rcD|U0|CodeurFil~q\,
	datad => \rcD|state.S2~q\,
	combout => \rcD|nextstate.S3~1_combout\);

-- Location: LCCOMB_X52_Y14_N6
\rcD|nextstate~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate~0_combout\ = \rcD|U0|CodeurFil~q\ $ (\rcD|U1|CodeurFil~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcD|U0|CodeurFil~q\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|nextstate~0_combout\);

-- Location: LCCOMB_X52_Y14_N4
\rcD|nextstate.S3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|nextstate.S3~2_combout\ = (\iRst~input_o\ & ((\rcD|nextstate.S3~1_combout\) # ((\rcD|nextstate~0_combout\ & \rcD|state.S3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|nextstate.S3~1_combout\,
	datab => \rcD|nextstate~0_combout\,
	datac => \rcD|state.S3~q\,
	datad => \iRst~input_o\,
	combout => \rcD|nextstate.S3~2_combout\);

-- Location: FF_X52_Y14_N5
\rcD|state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcD|nextstate.S3~2_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|state.S3~q\);

-- Location: LCCOMB_X52_Y14_N24
\rcD|Selector6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector6~6_combout\ = (\rcD|state.S1~q\) # (\rcD|state.S3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcD|state.S1~q\,
	datad => \rcD|state.S3~q\,
	combout => \rcD|Selector6~6_combout\);

-- Location: LCCOMB_X52_Y14_N8
\rcD|oDebug[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug[0]~1_combout\ = (\rcD|oDebug[0]~0_combout\ & ((\rcD|U1|CodeurFil~q\) # ((\rcD|U0|CodeurFil~q\) # (!\rcD|Selector6~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|U1|CodeurFil~q\,
	datab => \rcD|U0|CodeurFil~q\,
	datac => \rcD|oDebug[0]~0_combout\,
	datad => \rcD|Selector6~6_combout\,
	combout => \rcD|oDebug[0]~1_combout\);

-- Location: FF_X52_Y14_N9
\rcD|state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcD|oDebug[0]~1_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcD|state.S0~q\);

-- Location: LCCOMB_X52_Y14_N12
\rcD|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector5~0_combout\ = (\rcD|U1|CodeurFil~q\ & ((\rcD|U0|CodeurFil~q\ & (!\rcD|state.S0~q\)) # (!\rcD|U0|CodeurFil~q\ & ((\rcD|state.S3~q\))))) # (!\rcD|U1|CodeurFil~q\ & (((\rcD|state.S3~q\)) # (!\rcD|state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|state.S0~q\,
	datab => \rcD|U0|CodeurFil~q\,
	datac => \rcD|state.S3~q\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|Selector5~0_combout\);

-- Location: LCCOMB_X52_Y14_N2
\rcD|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector5~1_combout\ = (\rcD|U1|CodeurFil~q\ & ((\rcD|state.S1~q\) # ((\rcD|state.S2~q\)))) # (!\rcD|U1|CodeurFil~q\ & ((\rcD|U0|CodeurFil~q\ & (\rcD|state.S1~q\)) # (!\rcD|U0|CodeurFil~q\ & ((\rcD|state.S2~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|state.S1~q\,
	datab => \rcD|U0|CodeurFil~q\,
	datac => \rcD|state.S2~q\,
	datad => \rcD|U1|CodeurFil~q\,
	combout => \rcD|Selector5~1_combout\);

-- Location: LCCOMB_X52_Y14_N30
\rcD|Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector5~2_combout\ = (\rcD|Selector5~0_combout\) # (\rcD|Selector5~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|Selector5~0_combout\,
	datab => \rcD|Selector5~1_combout\,
	combout => \rcD|Selector5~2_combout\);

-- Location: LCCOMB_X52_Y14_N28
\rcD|Selector6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|Selector6~7_combout\ = (\rcD|nextstate~0_combout\ & (((\rcD|state.S2~q\)) # (!\rcD|state.S0~q\))) # (!\rcD|nextstate~0_combout\ & (((\rcD|Selector6~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|nextstate~0_combout\,
	datab => \rcD|state.S0~q\,
	datac => \rcD|state.S2~q\,
	datad => \rcD|Selector6~6_combout\,
	combout => \rcD|Selector6~7_combout\);

-- Location: LCCOMB_X52_Y14_N10
\rcD|bSens\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|bSens~combout\ = (\iRst~input_o\ & ((\rcD|Selector6~7_combout\ & (\rcD|Selector5~2_combout\)) # (!\rcD|Selector6~7_combout\ & ((\rcD|bSens~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|Selector5~2_combout\,
	datab => \iRst~input_o\,
	datac => \rcD|bSens~combout\,
	datad => \rcD|Selector6~7_combout\,
	combout => \rcD|bSens~combout\);

-- Location: LCCOMB_X51_Y15_N16
\rcG|nextstate~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate~0_combout\ = \rcG|U0|CodeurFil~q\ $ (\rcG|U1|CodeurFil~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcG|U0|CodeurFil~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|nextstate~0_combout\);

-- Location: LCCOMB_X52_Y15_N4
\rcG|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector3~0_combout\ = (\rcG|state.S2~q\ & ((\rcG|U0|CodeurFil~q\ $ (!\rcG|U1|CodeurFil~q\)))) # (!\rcG|state.S2~q\ & (\rcG|Selector6~6_combout\ & (\rcG|U0|CodeurFil~q\ & \rcG|U1|CodeurFil~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S2~q\,
	datab => \rcG|Selector6~6_combout\,
	datac => \rcG|U0|CodeurFil~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|Selector3~0_combout\);

-- Location: LCCOMB_X52_Y15_N10
\rcG|nextstate.S2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate.S2~0_combout\ = (\iRst~input_o\ & \rcG|Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst~input_o\,
	datad => \rcG|Selector3~0_combout\,
	combout => \rcG|nextstate.S2~0_combout\);

-- Location: FF_X52_Y15_N19
\rcG|state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	asdata => \rcG|nextstate.S2~0_combout\,
	clrn => \iRst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|state.S2~q\);

-- Location: LCCOMB_X52_Y15_N18
\rcG|nextstate.S3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate.S3~0_combout\ = (\rcG|state.S2~q\) # (!\rcG|state.S0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcG|state.S0~q\,
	datac => \rcG|state.S2~q\,
	combout => \rcG|nextstate.S3~0_combout\);

-- Location: LCCOMB_X52_Y15_N24
\rcG|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector2~0_combout\ = (\rcG|state.S1~q\ & ((\rcG|U0|CodeurFil~q\ $ (\rcG|U1|CodeurFil~q\)))) # (!\rcG|state.S1~q\ & (\rcG|nextstate.S3~0_combout\ & (\rcG|U0|CodeurFil~q\ & !\rcG|U1|CodeurFil~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S1~q\,
	datab => \rcG|nextstate.S3~0_combout\,
	datac => \rcG|U0|CodeurFil~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|Selector2~0_combout\);

-- Location: LCCOMB_X52_Y15_N6
\rcG|nextstate.S1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate.S1~0_combout\ = (\iRst~input_o\ & \rcG|Selector2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst~input_o\,
	datac => \rcG|Selector2~0_combout\,
	combout => \rcG|nextstate.S1~0_combout\);

-- Location: FF_X52_Y15_N7
\rcG|state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcG|nextstate.S1~0_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|state.S1~q\);

-- Location: LCCOMB_X52_Y15_N2
\rcG|Selector6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector6~6_combout\ = (\rcG|state.S3~q\) # (\rcG|state.S1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S3~q\,
	datad => \rcG|state.S1~q\,
	combout => \rcG|Selector6~6_combout\);

-- Location: LCCOMB_X52_Y15_N8
\rcG|oDebug[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug[0]~0_combout\ = (\iRst~input_o\ & ((\rcG|state.S0~q\) # (\rcG|U0|CodeurFil~q\ $ (\rcG|U1|CodeurFil~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|CodeurFil~q\,
	datab => \rcG|U1|CodeurFil~q\,
	datac => \iRst~input_o\,
	datad => \rcG|state.S0~q\,
	combout => \rcG|oDebug[0]~0_combout\);

-- Location: LCCOMB_X52_Y15_N0
\rcG|oDebug[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug[0]~1_combout\ = (\rcG|oDebug[0]~0_combout\ & ((\rcG|U1|CodeurFil~q\) # ((\rcG|U0|CodeurFil~q\) # (!\rcG|Selector6~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U1|CodeurFil~q\,
	datab => \rcG|Selector6~6_combout\,
	datac => \rcG|U0|CodeurFil~q\,
	datad => \rcG|oDebug[0]~0_combout\,
	combout => \rcG|oDebug[0]~1_combout\);

-- Location: FF_X52_Y15_N15
\rcG|state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	asdata => \rcG|oDebug[0]~1_combout\,
	clrn => \iRst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|state.S0~q\);

-- Location: LCCOMB_X52_Y15_N14
\rcG|nextstate.S3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate.S3~1_combout\ = (!\rcG|U0|CodeurFil~q\ & (\rcG|U1|CodeurFil~q\ & ((\rcG|state.S2~q\) # (!\rcG|state.S0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|U0|CodeurFil~q\,
	datab => \rcG|U1|CodeurFil~q\,
	datac => \rcG|state.S0~q\,
	datad => \rcG|state.S2~q\,
	combout => \rcG|nextstate.S3~1_combout\);

-- Location: LCCOMB_X52_Y15_N20
\rcG|nextstate.S3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|nextstate.S3~2_combout\ = (\iRst~input_o\ & ((\rcG|nextstate.S3~1_combout\) # ((\rcG|nextstate~0_combout\ & \rcG|state.S3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|nextstate~0_combout\,
	datab => \rcG|state.S3~q\,
	datac => \iRst~input_o\,
	datad => \rcG|nextstate.S3~1_combout\,
	combout => \rcG|nextstate.S3~2_combout\);

-- Location: LCCOMB_X52_Y15_N12
\rcG|state.S3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|state.S3~feeder_combout\ = \rcG|nextstate.S3~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rcG|nextstate.S3~2_combout\,
	combout => \rcG|state.S3~feeder_combout\);

-- Location: FF_X52_Y15_N13
\rcG|state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~input_o\,
	d => \rcG|state.S3~feeder_combout\,
	clrn => \iRst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rcG|state.S3~q\);

-- Location: LCCOMB_X52_Y15_N28
\rcG|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector5~0_combout\ = (\rcG|U0|CodeurFil~q\ & ((\rcG|U1|CodeurFil~q\ & ((\rcG|state.S2~q\))) # (!\rcG|U1|CodeurFil~q\ & (\rcG|state.S3~q\)))) # (!\rcG|U0|CodeurFil~q\ & ((\rcG|state.S3~q\) # ((\rcG|state.S2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S3~q\,
	datab => \rcG|U0|CodeurFil~q\,
	datac => \rcG|state.S2~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|Selector5~0_combout\);

-- Location: LCCOMB_X52_Y15_N22
\rcG|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector5~1_combout\ = (\rcG|U0|CodeurFil~q\ & ((\rcG|state.S1~q\) # ((!\rcG|state.S0~q\)))) # (!\rcG|U0|CodeurFil~q\ & ((\rcG|U1|CodeurFil~q\ & (\rcG|state.S1~q\)) # (!\rcG|U1|CodeurFil~q\ & ((!\rcG|state.S0~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S1~q\,
	datab => \rcG|U0|CodeurFil~q\,
	datac => \rcG|state.S0~q\,
	datad => \rcG|U1|CodeurFil~q\,
	combout => \rcG|Selector5~1_combout\);

-- Location: LCCOMB_X52_Y15_N30
\rcG|Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector5~2_combout\ = (\rcG|Selector5~0_combout\) # (\rcG|Selector5~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcG|Selector5~0_combout\,
	datad => \rcG|Selector5~1_combout\,
	combout => \rcG|Selector5~2_combout\);

-- Location: LCCOMB_X52_Y15_N26
\rcG|Selector6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|Selector6~7_combout\ = (\rcG|nextstate~0_combout\ & ((\rcG|state.S2~q\) # ((!\rcG|state.S0~q\)))) # (!\rcG|nextstate~0_combout\ & (((\rcG|Selector6~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|state.S2~q\,
	datab => \rcG|state.S0~q\,
	datac => \rcG|nextstate~0_combout\,
	datad => \rcG|Selector6~6_combout\,
	combout => \rcG|Selector6~7_combout\);

-- Location: LCCOMB_X52_Y15_N16
\rcG|bSens\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|bSens~combout\ = (\iRst~input_o\ & ((\rcG|Selector6~7_combout\ & (\rcG|Selector5~2_combout\)) # (!\rcG|Selector6~7_combout\ & ((\rcG|bSens~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|Selector5~2_combout\,
	datab => \rcG|bSens~combout\,
	datac => \rcG|Selector6~7_combout\,
	datad => \iRst~input_o\,
	combout => \rcG|bSens~combout\);

-- Location: LCCOMB_X51_Y18_N28
\rcD|oDebug[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug[1]~2_combout\ = (\rcD|oDebug[0]~1_combout\ & ((!\rcD|Selector2~0_combout\) # (!\iRst~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|oDebug[0]~1_combout\,
	datac => \iRst~input_o\,
	datad => \rcD|Selector2~0_combout\,
	combout => \rcD|oDebug[1]~2_combout\);

-- Location: LCCOMB_X51_Y18_N26
\rcD|oDebug[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug[0]~3_combout\ = (\rcD|oDebug[0]~1_combout\ & ((\rcD|Selector2~0_combout\) # (!\rcD|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|Selector3~0_combout\,
	datac => \rcD|oDebug[0]~1_combout\,
	datad => \rcD|Selector2~0_combout\,
	combout => \rcD|oDebug[0]~3_combout\);

-- Location: LCCOMB_X51_Y18_N6
\rcD|comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|comb~1_combout\ = (\rcD|oDebug[0]~3_combout\ & ((\rcD|nextstate.S2~0_combout\) # ((\rcD|nextstate.S3~2_combout\) # (!\rcD|oDebug[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|nextstate.S2~0_combout\,
	datab => \rcD|oDebug[1]~2_combout\,
	datac => \rcD|oDebug[0]~3_combout\,
	datad => \rcD|nextstate.S3~2_combout\,
	combout => \rcD|comb~1_combout\);

-- Location: LCCOMB_X51_Y18_N4
\rcD|comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|comb~0_combout\ = (!\rcD|oDebug[0]~3_combout\ & ((\rcD|nextstate.S2~0_combout\) # ((\rcD|nextstate.S3~2_combout\) # (!\rcD|oDebug[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|nextstate.S2~0_combout\,
	datab => \rcD|oDebug[1]~2_combout\,
	datac => \rcD|oDebug[0]~3_combout\,
	datad => \rcD|nextstate.S3~2_combout\,
	combout => \rcD|comb~0_combout\);

-- Location: LCCOMB_X51_Y18_N10
\rcD|oDebug[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug\(0) = (!\rcD|comb~0_combout\ & ((\rcD|comb~1_combout\) # (\rcD|oDebug\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|comb~1_combout\,
	datac => \rcD|comb~0_combout\,
	datad => \rcD|oDebug\(0),
	combout => \rcD|oDebug\(0));

-- Location: LCCOMB_X51_Y18_N8
\rcD|oDebug[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug[1]~4_combout\ = (\rcD|nextstate.S3~2_combout\) # ((\rcD|Selector3~0_combout\ & \iRst~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcD|nextstate.S3~2_combout\,
	datab => \rcD|Selector3~0_combout\,
	datac => \iRst~input_o\,
	combout => \rcD|oDebug[1]~4_combout\);

-- Location: LCCOMB_X51_Y18_N12
\rcD|oDebug[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcD|oDebug\(1) = (\rcD|oDebug[1]~2_combout\ & ((\rcD|oDebug[1]~4_combout\) # (\rcD|oDebug\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcD|oDebug[1]~2_combout\,
	datac => \rcD|oDebug[1]~4_combout\,
	datad => \rcD|oDebug\(1),
	combout => \rcD|oDebug\(1));

-- Location: LCCOMB_X49_Y18_N12
\rcG|oDebug[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug[1]~2_combout\ = (\rcG|oDebug[0]~1_combout\ & ((!\iRst~input_o\) # (!\rcG|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|Selector2~0_combout\,
	datac => \rcG|oDebug[0]~1_combout\,
	datad => \iRst~input_o\,
	combout => \rcG|oDebug[1]~2_combout\);

-- Location: LCCOMB_X49_Y18_N18
\rcG|oDebug[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug[0]~3_combout\ = (\rcG|oDebug[0]~1_combout\ & ((\rcG|Selector2~0_combout\) # (!\rcG|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|Selector2~0_combout\,
	datac => \rcG|oDebug[0]~1_combout\,
	datad => \rcG|Selector3~0_combout\,
	combout => \rcG|oDebug[0]~3_combout\);

-- Location: LCCOMB_X49_Y18_N6
\rcG|comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|comb~1_combout\ = (\rcG|oDebug[0]~3_combout\ & (((\rcG|nextstate.S2~0_combout\) # (\rcG|nextstate.S3~2_combout\)) # (!\rcG|oDebug[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|oDebug[1]~2_combout\,
	datab => \rcG|oDebug[0]~3_combout\,
	datac => \rcG|nextstate.S2~0_combout\,
	datad => \rcG|nextstate.S3~2_combout\,
	combout => \rcG|comb~1_combout\);

-- Location: LCCOMB_X49_Y18_N4
\rcG|comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|comb~0_combout\ = (!\rcG|oDebug[0]~3_combout\ & (((\rcG|nextstate.S2~0_combout\) # (\rcG|nextstate.S3~2_combout\)) # (!\rcG|oDebug[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|oDebug[1]~2_combout\,
	datab => \rcG|oDebug[0]~3_combout\,
	datac => \rcG|nextstate.S2~0_combout\,
	datad => \rcG|nextstate.S3~2_combout\,
	combout => \rcG|comb~0_combout\);

-- Location: LCCOMB_X49_Y18_N10
\rcG|oDebug[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug\(0) = (!\rcG|comb~0_combout\ & ((\rcG|comb~1_combout\) # (\rcG|oDebug\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|comb~1_combout\,
	datac => \rcG|comb~0_combout\,
	datad => \rcG|oDebug\(0),
	combout => \rcG|oDebug\(0));

-- Location: LCCOMB_X49_Y18_N8
\rcG|oDebug[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug[1]~4_combout\ = (\rcG|nextstate.S3~2_combout\) # ((\iRst~input_o\ & \rcG|Selector3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rcG|nextstate.S3~2_combout\,
	datac => \iRst~input_o\,
	datad => \rcG|Selector3~0_combout\,
	combout => \rcG|oDebug[1]~4_combout\);

-- Location: LCCOMB_X49_Y18_N16
\rcG|oDebug[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \rcG|oDebug\(1) = (\rcG|oDebug[1]~2_combout\ & ((\rcG|oDebug[1]~4_combout\) # (\rcG|oDebug\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rcG|oDebug[1]~2_combout\,
	datac => \rcG|oDebug[1]~4_combout\,
	datad => \rcG|oDebug\(1),
	combout => \rcG|oDebug\(1));

ww_oImpD <= \oImpD~output_o\;

ww_oImpG <= \oImpG~output_o\;

ww_oSensD <= \oSensD~output_o\;

ww_oSensG <= \oSensG~output_o\;

ww_LedD <= \LedD~output_o\;

ww_ledG <= \ledG~output_o\;

ww_DebugD(0) <= \DebugD[0]~output_o\;

ww_DebugD(1) <= \DebugD[1]~output_o\;

ww_DebugG(0) <= \DebugG[0]~output_o\;

ww_DebugG(1) <= \DebugG[1]~output_o\;
END structure;


