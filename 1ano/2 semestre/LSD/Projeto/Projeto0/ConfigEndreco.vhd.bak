library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ConfigEndreco is
    port (
		en_ram : out std_logic;
        modo : in std_logic;
        clk : in std_logic;
        inc : in std_logic;
        data_in : in std_logic_vector(6 downto 0);
        data_out : out std_logic_vector(6 downto 0)
    );
end ConfigEndreco;

architecture Behavioral of ConfigEndreco is

    constant gelo : std_logic_vector(6 downto 0) := "0000001";
    constant lua : std_logic_vector(6 downto 0) := "0001000";
    constant sol : std_logic_vector(6 downto 0) := "1000000";

    signal data_signal : std_logic_vector(6 downto 0);
	 signal s_enram : std_logic;

begin

    process(clk)
    begin
	
        if rising_edge(clk) then
				data_signal <= data_in;
				s_enram <= '0';
		 
            if modo = '1' then
                if inc = '1' then
					 
							s_enram <= '1';
					 
                    if data_signal = gelo then
                        data_signal <= lua;
                    elsif data_signal = lua then
                        data_signal <= sol;
                    elsif data_signal = sol then
                        data_signal <= gelo;
                    end if;
                end if;
					 en_ram <= s_enram;
					 data_out <= data_signal;
				else
					data_out <= "0000000";
            end if;

        end if;
    end process;

end Behavioral;
