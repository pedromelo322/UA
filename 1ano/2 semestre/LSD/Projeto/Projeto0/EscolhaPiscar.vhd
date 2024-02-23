library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity EscolhaPiscar is
	port(
		clk : in std_logic;
		set : in std_logic;
		blink : in std_logic;
		blink_h : out std_logic;
		blink_m : out std_logic
	);
	
end EscolhaPiscar;

architecture Behavioral of EscolhaPiscar is
	signal s_blink_h, s_blink_m : std_logic := '0';
	
begin
	
	process(clk, set, blink)
	begin
		
		if (set = '0') then
			blink_h <= blink;
			blink_m <= '1';
		else
			blink_h <= '1';
			blink_m <= blink;
		end if;
	end process;
end Behavioral;
				