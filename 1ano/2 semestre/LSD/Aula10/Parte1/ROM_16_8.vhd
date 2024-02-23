library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
	port(address : in std_logic_vector(3 downto 0);
		  dataOut : out std_logic_vector(3 downto 0));
end ROM_16_8;

architecture Behavioral of ROM_16_8 is
	subtype TDataWord is std_logic_vector(3 downto 0);
	type TROM is array (0 to 15) of TDataWord;
	constant c_memory: TROM := ("0000", "0001", "0010", "0011",
								"0100", "0101", "0110", "0111",
								"1000", "1001", "1010", "1011",
								"1100", "1101", "1110", "1111");
	begin
		dataOut <= c_memory(to_integer(unsigned(address)));
end Behavioral;