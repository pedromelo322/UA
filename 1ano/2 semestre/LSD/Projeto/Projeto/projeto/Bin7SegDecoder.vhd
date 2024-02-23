library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin7SegDecoder is
	port(en : in std_logic;
	binInput : in std_logic_vector(3 downto 0);
		decOut_n : out std_logic_vector(6 downto 0));
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is
begin
	process(en, binInput)
	begin
		if (en = '1') then
			case binInput is
				when "0001" =>
					decOut_n <= "1111001"; --1
				when "0010" =>
					decOut_n <= "0100100"; --2
				when "0011" =>
					decOut_n <= "0110000"; --3
				when "0100" =>
					decOut_n <= "0011001"; --4
				when "0101" =>
					decOut_n <= "0010010"; --5
				when "0110" =>
					decOut_n <= "0000010"; --6
				when "0111" =>
					decOut_n <= "1111000"; --7
				when "1000" =>
					decOut_n <= "0000000"; --8
				when "1001" =>
					decOut_n <= "0010000"; --9
				when others =>
					decOut_n <= "1000000"; --0
			end case;
		else
			decOut_n <= "1111111";
		end if;
	end process;
end Behavioral;