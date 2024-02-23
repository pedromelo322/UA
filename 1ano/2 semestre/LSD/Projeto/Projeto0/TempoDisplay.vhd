library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity TempoDisplay is
    port(
	   clk   : in std_logic;
		en    : in std_logic_vector(1 downto 0);
		tempo_bin : in std_logic_vector(10 downto 0);
		minutos0_hex, minutos1_hex, horas0_hex, horas1_hex : out std_logic_vector(6 downto 0)
    );

end TempoDisplay;

architecture Behavioral of TempoDisplay is

	signal minutos0, minutos1, horas0, horas1 : std_logic_vector(3 downto 0) := "0000";
	signal s_minutos, minutos0_temp, minutos1_temp : std_logic_vector(5 downto 0) := "000000";
	signal s_horas, horas0_temp, horas1_temp : std_logic_vector(4 downto 0) := "00000";
	signal estado_horas, estado_minutos, blink : std_logic := '0';
	signal cnt : unsigned(31 downto 0) := (others => '0');





begin

	process(clk)
		
	begin
		
		if (rising_edge(clk)) then
		
			s_horas <= tempo_bin(10 downto 6);
			s_minutos <= tempo_bin(5 downto 0);

			minutos0_temp <= std_logic_vector(unsigned(s_minutos) mod 10);
			minutos0 <= minutos0_temp(3 downto 0);
			minutos1_temp <= std_logic_vector(unsigned(s_minutos) / 10);
			minutos1 <= minutos1_temp(3 downto 0);
			horas0_temp <= std_logic_vector(unsigned(s_horas) mod 10);
			horas0 <= horas0_temp(3 downto 0);
			horas1_temp <= std_logic_vector(unsigned(s_horas) / 10);
			horas1 <= horas1_temp(3 downto 0);
			
			
			
			
			
			if (en = "00") then
				cnt <= (others => '0');
			else
				cnt <= cnt + 1;
				if (cnt >= x"02160EC0" and cnt <= x"02FAF080") then
					if (cnt = x"02FAF080") then
						cnt <= (others => '0');
					end if;
					blink <= '0';
				else
					blink <= '1';
            end if;
         end if;
			
			
			
			if (en = "00") then
				estado_horas <= '1';
				estado_minutos <= '1';
			elsif (en = "10") then
				estado_horas <= blink;
				estado_minutos <= '1';
			elsif (en = "01") then
				estado_horas <= '1';
				estado_minutos <= blink;
			end if;
			
			
					
    end if;
	
	end process;
	
	bin7segdecoder_inst: entity work.Bin7SegDecoder(Behavioral)
		port map (
			en 		=> estado_minutos,
			binInput => minutos0,
			decOut_n => minutos0_hex
		);

	bin7segdecoder_inst1: entity work.Bin7SegDecoder(Behavioral)
		port map (
			en 		=> estado_minutos,
			binInput => minutos1,
			decOut_n => minutos1_hex
		);	
		  
	bin7segdecoder_inst2: entity work.Bin7SegDecoder(Behavioral)
		port map (
			en 		=> estado_horas,
			binInput => horas0,
			decOut_n => horas0_hex
		);

	bin7segdecoder_inst3: entity work.Bin7SegDecoder(Behavioral)
		port map (
			en 		=> estado_horas,
			binInput => horas1,
			decOut_n => horas1_hex
		);
			
end Behavioral;