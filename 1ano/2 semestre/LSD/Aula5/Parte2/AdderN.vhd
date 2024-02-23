library IEEE;
use IEEE.std_logic_1164.all;

entity AdderN is
  generic (
    N: positive := 4
  );
  port(
		operand0, operand1 : in std_logic_vector(N-1 downto 0);
		result 				 : out std_logic_vector(N-1 downto 0)
  );
end AdderN;

architecture Behavioral of AdderN is
	begin
		result <= operand0 xor operand1;
end Behavioral;

