library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity ProgHoras is
    port (
		  en : in std_logic;
        clk : in std_logic;
		  plus : in std_logic;
		  minus : in std_logic;
		  data_out : out std_logic_vector(4 downto 0)
    );
end ProgHoras;

architecture Behavioral of ProgHoras is

signal s_horas : std_logic_vector(4 downto 0) := (others => '0');
constant max_horas: std_logic_vector(4 downto 0) := "10111"; -- 23

begin 
	process(clk)
	begin
		if rising_edge(clk) then
			if (en = '1') then
				if (plus = '1') then
					if (s_horas = max_horas) then
						s_horas <= (others => '0');
					else
						s_horas <= std_logic_vector(unsigned(s_horas) + 1);
					end if;
				elsif (minus = '1') then
					if (s_horas = "00000") then
						s_horas <= "10111";
					else
						s_horas <= std_logic_vector(unsigned(s_horas) - 1);
					end if;
				end if;
			else
				s_horas <= "00000";
			end if;
			data_out <= s_horas;
		end if;
	end process;
end Behavioral;