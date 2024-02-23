library ieee;
use ieee.std_logic_1164.all;

entity AND2Gate is
    Port (InPort0, InPort1: in std_logic;
          OutPort: out std_logic);
end AND2Gate;

architecture Behavioral of AND2Gate is

begin
    OutPort <= InPort0 and InPort1;
end Behavioral;

