library ieee;
use ieee.std_logic_1164.all;

entity mux3to1 is
    Port (
		  clk : in std_logic;
        sel : in std_logic_vector(6 downto 0);
		  y : out std_logic_vector(11 downto 0)
    );
end mux3to1;

architecture Behavioral of mux3to1 is

	 constant Tsol : std_logic_vector(11 downto 0) := "000011001000";
	 constant Tlua : std_logic_vector(11 downto 0) := "000010100000";
	 constant Tgelo : std_logic_vector(11 downto 0) := "000000101000";
    


begin
    process(sel,clk)
    begin
		if (rising_edge(clk)) then
        case sel is
            when "1000000" => y <= Tsol;
            when "0001000" => y <= Tlua;
            when "0000001" => y <= Tgelo;
            when others => y <= (others => '0'); 
        end case;
		end if;
    end process;
end Behavioral;
