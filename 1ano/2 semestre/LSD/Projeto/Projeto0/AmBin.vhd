library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AmBin is
    Port (
        clk      : in std_logic;
        Tamb  : in std_logic_vector(11 downto 0);
		  Tamb_dez: out std_logic_vector(3 downto 0);
		  Tamb_und: out std_logic_vector(3 downto 0);
		  Tamb_dec: out std_logic_vector(3 downto 0)
    );
end AmBin;

architecture Behavioral of AmBin is

	signal dez, und, dec : std_logic_vector(3 downto 0);
	signal s_Tamb  : 	unsigned(11 downto 0);
	
begin
	
	process(clk)
		
	begin
		
		if (rising_edge(clk)) then
		
			s_Tamb <= unsigned(Tamb);
		
			dec <= std_logic_vector(s_Tamb rem 10)(3 downto 0);
			und <= std_logic_vector((s_Tamb / 10) rem 10)(3 downto 0);
			dez <= std_logic_vector(s_Tamb/ 100)(3 downto 0);
			
			
			Tamb_und <= und;
			Tamb_dez <= dez;
			Tamb_dec <= dec;
		
		end if;
	
	end process;

end Behavioral;