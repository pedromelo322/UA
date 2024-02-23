library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity test_exmp is 

    port(
	 clk : in std_logic;
    valor_in: in std_logic;
    valor_out: out std_logic);


end test_exmp;

architecture Behavioral of test_exmp is

    signal B: std_logic;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            B <= valor_in;
            valor_out <= B;
        end if;
    end process;
end Behavioral;