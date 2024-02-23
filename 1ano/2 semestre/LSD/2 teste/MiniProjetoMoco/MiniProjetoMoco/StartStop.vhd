library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity StartStop is
	port (
		start, stop : in std_logic;
		enable_out  : out std_logic);
end StartStop;

architecture Behavioral of StartStop is
	signal state : std_logic;
begin
	process (start, stop)
	begin
		if (start = '1') then
			state <= '1';
		elsif (stop = '1') then
			state <= '0';
		end if;
	end process;
	enable_out <= state;
end Behavioral;