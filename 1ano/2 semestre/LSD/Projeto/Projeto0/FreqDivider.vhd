library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FreqDivider is
    port(en : in std_logic;
         clkIn : in std_logic;
         k : in std_logic_vector(31 downto 0);
         clkOut : out std_logic);
end FreqDivider;


architecture Behavioral of FreqDivider is
    signal s_counter : unsigned(31 downto 0);
    signal s_halfWay : unsigned(31 downto 0);

begin
	
    process(en, clkIn)
    begin
        if (en = '1') then
            s_halfWay <= (unsigned(k) / 2);
            if (rising_edge(clkIn)) then
            s_counter <= s_counter + 1;

                if (s_counter = (unsigned(k) - 1)) then
                    s_counter <= (others => '0');
                    clkOut <= '0';
                elsif (s_counter = s_halfWay - 1) then
                    clkOut <= '1';
                end if;
            end if;
        else
            clkOut <= clkIn;
            s_counter <= (others => '0');
        end if;
    end process;


end Behavioral;