library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_24_2 is
    port (
        clk : in std_logic;
        address : in std_logic_vector(7 downto 0);
        writeEnable : in std_logic;
        writeData : in std_logic_vector(1 downto 0);
        readData : out std_logic_vector(1 downto 0)
    );
end RAM_24_2;

architecture behavioral of RAM_24_2 is

	 constant gelo : std_logic_vector(6 downto 0) := "0000001";
    constant lua : std_logic_vector(6 downto 0) := "0001000";
    constant sol : std_logic_vector(6 downto 0) := "1000000";

	 subtype DataWord is std_logic_vector(6 downto 0);
    type ram_type is array (0 to 23) of DataWord;
	 
    signal memory : ram_type:= (
        gelo, gelo, gelo, gelo, gelo, lua,
        lua, sol, sol, sol, sol, sol,
        sol, sol, sol, sol, sol, sol,
        lua, lua, gelo, gelo, gelo, gelo);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if writeEnable = '1' then
                memory(to_integer(unsigned(address))) <= writeData;
            end if;
        end if;
    end process;

    readData <= memory(to_integer(unsigned(address)));

end behavioral;
