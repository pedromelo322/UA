library ieee;
use ieee.std_logic_1164.all;

entity Controlo_tb is
end Controlo_tb;

architecture Stimulus of Controlo_tb is
    constant clk_period : time := 20 ns;
    
    signal clk : std_logic := '0';
    signal switches : std_logic_vector(1 downto 0) := (others => '0');
    signal keys : std_logic_vector(3 downto 0) := (others => '0');
    signal ledsg : std_logic_vector(6 downto 0);
    signal ledsr : std_logic_vector(0 downto 0);
    signal hex0, hex1, hex2, hex3, hex5, hex6, hex7 : std_logic_vector(6 downto 0);
    
begin

    uut: entity work.Controlo(Strutural)
        port map(
            CLOCK_50 => clk,
            SW => switches,
            KEY => keys,
            LEDG => ledsg,
            LEDR => ledsr,
            HEX0 => hex0, 
            HEX1 => hex1, 
            HEX2 => hex2, 
            HEX3 => hex3, 
            HEX5 => hex5, 
            HEX6 => hex6, 
            HEX7 => hex7
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    stim_process: process
    begin


        wait for 5 ns;
        switches <= "11";

        wait;
    end process stim_process;

end Stimulus;
