library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit_T is
	port(
		  clk		: in  std_logic;
		  set	: in  std_logic;
		  modo_out	: out std_logic);
end ControlUnit_T;

architecture Behavioral of ControlUnit_T is

	type TState is (NORMAL, PROGRAMACAO);
	signal s_currentState, s_nextState : TState := NORMAL;

begin
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
				s_currentState <= s_nextState;
		end if;
	end process;

	comb_proc : process(s_currentState, set)
	begin
		case (s_currentState) is
		when NORMAL =>
			modo_out <= '0';
			if (set = '1') then
				s_nextState <= PROGRAMACAO;
			else
				s_nextState <= NORMAL;
			end if;

		when PROGRAMACAO =>
			modo_out <= '1';
			if (set = '1') then
				s_nextState <= NORMAL;
			else
				s_nextState <= PROGRAMACAO;
			end if;

			
		end case;

	end process;

end Behavioral;
