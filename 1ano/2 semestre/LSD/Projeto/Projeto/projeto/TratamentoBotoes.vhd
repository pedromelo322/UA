library IEEE;
use IEEE.std_logic_1164.all;

entity TratamentoBotoes is
    port(
		clk : in std_logic;
		Key : in std_logic_vector(3 downto 0);
		p_pulse, s_pulse, minus_pulse, plus_pulse: out std_logic
    );

end TratamentoBotoes;

architecture Behavioral of TratamentoBotoes is


	signal s_plus, s_minus, s_plus_long, s_minus_long: std_logic := '0';

begin


	debounce_KEY3: entity work.DebounceUnit(Behavioral)
	
	generic map(
		
		kHzClkFreq => 50_000,
		mSecMinInWidth => 50,
		inPolarity => '0',
		outPolarity => '1')
		
		
	port map (
		refClk => clk,
		dirtyIn => KEY(3),
		pulsedOut => p_pulse
	);
		
		
	debounce_KEY2: entity work.DebounceUnit(Behavioral)
	
	generic map(
		
		kHzClkFreq => 50_000,
		mSecMinInWidth => 50,
		inPolarity => '0',
		outPolarity => '1')
		
		
	port map (
		refClk => clk,
		dirtyIn => KEY(2),
		pulsedOut => s_pulse
	);
	 
	debounce_KEY1: entity work.DebounceUnit(Behavioral)

	generic map(

		kHzClkFreq => 50_000,
		mSecMinInWidth => 50,
		inPolarity => '0',
		outPolarity => '1')

	
	port map (
		refClk => clk,
		dirtyIn => KEY(1),
		pulsedOut => s_plus
	);
	
	


   debounce_KEY0: entity work.DebounceUnit(Behavioral)

	generic map(

		kHzClkFreq => 50_000,
		mSecMinInWidth => 50,
		inPolarity => '0',
		outPolarity => '1')

	
	port map (
		refClk => clk,
		dirtyIn => KEY(0),
		pulsedOut => s_minus
	);
	
	
	
	
	
	debounce_KEY1_long: entity work.DebounceUnit(Behavioral)

	generic map(

		kHzClkFreq => 50_000,
		mSecMinInWidth => 1000,
		inPolarity => '0',
		outPolarity => '1')

	
	port map (
		refClk => clk,
		dirtyIn => KEY(1),
		pulsedOut => s_plus_long
	);
	


   debounce_KEY0_long: entity work.DebounceUnit(Behavioral)

	generic map(

		kHzClkFreq => 50_000,
		mSecMinInWidth => 1000,
		inPolarity => '0',
		outPolarity => '1')

	
	port map (
		refClk => clk,
		dirtyIn => KEY(0),
		pulsedOut => s_minus_long
	);

	processarbotao_inst_minus: entity work.ProcessarBotao
	port map (
	  clk        => clk,
	  pulse_01s  => s_minus,
	  pulse_1s   => s_minus_long,
	  key        => key(0),
	  out_signal => minus_pulse
	);

  processarbotao_inst_plus: entity work.ProcessarBotao
	port map (
	  clk        => clk,
	  pulse_01s  => s_plus,
	  pulse_1s   => s_plus_long,
	  key        => key(1),
	  out_signal => plus_pulse
	);

end Behavioral;