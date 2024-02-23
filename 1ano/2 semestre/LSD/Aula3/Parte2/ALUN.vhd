library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUN is
    generic (
        N : integer := 8
    );

    port (a,b : in std_logic_vector(N-1 downto 0);
          Sel : in std_logic_vector(2 downto 0);
          r,m : out std_logic_vector(N-1 downto 0));
end ALUN;

architecture Behavior of ALUN is
    signal s_a, s_b, s_r : unsigned(N-1 downto 0);
    signal s_m : unsigned(N*2-1 downto 0);

begin

    s_a <= unsigned(A);
	s_b <= unsigned(B);
	
	s_m <= s_a * s_b;


	with Sel select
		s_r <= s_a + s_b when "000",
			 s_a - s_b when "001",
			 s_m(N-1 downto 0) when "010",
			 s_a / s_b when "011",
			 s_a rem s_b when "100",
			 s_a and s_b when "101",
			 s_a or s_b when "110",
			 s_a xor s_b when "111";
			 
	r <= std_logic_vector(s_r);
	
	m <= std_logic_vector(s_m(N*2-1 downto N)) when (Sel = "010") else (others => '0');

end Behavior;