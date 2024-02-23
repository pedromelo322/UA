library ieee;
use ieee.std_logic_1164.all;

entity speedselecter is
    port(
        clk : in std_logic;
        set : in std_logic;
        atual : in std_logic_vector(31 downto 0);
        output : out std_logic_vector(31 downto 0);
		  output2 : out std_logic
    );

end speedselecter;

architecture Behav of speedselecter is
begin
    process(set, atual)
    begin
		if (set = '1') then
			if (atual = x"02FAF080") then
				output <= x"00BEBC20";
			elsif (atual = x"00BEBC20") then
				output <= x"02FAF080";
         else 
				output <= x"02FAF080";
         end if;
			
			output2 <= '1';
			
		else
			output <= atual;
			output2 <= '0';
      end if;
    end process;
end Behav;
        