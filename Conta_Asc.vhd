library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Conta_Asc is 
		port(CLK1, RST_CONT: in std_logic;
			CONTA_ASC: out std_logic_vector(19 downto 0));
end Conta_Asc;

architecture Contasc_bhv of Conta_Asc is
	signal seg1: std_logic_vector(4 downto 0) := "00000";
	signal seg2: std_logic_vector(4 downto 0):= "00000";
	signal min1: std_logic_vector(4 downto 0):= "00000";
	signal min2: std_logic_vector(4 downto 0):= "00000";
	
begin
	CONTA_ASC <= min2 & min1 & seg2 & seg1;
	process(CLK1, RST_CONT)
		begin
			if RST_CONT = '0' then
				seg1 <= "00000";
				seg2 <= "00000";
				min1 <= "00000";
				min2 <= "00000";
				else
					if CLK1'event and CLK1 = '1' then
							if seg1 /= "01001" then
								seg1 <= seg1 + 1;
							else
								if seg2 /= "00101" then
									seg1 <= "00000";
									seg2 <= seg2 + 1;	
								else
									seg2 <= "00000";
									seg1 <= "00000";
									if min1 /= "01001" then
										min1 <= min1 + 1;
									else
										min1 <= "00000";
										if min2 /= "01001" then
											min2 <= min2 + 1;
										else
											min2 <= "00000";
										end if;
									end if;
								end if;
							end if;
					end if;
			end if;
		end process;
end Contasc_bhv;