library IEEE;
use IEEE.std_logic_1164.all;

entity ControloRadiador is
    port(
      CLOCK_50 : in std_logic;
      SW : in std_logic_vector(1 downto 0);
	  KEY : in std_logic_vector(3 downto 0);
	  LEDG : out std_logic_vector(6	downto 0);
	  LEDR : out std_logic_vector(0 downto 0);
      HEX0, HEX1, HEX2, HEX3, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)

    );
end ControloRadiador;

architecture Structural of ControloRadiador is
    signal s_pulse, p_pulse, minus_pulse, plus_pulse, gen_pulse, s_plus, s_minus, s_plus_long, s_minus_long: std_logic := '0';
	signal s_set, s_modo, s_blink, blink, s_blink_h, s_blink_m, modo_ram, en_ram, OnOff: std_logic := '0';
	signal s_adress1, adress: std_logic_vector(4 downto 0) := (others => '0');
	signal s_adress0, horas: std_logic_vector(10 downto 0) := (others => '0');
	signal s_temp, writeData: std_logic_vector(6 downto 0) := (others => '0');
	signal Tamb   : std_logic_vector(11 downto 0);
	signal tamb_dec, tamb_und, tamb_dez : std_logic_vector(3 downto 0) := (others => '0');
	signal Tref : std_logic_vector(11 downto 0);

begin 



	 debounce_KEY3: entity work.DebounceUnit(Behavioral)
	
	 generic map(
		
		kHzClkFreq => 50_000,
		mSecMinInWidth => 50,
		inPolarity => '0',
		outPolarity => '1')
		
		
	 port map (
		refClk => CLOCK_50,
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
		refClk => CLOCK_50,
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
		refClk => CLOCK_50,
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
		refClk => CLOCK_50,
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
		refClk => CLOCK_50,
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
		refClk => CLOCK_50,
		dirtyIn => KEY(0),
		pulsedOut => s_minus_long
	);
	


	procbotao_inst_minus: entity work.ProcBotao
	  port map (
		clk        => CLOCK_50,
		pulse_01s  => s_minus,
		pulse_1s   => s_minus_long,
		key        => key(0),
		out_signal => minus_pulse
	  );

	procbotao_inst_plus: entity work.ProcBotao
	  port map (
		clk        => CLOCK_50,
		pulse_01s  => s_plus,
		pulse_1s   => s_plus_long,
		key        => key(1),
		out_signal => plus_pulse
	  );

	 
	
	---------------------------------------------------------------------------------

	 
	controlunit_inst: entity work.ControlUnit(Behavioral)
	  port map (
		clk              => CLOCK_50,
		set_p            => p_pulse,
		set_s            => s_pulse,
		en_7seg          => s_blink,
		modo_ram_out     => modo_ram,
		set_relogio_out  => s_set,
		modo_relogio_out => s_modo
	  );


	 
	 ---------------------------------------------------------------------------------


    pulse_generator_inst: entity work.Pulse_Generator(Behavioral)
      port map (
        acel  => SW(1 downto 0),
        clk   => CLOCK_50,
        pulse => gen_pulse
      );

    relogio_inst: entity work.Relogio
      port map (
		clk      => CLOCK_50,
      en       => gen_pulse,
		modo 	 => s_modo,
		set 	 => s_set,
		plus 	 => plus_pulse,
		minus 	 => minus_pulse, 
		horasout => s_adress0		
      );
		
		
	---------------------------------------------------------------------------------
	
	programahorario_inst : entity work.ProgramaHorario(Behavioral)
		port map(
			clk => CLOCK_50,
			address => adress,
			writeEnable => en_ram,
			writeData => writeData,
			readData => s_temp
		);
	
	---------------------------------------------------------------------------------

	freqpiscar_inst: entity work.FreqPiscar(Behavioral)
	  port map (
		clk    => CLOCK_50,
		en_in  => s_blink,
		en_out => blink
	  );

	  
	  
	escolhapiscar_inst : entity work.EscolhaPiscar(Behavioral)
		port map(
		clk => CLOCK_50,
		set => s_set,
		blink => blink,
		blink_h => s_blink_h,
		blink_m => s_blink_m
		);

	-------------------------------------------------------------------------------
		
	mux3para1_inst: entity work.Mux3para1(Behavioral)
	  port map (
		clk => CLOCK_50,
		sel => s_temp,
		y   => Tref
	  );



	controlonoff_inst: entity work.ControlOnOff(Behavioral)
	  port map (
		clk   => CLOCK_50,
		Tref  => Tref,
		Tamb  => Tamb,
		OnOff => OnOff
	  );

	LEDR(0) <= OnOff;

	simulambiente_inst: entity work.SimulAmbiente(Behavioral)
	  port map (
	   tempo => gen_pulse,
		clk   => CLOCK_50,
		up_down => OnOff,
		counter => Tamb
	  );



	---------------------------------------------------------------------------------



	proghoras_inst: entity work.ProgHoras(Behavioral)
	  port map (
		en       => modo_ram,
		clk      => CLOCK_50,
		plus     => plus_pulse,
		minus    => minus_pulse,
		data_out => s_adress1
	  );

	  

	escolherendreco_inst: entity work.EscolherEndreco(Behavioral)
	  port map (
		en         => modo_ram,
		clk        => CLOCK_50,
		adress0    => s_adress0,
		adress1    => s_adress1,
		adress_out => adress,
		horas_out  => horas
	  );


	configendreco_inst: entity work.ConfigEndreco(Behavioral)
	  port map (
		en_ram   => en_ram,
	   data_in  => s_temp,
		modo     => modo_ram,
		clk      => CLOCK_50,
		inc      => s_pulse,
		data_out => writeData
	  );


	  
	LEDG <= writeData;

	---------------------------------------------------------------------------------
	tempodisplay_inst: entity work.TempoDisplay
	  port map (
		clk          => CLOCK_50,
		s_blink_m    => s_blink_m,
		s_blink_h    => s_blink_h,
		tempo_bin    => horas,
		minutos0_hex => HEX0,
		minutos1_hex => HEX1,
		horas0_hex   => HEX2,
		horas1_hex   => HEX3
	  );


	temperaturadisplay_inst: entity work.TemperaturaDisplay
	  port map (
	   clk      => CLOCK_50,
		Tamb     => Tamb,
		Tamb_dez => HEX7,
		Tamb_und => HEX6,
		Tamb_dec => hEX5
	  );



end Structural;

