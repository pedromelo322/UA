library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Relogio is
port(
	 en : in std_logic;
    clk: in std_logic;
	 modo : in std_logic;
	 set : in std_logic;
	 plus : in std_logic;
	 minus : in std_logic;
    horasout : out std_logic_vector(10 downto 0)
);
end Relogio;

architecture Behavioral of Relogio is
    signal s_minutos: std_logic_vector(5 downto 0) := (others => '0');
	 signal s_horas: std_logic_vector(4 downto 0) := (others => '0');
    constant max_minutos: std_logic_vector(5 downto 0) := "111011"; -- 59
    constant max_horas: std_logic_vector(4 downto 0) := "10111"; -- 23
    
begin

	process(modo, set, clk, en, plus, minus)
    begin
		if (rising_edge(clk)) then
			if (modo = '0') then
				if (en = '1') then
					if (s_minutos = max_minutos) then
						s_minutos <= (others => '0');
                  if (s_horas = max_horas) then
							s_horas <= (others => '0');
                  else
                     s_horas <= std_logic_vector(unsigned(s_horas) + 1);
                  end if;
               else
						s_minutos <= std_logic_vector(unsigned(s_minutos) + 1);
               end if;
				end if;
			else
				if (set = '0') then
					if (plus = '1') then
						if (s_horas = max_horas) then
							s_horas <= (others => '0');
						else
							s_horas <= std_logic_vector(unsigned(s_horas) + 1);
						end if;
					end if;
					if (minus = '1') then
						if (s_horas = "00000") then
							s_horas <= "10111";
						else
							s_horas <= std_logic_vector(unsigned(s_horas) - 1);
						end if;
					end if;
				else
					if (plus = '1') then
						if (s_minutos = max_minutos) then
							s_minutos <= (others => '0');
						else
							s_minutos <= std_logic_vector(unsigned(s_minutos) + 1);
						end if;
					end if;
					if (minus = '1') then
						if (s_minutos = "000000") then
							s_minutos <= "111011";
						else
							s_minutos <= std_logic_vector(unsigned(s_minutos) - 1);
						end if;
					end if;
				end if;
			end if;
		end if;
    end process;

    horasout <= s_horas & s_minutos;

    
end Behavioral;
