library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulse_Generator is
    Port (
        acel : in STD_LOGIC_VECTOR (1 downto 0);
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
            case acel is
				when "00" => rate <= 50000000; -- frequência normal
                when "01" => rate <= 50000000;   -- 1Hz
                when "10" => rate <= 50000000/10;  -- 10Hz
                when "11" => rate <= 50000000/60; -- 60Hz
                when others => rate <= 50000000;  -- frequência normal
            end case;

            if counter < rate then
                counter <= counter + 1;
                pulse <= '0';
            else
                counter <= 0;
                if acel = "00" then
                    m_counter <= m_counter + 1;
                    if m_counter = 60 then
                        m_counter <= 0;
                        pulse <= '1';
                    end if;
                else
                    pulse <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
