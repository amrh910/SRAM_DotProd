library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HAMMAM_SRAM is
	port(
			CLK : in std_logic;
			CLK2 : in std_logic;
			CLKAccum : in std_logic;
			ACLR : in std_logic;
			SADD : in std_logic_vector(4 downto 0);
			DATAIN: in std_logic_vector(7 downto 0);
			wrEN : in std_logic;
			SRAM_ADDR :  out std_logic_vector(17 downto 0);
			SRAM_DQ : inout std_logic_vector(15 downto 0);
			SRAM_CE_N : out std_logic;
			SRAM_OE_N : out std_logic;
			SRAM_WE_N : out std_logic;
			SRAM_UB_N : out std_logic;
			SRAM_LB_N : out std_logic;
			seg1 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
			seg2 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
			seg3 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
			seg4 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
			TurnOFF : out STD_LOGIC_VECTOR(27 downto 0)
		);
end entity;

architecture arch of HAMMAM_SRAM is
	signal address : std_logic_vector(4 downto 0);
	signal data : std_logic_vector(7 downto 0);
	signal REG, REG2 : std_logic_vector(15 downto 0);
	signal ACCUCLK : std_logic;
	signal temp1, temp2 : std_logic_vector(4 downto 0);
	signal data1, data2 : std_logic_vector(7 downto 0);
	signal mres, sum : std_logic_vector(15 downto 0) := "0000000000000000";
	signal COUT : std_logic;

component HAMMAMACCU is 
	port (
			I : in STD_LOGIC_VECTOR(15 downto 0);
			ASYNCLR : in STD_LOGIC;
			ACCUM : out STD_LOGIC_VECTOR(15 downto 0);
			CLK 	: in STD_LOGIC;
			COUT : out std_logic
		);
end component;

component HAMMAMMULTI is
	port(
			A : in STD_LOGIC_VECTOR(7 downto 0);
			B : in STD_LOGIC_VECTOR(7 downto 0);
			PROD : out STD_LOGIC_VECTOR(15 downto 0)
		);
end component;

component HAMMAMOUT is
		port (
				bin : in STD_LOGIC_VECTOR(15 downto 0);
				seg1 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg2 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg3 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				seg4 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
				TurnOFF : out STD_LOGIC_VECTOR(27 downto 0)
			);
end component;

begin
	address <= SADD; 
	data <= DATAIN when wrEN = '1' else (others => 'Z');
	SRAM_WE_N <= not wren;
	SRAM_CE_N <= '0';
	SRAM_OE_N <= '0';
	SRAM_UB_N <= '0';
	SRAM_LB_N <= '0';
	SRAM_ADDR(17 downto 5) <= (others => '0');
	SRAM_ADDR(4 downto 0) <= address;
	SRAM_DQ(15 downto 8) <= (others => '0');
	SRAM_DQ(7 downto 0) <= data;

	MUTLI : HAMMAMMULTI port map(data1, data2, mRes);
	ACCU : HAMMAMACCU port map(mRes, ACLR, sum, CLKAccum, COUT);

	process(CLK)
		begin
			if(rising_edge(CLK)) then
				data1 <= SRAM_DQ(7 downto 0);
			end if;
	end process;
	process(CLK2)
		begin
			if(rising_edge(CLK2)) then
				data2 <= SRAM_DQ(7 downto 0);
			end if;
	end process;

	DISPLAY : HAMMAMOUT port map(sum, seg4, seg3, seg2, seg1, TurnOFF);
end arch;
