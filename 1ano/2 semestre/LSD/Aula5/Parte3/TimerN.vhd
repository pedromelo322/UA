library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimerN is
    generic (
        N : integer := 6
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        start : in std_logic;
        s_count : out std_logic_vector(4 downto 0);
        TimerOut : out std_logic
    );


end TimerN;

architecture Behavioral of TimerN is
    signal count : std_logic_vector(4 downto 0) := (others => '0');
    signal count_en : std_logic := '0';

begin
    
        process(clk, rst)
        begin
            if rst = '1' then
                count <= (others => '0');
                count_en <= '0';
            elsif rising_edge(clk) then
                if en = '1' then
                    if start = '1' then
                        count_en <= '1';
                        count <= std_logic_vector(unsigned(count) + 1);
                    end if;
                    if count_en = '1' then
                        if unsigned(count) = to_unsigned(N, 4) then
                            count <= (others => '0');
                            count_en <= '0';
                        else
                            count <= std_logic_vector(unsigned(count) + 1);
                        end if;
                    end if;
                end if;
            end if;
        end process;
    
        s_count <= count;
        TimerOut <= count_en;
    
    end Behavioral;