library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity HAMMAMMULTI is
	port(
			A : in STD_LOGIC_VECTOR(7 downto 0);
			B : in STD_LOGIC_VECTOR(7 downto 0);
			PROD : out STD_LOGIC_VECTOR(15 downto 0)
		);
end entity;

architecture arch of HAMMAMMULTI is
	signal temp : std_logic_vector(15 downto 0);
begin
	temp <= signed(a) * signed(b);
	PROD <= temp(15 downto 0);
end arch;
