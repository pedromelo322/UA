library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SimulAmbiente_TB is
end SimulAmbiente_TB;

architecture Behavioral of SimulAmbiente_TB is
	 signal tempo: std_logic := '0';
    signal clk: std_logic := '0';
    signal up_down: std_logic := '0';
    signal counter: std_logic_vector(11 downto 0);

    constant clk_period: time := 10 ns;

begin
    uut: entity work.SimulAmbiente(Behavioral)
    port map (
		  tempo    => tempo,
        clk      => clk,
        up_down  => up_down,
        counter  => counter
    );


    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

	 
	 
	 tempo_process: process
    begin
        tempo <= '0';
        wait for clk_period *2;
        tempo <= '1';
        wait for clk_period *2;
    end process;

    stimulus_process: process
    begin

        wait for 20 ns;
        
  
        up_down <= '1';
        wait for 120 ns;

        up_down <= '0';
        wait for 120 ns;
        
		  
        wait;
    end process;

end Behavioral;
