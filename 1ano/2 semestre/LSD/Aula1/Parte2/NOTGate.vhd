library ieee;
use ieee.std_logic_1164.all;

entity NOTGate is
    Port (A: in std_logic;
          B: out std_logic);
end NOTGate;

architecture Behavioral of NOTGate is
begin
    B <= not A;
end Behavioral;

