library ieee;
use ieee.std_logic_1164.all;

entity ButtonHandler is
    port(
        clk : in std_logic;
        btn: in std_logic;
        pulse: out std_logic
    );
end ButtonHandler;

architecture Behavioral of ButtonHandler is

	signal long_press: std_logic := '0';
	signal cnt: integer range 0 to 50_000_000 := 0;

begin

            
	process(clk)
	begin
		if rising_edge(clk) then
			if btn = '1' then
				cnt <= cnt + 1;
				if cnt >= 50_000_000 then
					long_press <= '1';
				else
					long_press <= '0';
				end if;
			else
				cnt <= 0;
				long_press <= btn;
			end if;
		pulse <= long_press;
		end if;
	end process;
				
				
end Behavioral;
