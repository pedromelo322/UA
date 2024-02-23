library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity teste is
    port(
		  clk  : in std_logic;
        num3 : out std_logic_vector(2 downto 0)
    );
end entity teste;

architecture rtl of teste is

	signal s_count: std_logic_vector(2 downto 0) := (others => '0');

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			s_count <= std_logic_vector(signed(s_count) + 1);
		end if;
	end process;
	num3 <= s_count;
end architecture rtl;