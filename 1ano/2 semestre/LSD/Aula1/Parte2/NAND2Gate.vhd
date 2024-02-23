library ieee;
use ieee.std_logic_1164.all;

entity NAND2Gate is
    Port (InPort0, InPort1: in std_logic;
          OutPort: out std_logic);
end NAND2Gate;

architecture Structural of NAND2Gate is

    signal s_andOut: std_logic;

begin
    and_gate: entity work.AND2Gate(Behavioral)
        port map(
            InPort0 => InPort0,
            InPort1 => InPort1,
            OutPort => s_andOut
        );
        
    not_gate: entity work.NOTGate(Behavioral)
        port map(
            A => s_andOut,
            B => OutPort
        );

end Structural;
