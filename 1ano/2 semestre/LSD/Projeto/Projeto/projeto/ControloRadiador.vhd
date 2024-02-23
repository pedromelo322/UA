	library IEEE;
use IEEE.std_logic_1164.all;

entity ControloRadiador is
    port(
      CLOCK_50 : in std_logic;
      SW : in std_logic_vector(1 downto 0);
	  KEY : in std_logic_vector(3 downto 0);
	  LEDG : out std_logic_vector(6	downto 0);
	  LEDR : out std_logic_vector(0 downto 0);
      HEX0, HEX1, HEX2, HEX3, HEX4 ,HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)

    );
end ControloRadiador;

architecture Structural of ControloRadiador is
    signal s_pulse, p_pulse, minus_pulse, plus_pulse, gen_pulse: std_logic := '0';
	signal s_set, estado_horas, estado_minutos, modo_temperatura, en_ram, OnOff: std_logic := '0';
	signal s_adress1, adress: std_logic_vector(4 downto 0) := (others => '0');
	signal s_adress0, horas: std_logic_vector(10 downto 0) := (others => '0');
	signal s_temp, writeData: std_logic_vector(6 downto 0) := (others => '0');
	signal Tamb   : std_logic_vector(11 downto 0);
	signal Tref : std_logic_vector(11 downto 0);
	signal modo_relogio : std_logic_vector(1 downto 0);

begin 


	tratamentobotoes_inst: entity work.TratamentoBotoes
	  port map (
		clk 	    => CLOCK_50,
		Key         => Key,
		p_pulse     => p_pulse,
		s_pulse     => s_pulse,
		minus_pulse => minus_pulse,
		plus_pulse  => plus_pulse
	  );
	 
	
	---------------------------------------------------------------------------------

	 
	controlunit_inst: entity work.ControlUnit(Behavioral)
	  port map (
		clk              => CLOCK_50,
		set_p            => p_pulse,
		set_s            => s_pulse,
		modo_Temperatura_out => modo_temperatura,
		modo_relogio_out => modo_relogio
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
		modo_relogio 	 => modo_relogio,
		modo_ram   => modo_temperatura,
		plus 	 => plus_pulse,
		minus 	 => minus_pulse, 
		horas_out => horas,
		adress_out => adress
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




	configendreco_inst: entity work.ConfigEndreco(Behavioral)
	  port map (
		en_ram   => en_ram,
	   data_in  => s_temp,
		modo     => modo_temperatura,
		clk      => CLOCK_50,
		inc      => s_pulse,
		data_out => writeData
	  );


	  
	LEDG <= writeData;

	---------------------------------------------------------------------------------
	tempodisplay_inst: entity work.TempoDisplay
	  port map (
		clk          => CLOCK_50,
		en           => modo_relogio,
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
		Tamb_dec => HEX5,
		simbolo  => Hex4
	  );



end Structural;

