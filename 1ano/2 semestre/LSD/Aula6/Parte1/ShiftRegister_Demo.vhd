library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegister_Demo is
	port(
		SW : in std_logic_vector(0 downto 0);
		CLOCK_50: in std_logic;
		LEDR : out std_logic_vector(7 downto 0));
end ShiftRegister_Demo;

architecture Shell of ShiftRegister_Demo is

signal clock: std_logic;

begin
	
	top_level: entity work.ShiftRegisterN(Behav)
		generic map(N => 8)
		port map (clk => clock,
					 sin => SW(0),
					 dataOut => LEDR);

	divisor: entity work.Freq_Divider(Behavioral)
		generic map(k => 12_500_000)
		port map(clkIn => CLOCK_50,
					clkout => clock);
		

end Shell;
