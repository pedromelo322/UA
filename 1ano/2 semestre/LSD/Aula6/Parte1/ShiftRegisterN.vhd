library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegisterN is
	generic(N: positive:= 4);
	port (
		clk : in std_logic;
		sin : in std_logic;
		dataout : out std_logic_vector(N-1 downto 0)
		);

end ShiftRegisterN;

architecture Behav of ShiftRegisterN is
signal aux : std_logic_vector(N-1 downto 0);
begin

	process(clk)
	begin
	if rising_edge(clk) then
		aux <= aux(N-2 downto 0) & sin;
	end if;
	end process;
	dataout <= aux;

end Behav;
