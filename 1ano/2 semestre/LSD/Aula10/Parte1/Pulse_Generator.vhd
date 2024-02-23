library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulse_Generator is
    Port (
        clk : in STD_LOGIC;
        pulse : out STD_LOGIC
    );
end Pulse_Generator;

architecture Behavioral of Pulse_Generator is
    signal m_counter, counter : integer := 0;
    signal rate : integer := 50000000;
begin
    process (clk) 
    begin
        if rising_edge(clk) then
            if counter < rate then
                counter <= counter + 1;
                pulse <= '0';
            else
                counter <= 0;
                pulse <= '1';
            end if;
        end if;
    end process;
end Behavioral;
