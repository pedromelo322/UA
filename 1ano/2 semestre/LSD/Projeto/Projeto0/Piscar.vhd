library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Piscar is
    port(
		clk : in std_logic;
		en  : in std_logic_vector(1 downto 0);
		estado_horas, estado_minutos: out std_logic
    );

end Piscar;

architecture Behavioral of Piscar is


	signal cnt : unsigned(31 downto 0) := (others => '0');
	signal blink : std_logic := '0';

begin

	process(clk)

	begin
		if rising_edge(clk) then
		
		
			if (en = "00") then
				cnt <= (others => '0');
			else
				cnt <= cnt + 1;
				if (cnt >= x"02160EC0" and cnt <= x"02FAF080") then
					if (cnt = x"02FAF080") then
						cnt <= (others => '0');
					end if;
					blink <= '0';
				else
					blink <= '1';
            end if;
         end if;
			
			
			
			if (en = "00") then
				estado_horas <= '1';
				estado_minutos <= '1';
			elsif (en = "10") then
				estado_horas <= blink;
				estado_minutos <= '1';
			elsif (en = "01") then
				estado_horas <= '1';
				estado_minutos <= blink;
			end if;
			
			
			
		end if;
	end process;
end Behavioral;