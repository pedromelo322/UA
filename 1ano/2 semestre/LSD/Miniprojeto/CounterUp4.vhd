library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterUp4 is
	port(clk   : in std_logic;
		  reset : in std_logic;
		  countIn : in std_logic_vector(3 downto 0);
		  count : out std_logic_vector(3 downto 0));
end CounterUp4;

architecture Behavioral of CounterUp4 is

signal s_count : std_logic_vector(3 downto 0);

begin
	process(clk)
	begin
	
		if (reset = '1') then
			s_count <= (others => '0');
		end if;
		if (rising_edge(clk)) then
			count <= std_logic_vector(unsigned(countIn) + 1);
		end if;
	end process;
end Behavioral;