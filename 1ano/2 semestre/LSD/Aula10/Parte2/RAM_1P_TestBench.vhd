library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity RAM_1P_TestBench is
end RAM_1P_TestBench;

architecture Stimulus of RAM_1P_TestBench is
    signal s_clk : std_logic;
    signal s_key :  std_logic_vector(0 downto 0);
    signal s_sw :  std_logic_vector(15 downto 0);
    signal s_ledr :  std_logic_vector(7 downto 0);

begin
    ram_ut : entity work.RAM_1P_Demo(structural)
                port map(CLOCK_50 => s_clk,
								KEY => s_key,
								SW => s_sw,
								LEDR => s_ledr);

    clk_process : process
    begin
        s_clk <= '0'; 
		  wait for 10 ns;
        s_clk <= '1';
		  wait for 10 ns;
    end process clk_process;

    stim_proc : process
    begin
        wait for 5 ns;

        wait; -- Adicionado wait statement para manter o processo ativo
    end process stim_proc;
end Stimulus;
