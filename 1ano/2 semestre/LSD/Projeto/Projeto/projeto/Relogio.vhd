library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Relogio is
port(
	 en : in std_logic;
     clk: in std_logic;
	 modo_relogio : in std_logic_vector(1 downto 0);
	 modo_ram : in std_logic;
	 plus : in std_logic;
	 minus : in std_logic;
	 adress_out : out std_logic_vector(4 downto 0);
    horas_out : out std_logic_vector(10 downto 0)
);
end Relogio;

architecture Behavioral of Relogio is
    signal s_minutos, s_minutos_temperatura: std_logic_vector(5 downto 0) := (others => '0');
	signal s_horas , s_horas_temperatura, s_adress_out: std_logic_vector(4 downto 0) := (others => '0');
	signal s_horas_out : std_logic_vector(10 downto 0) := (others => '0');
    constant max_minutos: std_logic_vector(5 downto 0) := "111011"; -- 59
	 constant min_minutos: std_logic_vector(5 downto 0) := "000000"; -- 0
	 constant max_horas: std_logic_vector(4 downto 0) := "10111"; -- 23
	 constant min_horas: std_logic_vector(4 downto 0) := "00000"; -- 0
    
begin

	process(modo_relogio, modo_ram, clk, en, plus, minus)
    begin
		if (rising_edge(clk)) then
			if (modo_relogio = "00") then
				if (en = '1') then
					if (s_minutos = max_minutos) then
						s_minutos <= min_minutos;
                  if (s_horas = max_horas) then
							s_horas <= min_horas;
                  else
                     s_horas <= std_logic_vector(unsigned(s_horas) + 1);
                  end if;
               else
						s_minutos <= std_logic_vector(unsigned(s_minutos) + 1);
               end if;
				end if;
			elsif (modo_relogio = "10") then
					if (plus = '1') then
						if (s_horas = max_horas) then
							s_horas <= min_horas;
						else
							s_horas <= std_logic_vector(unsigned(s_horas) + 1);
						end if;
					end if;
					if (minus = '1') then
						if (s_horas = min_horas) then
							s_horas <= max_horas;
						else
							s_horas <= std_logic_vector(unsigned(s_horas) - 1);
						end if;
					end if;
			elsif (modo_relogio = "01") then
					if (plus = '1') then
						if (s_minutos = max_minutos) then
							s_minutos <= min_minutos;
						else
							s_minutos <= std_logic_vector(unsigned(s_minutos) + 1);
						end if;
					end if;
					if (minus = '1') then
						if (s_minutos = min_minutos) then
							s_minutos <= max_minutos;
						else
							s_minutos <= std_logic_vector(unsigned(s_minutos) - 1);
						end if;
					end if;
			end if;
			
			
			
			
			
			if (modo_ram = '1') then
				if (plus = '1') then
					if (s_horas_temperatura = max_horas) then
						s_horas_temperatura <= min_horas;
					else
						s_horas_temperatura <= std_logic_vector(unsigned(s_horas_temperatura) + 1);
					end if;
				elsif (minus = '1') then
					if (s_horas_temperatura = min_horas) then
						s_horas_temperatura <= max_horas;
					else
						s_horas_temperatura <= std_logic_vector(unsigned(s_horas_temperatura) - 1);
					end if;
				end if;
			else
				s_horas_temperatura <= min_horas;
				s_minutos_temperatura <= min_minutos;
			end if;
			
			
			
			if (modo_ram = '0') then
				s_horas_out <= s_horas & s_minutos;
				s_adress_out <= s_horas;
			else
				s_horas_out <= s_horas_temperatura &  s_minutos_temperatura;
				s_adress_out <= s_horas_temperatura;
			end if;
		

			adress_out <= s_adress_out;
			horas_out <= s_horas_out;
			
			
		end if;
    end process;


    
end Behavioral;
