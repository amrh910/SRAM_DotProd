library ieee;
use ieee.std_logic_1164.all;

entity HAMMAMOUT is
		port (
				bin : in STD_LOGIC_VECTOR(15 downto 0);
				seg1 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg2 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg3 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg4 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				TurnOFF : out STD_LOGIC_VECTOR(27 downto 0)
			);
end entity;

architecture arch of HAMMAMOUT is
begin
	TurnOFF <= (others => '1');
		process(bin)
			begin
				case bin(15 downto 12) is 
					when "0000" => seg4 <= "0000001";
					when "0001" => seg4 <= "1001111";
					when "0010" => seg4 <= "0010010";
					when "0011" => seg4 <= "0000110";
					when "0100" => seg4 <= "1001100";
					when "0101" => seg4 <= "0100100";
					when "0110" => seg4 <= "0100000";
					when "0111" => seg4 <= "0001111";
					when "1000" => seg4 <= "0000000";
					when "1001" => seg4 <= "0001100";
					when "1010" => seg4 <= "0001000";
					when "1011" => seg4 <= "1100000";
					when "1100" => seg4 <= "0110001";
					when "1101" => seg4 <= "1000010";
					when "1110" => seg4 <= "0110000";
					when "1111" => seg4 <= "0111000";
					when others => NULL;
				end case;

				case bin(11 downto 8) is 
					when "0000" => seg3 <= "0000001";
					when "0001" => seg3 <= "1001111";
					when "0010" => seg3 <= "0010010";
					when "0011" => seg3 <= "0000110";
					when "0100" => seg3 <= "1001100";
					when "0101" => seg3 <= "0100100";
					when "0110" => seg3 <= "0100000";
					when "0111" => seg3 <= "0001111";
					when "1000" => seg3 <= "0000000";
					when "1001" => seg3 <= "0001100";
					when "1010" => seg3 <= "0001000";
					when "1011" => seg3 <= "1100000";
					when "1100" => seg3 <= "0110001";
					when "1101" => seg3 <= "1000010";
					when "1110" => seg3 <= "0110000";
					when "1111" => seg3 <= "0111000";
					when others => NULL;
				end case;

				case bin(7 downto 4) is 
					when "0000" => seg2 <= "0000001";
					when "0001" => seg2 <= "1001111";
					when "0010" => seg2 <= "0010010";
					when "0011" => seg2 <= "0000110";
					when "0100" => seg2 <= "1001100";
					when "0101" => seg2 <= "0100100";
					when "0110" => seg2 <= "0100000";
					when "0111" => seg2 <= "0001111";
					when "1000" => seg2 <= "0000000";
					when "1001" => seg2 <= "0001100";
					when "1010" => seg2 <= "0001000";
					when "1011" => seg2 <= "1100000";
					when "1100" => seg2 <= "0110001";
					when "1101" => seg2 <= "1000010";
					when "1110" => seg2 <= "0110000";
					when "1111" => seg2 <= "0111000";
					when others => NULL;
				end case;

				case bin(3 downto 0) is 
					when "0000" => seg1 <= "0000001";
					when "0001" => seg1 <= "1001111";
					when "0010" => seg1 <= "0010010";
					when "0011" => seg1 <= "0000110";
					when "0100" => seg1 <= "1001100";
					when "0101" => seg1 <= "0100100";
					when "0110" => seg1 <= "0100000";
					when "0111" => seg1 <= "0001111";
					when "1000" => seg1 <= "0000000";
					when "1001" => seg1 <= "0001100";
					when "1010" => seg1 <= "0001000";
					when "1011" => seg1 <= "1100000";
					when "1100" => seg1 <= "0110001";
					when "1101" => seg1 <= "1000010";
					when "1110" => seg1 <= "0110000";
					when "1111" => seg1 <= "0111000";
					when others => NULL;
				end case;
		end process;
end arch;
