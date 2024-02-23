library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Freq_Divider is
	generic(k : positive := 10);
	port(clkIn : in std_logic;
		  clkOut : out std_logic);
end Freq_Divider;

architecture Behavioral of Freq_Divider is

	subtype TCounter is natural range 0 to k - 1;
	signal s_Counter : TCounter := 0;
	
begin
	assert(k >= 2);
	
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (s_counter >= (k - 1)) then
				clkOut <= '0';
				s_Counter <= 0;
			else
				if (s_counter = (k / 2 - 1)) then
					clkOut <= '1';
				end if;
				s_Counter <= s_Counter + 1;
			end if;
		end if;
	end process;
end Behavioral;