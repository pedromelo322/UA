library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SimulAmbiente is
    Port (
		  tempo    : in std_logic;
        clk      : in std_logic;
        up_down  : in std_logic;
        counter  : out std_logic_vector(11 downto 0)
    );
end SimulAmbiente;

architecture Behavioral of SimulAmbiente is
    signal counter_int : unsigned(11 downto 0) := (others => '0');	 
	 
	 
begin
    process(clk)
    begin
        if rising_edge(clk) then
		    if (tempo = '1') then
            if up_down = '1' then
                if counter_int < "000111111111" then
                    counter_int <= counter_int + 1;
                else
                    counter_int <= (others => '0');
                end if;
            else
                if counter_int > "000000000000" then
                    counter_int <= counter_int - 1;
                else 
                    counter_int <= (others => '0');
                end if;
            end if;
			 end if;
			 counter <= std_logic_vector(counter_int);
        end if;
    end process;

    
end Behavioral;
