library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_freq is
    port(
        clk : in std_logic;
        en_in : in std_logic;
        en_out : out std_logic
    );
end entity;

architecture Behavioral of blink_freq is
    signal cnt : unsigned(31 downto 0) := (others => '0');

    begin

    process(clk)

    begin
        if rising_edge(clk) then
            if (en_in = '1') then
                cnt <= (others => '0');
                en_out <= en_in;
            else
                cnt <= cnt + 1;
                if (cnt >= x"02160EC0" and cnt <= x"02FAF080") then
						  if (cnt = x"02FAF080") then
								cnt <= (others => '0');
						  end if;
                    en_out <= '0';
                else
                    en_out <= '1';
                end if;
            end if;
			end if;
		end process;
end Behavioral;
