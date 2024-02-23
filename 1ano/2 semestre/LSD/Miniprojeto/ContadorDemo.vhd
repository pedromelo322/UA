library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorDemo is
    Port ( 
        CLOCK_50 : in std_logic;
        KEY  : in std_logic_vector(1 downto 0);
		  Hex0 : out std_logic_vector(6 downto 0);
		  Hex1 : out std_logic_vector(6 downto 0)
    );
end ContadorDemo;

architecture Behavioral of ContadorDemo is
    signal contador, binout0, binout1 : std_logic_vector(3 downto 0);
    signal clk : std_logic;
    signal s_enable : std_logic := '1';
    signal decOut0, decOut1 : std_logic_vector(6 downto 0);
	 signal s_startStop: std_logic;



begin





    debounce_KEY0: entity work.DebounceUnit(Behavioral)
	 
		 generic map(
		 
				kHzClkFreq => 50_000,
				mSecMinInWidth => 100,
				inPolarity => '0',
				outPolarity => '1')
		 
		 
		 port map (
			  refClk => CLOCK_50,
			  dirtyIn => KEY(0),
			  pulsedOut => s_startStop
		 );
		 
	 
	 freqdivider_inst: entity work.FreqDivider
        port map (
            clkIn => CLOCK_50,
            k => X"01312D00",
            clkOut => clk
        );
		 
		 

    process(s_startStop)

    begin

        if (rising_edge(s_startStop)) then
		  
				if (s_enable = '0') then
					s_enable <= '1';
				else 
					s_enable <= '0';
							
				end if;

				
		  else
				s_enable <= s_enable;
				
        end if;
		  
		  
    end process;
	 
	 
	--FlipFlopD_inst : entity work.DFlipFlop
        --port map (
            --clk => s_startStop,
            --rst => not KEY(1),
            --d => s_startStop,
            --q => s_enable
        --);



    TimerN : entity work.TimerN
        port map (
            clk => clk,
            rst => not KEY(1),
            en => s_enable,
            s_count => contador
        );
		  
	 binout0 <= std_logic_vector(unsigned(contador)/10);
    binout1 <= std_logic_vector(unsigned(contador) rem 10);
		 

    bin7segdecoder_inst0: entity work.Bin7SegDecoder
      port map (
        binInput => binout0,
        decOut_n => decOut0
      );
		
		
	 bin7segdecoder_inst1: entity work.Bin7SegDecoder
      port map (
        binInput => binout1,
        decOut_n => decOut1
      );
		  
	
	Hex0 <= decOut1;
	Hex1 <= decOut0;

end Behavioral;