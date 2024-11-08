library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_1P_16_8 is
    port (
        clk : in std_logic;
        address : in std_logic_vector(3 downto 0);
        writeEnable : in std_logic;
        writeData : in std_logic_vector(7 downto 0);
        readData : out std_logic_vector(7 downto 0)
    );
end RAM_1P_16_8;

architecture behavioral of RAM_1P_16_8 is
    type ram_type is array (0 to 15) of std_logic_vector(7 downto 0);
    signal memory : ram_type;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if writeEnable = '1' then
                memory(to_integer(unsigned(address))) <= writeData;
            end if;
				readData <= memory(to_integer(unsigned(address)));
        end if;
    end process;

    

end behavioral;
