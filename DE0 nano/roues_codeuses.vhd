library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity roues_codeuses is 
	port (
		icodeurAD, icodeurBD : in std_logic;
		icodeurAG, icodeurBG : in std_logic;
		iRst, iClk : in std_logic;
		oImpD, oImpG : out std_logic;
		oSensD, oSensG : out std_logic;
		LedD,ledG : out std_logic;
		DebugD,DebugG : out std_logic_vector(1 downto 0)
	);
end entity;

architecture behavior of roues_codeuses is
component roue_codeuse is 
	port (
		icodeurA, icodeurB : in std_logic;
		iRst, iClk : in std_logic;
		oImp : out std_logic;
		oSens : out std_logic;
		oDebug : out std_logic_vector(1 downto 0);
		Led : out std_logic
	);
end component;

component clk_div IS
	PORT(
		iClk, iRst : IN std_logic;
		oData : OUT std_logic
	);
END component clk_div;

signal bImpG,bImpD : std_logic;

begin	
	rcD : roue_codeuse port map(icodeurA => icodeurAD, icodeurB => icodeurBD, iRst => iRst, iClk => iClk, oImp => bImpD, oSens => oSensD,
		oDebug => DebugD, Led => LedD);
	rcG : roue_codeuse port map(icodeurA => icodeurAG, icodeurB => icodeurBG, iRst => iRst, iClk => iClk, oImp => bImpG, oSens => oSensG,
		oDebug => DebugG, Led => LedG);
	
	clk_divD : clk_div port map(iClk => bImpD, iRst => iRst, oData => oImpD); 
	clk_divG : clk_div port map(iClk => bImpG, iRst => iRst, oData => oImpG); 
end architecture;