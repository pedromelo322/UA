library IEEE;
use IEEE.std_logic_1164.all;

entity RegN is
  generic (
    N: positive := 4
  );
  port(
		reset,enable, clock  : in std_logic;
		dataIn  			: in std_logic_vector(N-1 downto 0);
		dataOut 			: out std_logic_vector(N-1 downto 0)
  );
end RegN;

architecture Behavioral of RegN is
	begin
		process(clock)
		begin
			if (rising_edge(clock)) then
				if (reset = '1') then
					dataOut <= (others => '0');
				elsif (enable = '1') then
					dataOut <= dataIn;
				end if;
			end if;
		end process;
end Behavioral;

