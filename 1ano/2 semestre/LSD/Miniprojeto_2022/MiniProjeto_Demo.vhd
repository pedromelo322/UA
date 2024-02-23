library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MiniProjeto_Demo is
    port(
        CLOCK_50 : in std_logic;
        LEDR : out std_logic_vector(3 downto 0);
        Hex0 : out std_logic_vector(6 downto 0);
        Hex1 : out std_logic_vector(6 downto 0);   
        Key  : in std_logic_vector(1 downto 0)
    );
end MiniProjeto_Demo;

architecture Shell of MiniProjeto_Demo is
    signal s_select : std_logic := '1';
    signal k_value : std_logic_vector(31 downto 0) := x"00BEBC20";
	 signal k_value_s : std_logic_vector(31 downto 0);
    signal bininput, binout0, binout1 : std_logic_vector(3 downto 0);
    signal clk : std_logic;

begin 

		  
		process(CLOCK_50, k_value)
		begin
			if rising_edge(clk) then
				k_value <= k_value_s;
			end if;
		end process;

    freqdivider_inst: entity work.FreqDivider
        port map (
            clkIn => CLOCK_50,
            k => k_value,
            clkOut => clk
        );

    CUD: entity work.CounterUpDown4(Behavioral)
        port map(
            clk => clk,
            reset => not Key(0),
            upDown => s_select,
            count => bininput
        );
          
    binout0 <= std_logic_vector(unsigned(bininput)/10);
    binout1 <= std_logic_vector(unsigned(bininput) rem 10);

    sel: entity work.selecter(selecter_arch)
        port map(
            input => bininput,
            sel => s_select,
            output => s_select
        );
        
    bin7segdecoder0_inst: entity work.Bin7SegDecoder(Behavioral)
        port map (
            binInput => binout0,
            decOut_n => Hex1
        );
        
    bin7segdecoder1_inst: entity work.Bin7SegDecoder(Behavioral)
        port map (
            binInput => binout1,
            decOut_n => Hex0
        );

    LEDR <= bininput;
	 


end Shell;