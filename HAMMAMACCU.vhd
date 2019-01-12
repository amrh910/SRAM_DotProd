library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity HAMMAMACCU is 
	port (
			I : in STD_LOGIC_VECTOR(15 downto 0);
			ASYNCLR : in STD_LOGIC;
			ACCUM : out STD_LOGIC_VECTOR(15 downto 0);
			CLK 	: in STD_LOGIC;
			COUT : out std_logic
		);
end entity;

architecture arch of HAMMAMACCU is
signal temp : std_logic_vector(16 downto 0) := "00000000000000000";
	begin
		ACCUM <= temp(15 downto 0);
		COUT <= temp(16);
		process(CLK, ASYNCLR)
			begin
				if (ASYNCLR = '0') then 
						temp <= (others => '0');
					elsif rising_edge(CLK) then
						temp <= temp + I;
				end if; 
		end process;
end arch;