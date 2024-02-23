library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_chs is
	port(
		clk : in std_logic;
		set : in std_logic;
		blink : in std_logic;
		blink_h : out std_logic;
		blink_m : out std_logic
	);
	
end blink_chs;

architecture Behavioral of blink_chs is
	signal s_blink_h, s_blink_m : std_logic := '0';

	
	
begin
	
	process(clk)
	begin
		
		if (set = '0') then
			blink_h <= blink;
			blink_m <= '1';
		else
			blink_h <= '1';
			blink_m <= blink;
		end if;
	end process;
end architecture;
				