library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU4 is
    port (A, B : in std_logic_vector(3 downto 0);
          Sel : in std_logic_vector(2 downto 0);
          Z: out std_logic_vector(7 downto 0));
end ALU4;

architecture Behavioral of ALU4 is

signal s_a, s_b, s_z : signed(3 downto 0); 
signal s_m : signed(7 downto 0);

begin

	s_a <= signed(A);
	s_b <= signed(B);
	
	s_m <= s_a * s_b;


	with Sel select
		s_z <= s_a + s_b when "000",
			 s_a - s_b when "001",
			 s_m(3 downto 0) when "010",
			 s_a / s_b when "011",
			 s_a rem s_b when "100",
			 s_a and s_b when "101",
			 s_a or s_b when "110",
			 s_a xor s_b when "111";
			 
			 


	process(Sel)

	begin
	
	if Sel = "010" then
		Z <= std_logic_vector(s_m);
	else
		Z <= std_logic_vector(resize(s_z, 8)); -- extensão de sinal para 8 bits
	end if;
	
	end process;

end Behavioral;
