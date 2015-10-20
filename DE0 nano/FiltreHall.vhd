Library IEEE;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FiltreHall is

	port
	(
		clock_in 	: in	std_logic;  -- clock 50MHz
		reset	 	: in	std_logic;  -- reset
		Codeur	 	: in	std_logic;  -- entrée du codeur
		CodeurFil	: out	std_logic   -- sortie filtrée
	);

end entity;

architecture rtl of FiltreHall is

			 

begin
process (clock_in)
variable cnt 		: std_logic_vector(7 downto 0);
variable cnt_1 	: std_logic_vector(7 downto 0);	
	begin
	if rising_edge(clock_in) then
		
		if reset = '0' then  
		
				cnt 	:= 	"00000000";
				cnt_1 	:= 	"00000000";
			    CodeurFil		<=	codeur;
			
		elsif cnt = "11" then
						if cnt_1 < "10" then	
								CodeurFil	<=	'0';
								cnt_1	:=	"00000000";
								cnt		:=	"00000000";
						else			
					    		CodeurFil	<=	'1';
					    		cnt_1	:=	"00000000";
								cnt		:=	"00000000";
					    end if;
												
		elsif Codeur = '1' then cnt_1	:=	cnt_1 + 1; 
						cnt	:=	cnt + 1;
		else cnt	:=	cnt + 1;
		end if;
		end if;

end process;


end;