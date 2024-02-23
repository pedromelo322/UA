library IEEE;
use IEEE.std_logic_1164.all;

entity ProcessarBotao is
    Port (
        clk        : in std_logic;
        pulse_01s  : in std_logic; 
        pulse_1s   : in std_logic;
		  key        : in std_logic;
        out_signal : out std_logic
    );
end ProcessarBotao;

architecture Behavioral of ProcessarBotao is

	signal s_out_signal, long : std_logic := '0';
	signal rate : integer := 5000000;
	signal counter : integer := 0;


begin
    process(clk)
    begin
		if (rising_edge(clk)) then
			if (pulse_01s = '1') then
				s_out_signal <= '1';
			elsif(pulse_1s = '1') then
				s_out_signal <= '0';
				long <= '1';
			else
				s_out_signal <= '0';
			end if;
			
			
			if (key = '0') then
				if (long = '1') then
					if counter < rate then
						counter <= counter + 1;
						s_out_signal <= '0';
					else
						counter <= 0;
						s_out_signal <= '1';
					end if;
				end if;
			else
				long <= '0';
				counter <= 0;
			end if;

			out_signal <= s_out_signal;
		end if;
	end process;
end Behavioral;
				