library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
	port(
		  clk		: in  std_logic;
		  set_p	: in  std_logic;
		  set_s	: in  std_logic;
		  en_7seg : out std_logic;
		  modo_ram_out : out std_logic;
		  set_relogio_out : out std_logic;
		  modo_relogio_out	: out std_logic);
end ControlUnit;

architecture Behavioral of ControlUnit is

	type TState is (NORMAL, SET_H, SET_M, PROGRAMACAO);
	signal s_currentState, s_nextState : TState := NORMAL;

begin
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
				s_currentState <= s_nextState;
		end if;
	end process;

	comb_proc : process(s_currentState, set_p, set_s)
	begin
		case (s_currentState) is
		when NORMAL =>
			modo_ram_out <= '0';
			en_7seg <= '1';
			modo_relogio_out <= '0';
			set_relogio_out <= '0';
			if (set_s = '1') then
				s_nextState <= SET_H;
			elsif (set_p = '1') then
				s_nextState <= PROGRAMACAO;
			else
				s_nextState <= NORMAL;
			end if;

		when SET_H =>
			modo_ram_out <= '0';
			en_7seg <= '0';
			modo_relogio_out <= '1';
			set_relogio_out <= '0';
			if (set_s = '1') then
				s_nextState <= SET_M;
			else
				s_nextState <= SET_H;
			end if;

		when SET_M =>
			modo_ram_out <= '0';
			en_7seg <= '0';
			modo_relogio_out <= '1';
			set_relogio_out <= '1';
			if (set_s = '1') then
				s_nextState <= NORMAL;
			else
				s_nextState <= SET_M;
			end if;
			
		when PROGRAMACAO =>
			modo_ram_out <= '1';
			en_7seg <= '1';
			modo_relogio_out <= '0';
			set_relogio_out <= '0';
			if (set_p = '1') then
				s_nextState <= NORMAL;
			else
				s_nextState <= PROGRAMACAO;
			end if;




		
		end case;

	end process;

end Behavioral;