library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


ENTITY clk_div IS
	PORT(
		iClk, iRst : IN std_logic;
		oData : OUT std_logic
	);
END ENTITY clk_div;

ARCHITECTURE arch OF clk_div IS
SIGNAL bCount_Next : std_logic_vector(7 DOWNTO 0) := "00000000";
signal bNew_clk : std_logic := '0';
BEGIN
	detection: PROCESS(iClk, iRst)
	variable bCount_Current : std_logic_vector(7 DOWNTO 0);
	BEGIN
		IF (iRst = '0') THEN
			bCount_Current := "00000000";
			bCount_Next <= "00000000";
			bNew_clk <= '0';
		ELSIF rising_edge(iClk) THEN
			bCount_Current := bCount_Next;
			if (bCount_Current = "00000100") then
				bCount_Current := "00000000";
				bCount_Next <= "00000000";
				bNew_clk <= not(bNew_clk);
			else
				bCount_Next <= bCount_Current + '1';
				bNew_clk <= bNew_clk;
			end if;
		else
			bCount_Next <= bCount_Next;
			bCount_Current := bCount_Current;
			bNew_clk <= bNew_clk;
		END IF;
	END PROCESS detection;
	oData <= bNew_clk;
END ARCHITECTURE arch;