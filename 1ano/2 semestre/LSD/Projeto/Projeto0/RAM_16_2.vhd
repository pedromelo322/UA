library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RAM_16_2 is
    port (
		  modo : in std_logi
        clk : in std_logic;
        address : in std_logic_vector(7 downto 0);
        writeEnable : in std_logic;
        writeData : in std_logic_vector(1 downto 0);
        readData : out std_logic_vector(1 downto 0)
    );
end RAM_16_2;

architecture behavioral of RAM_16_2 is
    type ram_type is array (0 to 23) of std_logic_vector(1 downto 0);
    signal memory : ram_type:= (
	 "00", "00", "00", "00", "00", "01",
	 "01", "10", "10", "10", "10", "10",
	 "10", "10", "10", "10", "10", "10",
	 "01", "01", "00", "00", "00", "00");
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
