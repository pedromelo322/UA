library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister4 is
	Port ( clk : in std_logic;
		   data_in : in std_logic;
		   data_out : out std_logic_vector(3 downto 0));
end ShiftRegister4;

architecture Behavioral of ShiftRegister4 is
	signal reg : std_logic_vector(3 downto 0);
begin
	process (clk)
	begin
		if rising_edge(clk) then
			reg <= data_in & reg(2 downto 0);
		end if;
	end process;
	data_out <= reg;
end Behavioral;
