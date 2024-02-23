library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Relogio_TB is
end Relogio_TB;

architecture Behavioral of Relogio_TB is
    signal en : std_logic := '0';
    signal clk : std_logic := '0';
    signal modo_relogio : std_logic_vector(1 downto 0) := "00";
    signal modo_ram : std_logic := '0';
    signal plus : std_logic := '0';
    signal minus : std_logic := '0';
    signal adress_out : std_logic_vector(4 downto 0);
    signal horas_out : std_logic_vector(10 downto 0);
    

    constant clk_period : time := 10 ns;



begin


    uut: entity work.Relogio(Behavioral)
	 port map (
        en => en,
        clk => clk,
        modo_relogio => modo_relogio,
        modo_ram => modo_ram,
        plus => plus,
        minus => minus,
        adress_out => adress_out,
        horas_out => horas_out
    );


    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
	 
	 en_process: process
    begin
        en <= '0';
        wait for clk_period * 2;
        en <= '1';
        wait for clk_period * 2;
    end process;

	 
    stim_proc: process
    begin       

        wait for 20 ns;
        plus <= '1'; 
        wait for clk_period;
        plus <= '0'; 
        wait for 20 ns;
        plus <= '1'; 
        wait for clk_period;
        plus <= '0'; 
        wait for 20 ns;
        minus <= '1';
        wait for clk_period;
        minus <= '0'; 
		  wait for 20 ns;
        minus <= '1';
        wait for clk_period;
        minus <= '0'; 
		  wait for 20 ns;
        minus <= '1';
        wait for clk_period;
        minus <= '0'; 
		  wait for 20 ns;
        plus <= '1'; 
        wait for clk_period;
        plus <= '0'; 
        wait for 20 ns;
        plus <= '1'; 
		  
        wait;
        

    end process;

end Behavioral;
