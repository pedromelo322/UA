library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity EscolherEndreco is
    port (
		  en : in std_logic;
        clk : in std_logic;
		  adress0 : in std_logic_vector(10 downto 0);
		  adress1 : in std_logic_vector(4 downto 0);
		  horas_out : out std_logic_vector(10 downto 0);
		  adress_out : out std_logic_vector(4 downto 0)
		);
end EscolherEndreco;

architecture Behavioral of EscolherEndreco is

signal s_minutos: std_logic_vector(5 downto 0) := (others => '0');
signal s_horas: std_logic_vector(4 downto 0) := (others => '0');

begin

	process(clk)
	begin
		if (rising_edge(clk)) then
			if (en = '0') then
				s_horas <= adress0(10 downto 6);
				s_minutos <= adress0(5 downto 0);
			else
				s_horas <= adress1;
				s_minutos <= (others => '0');
			end if;
		

			adress_out <= s_horas;
			horas_out <= s_horas & s_minutos;
			
			
		end if;
	end process;
end Behavioral;