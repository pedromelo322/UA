library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ControloRadiador_tb is
end ControloRadiador_tb;

architecture Behavior of ControloRadiador_tb is
    constant clk_period: time := 0.2 ns;
    
    signal clk: std_logic := '0';
    signal sw: std_logic_vector(1 downto 0) := "00";
    signal key: std_logic_vector(3 downto 0) := "0000";
    signal ledg: std_logic_vector(6 downto 0);
    signal ledr: std_logic_vector(0 downto 0);
    signal hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7: std_logic_vector(6 downto 0);

begin
    DUT: entity work.ControloRadiador
        port map (
            CLOCK_50 => clk,
            SW => sw,
            KEY => key,
            LEDG => ledg,
            LEDR => ledr,
            HEX0 => hex0, HEX1 => hex1, HEX2 => hex2, HEX3 => hex3,
            HEX4 => hex4, HEX5 => hex5, HEX6 => hex6, HEX7 => hex7
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus_process: process
    begin
		
		  wait for 0.4 ns;
		
        sw <= "11";
        wait for 2 s;
        key <= "1000";
        wait for 1 s;
        key <= "0100";
        wait for 1 s;
        key <= "0010";
		  wait for 1 s;
        key <= "0010";
        wait;
    end process;

end Behavior;
