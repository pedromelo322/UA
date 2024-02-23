library IEEE;
use IEEE.std_logic_1164.all;

entity AccN_Demo is

	generic (N: positive := 4);
	port(
		dataIn   			: in std_logic_vector(N-1 downto 0);
		dataOut  			: out std_logic_vector(N-1 downto 0);
		enable, reset, clock: in std_logic
	);
	
end AccN_Demo;

architecture Shell of AccN_Demo is

	signal s_AdderOut, s_RegOut : std_logic_vector(N-1 downto 0);

	begin
		Sumador : entity work.AdderN(Behavioral)
		generic map (N => N)
		port map(operand0 => dataIn,
					operand1 => s_regOut,
					result => s_adderOut);
		
		Registador : entity work.RegN(Behavioral)
		generic map (N => N)
		port map(dataIn => s_AdderOut,
					dataOut => s_regOut,
					clock => clock,
					enable => enable,
					reset => reset);
					
	dataOut <= s_regOut;
end Shell;
