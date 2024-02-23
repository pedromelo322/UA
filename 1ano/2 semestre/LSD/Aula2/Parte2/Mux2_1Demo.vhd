library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Mux2_1Demo is
port(sel : in std_logic;
	dataIn1 : in std_logic;
	dataIn0 : in std_logic;
	dataOut : out std_logic);
end Mux2_1Demo;

architecture BehavProc of Mux2_1Demo is
begin
	process(Sel, dataIn1, dataIn0)
	begin
		if (sel = '0') then
			dataOut <= dataIn0;
		else
			dataOut <= dataIn1;
		end if;
	end process;
end BehavProc;