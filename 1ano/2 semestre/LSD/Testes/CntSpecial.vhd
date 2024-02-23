--Complete the following VHDL for a 8 bit register with WRITE ENABLE and OUTPUT ENABLE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
port(
    clk: in std_logic;
    wen: in std_logic;
    reset: in std_logic;
    oe: in std_logic;
    din: in std_logic_vector(7 downto 0);
    dout: out std_logic_vector(7 downto 0)
);
end Reg;

architecture Behavioral of Reg is
    signal s_d: std_logic_vector(7 downto 0);

begin
    process(clk, reset)
    begin
        if reset = '1' then
            s_d <= (others => '0');
        elsif rising_edge(clk) then
            if wen = '1' then
                s_d <= din;
            end if;
        end if;
    end process;
    dout <= (others=> 'Z') when oe = '0' else s_d;
end Behavioral;