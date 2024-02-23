library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity RAM_1P_Demo is
    port (
        CLOCK_50 : in std_logic;
        KEY : in std_logic_vector(0 downto 0);
        SW : in std_logic_vector(15 downto 0);
        LEDR : out std_logic_vector(7 downto 0)
    );

end RAM_1P_Demo;

architecture structural of RAM_1P_Demo is
    signal s_key : std_logic;
	 signal s_sw : std_logic_vector(15 downto 0);
    signal s_ledr : std_logic_vector(7 downto 0) := (others => '0');
	 signal data_write : std_logic_vector(7 downto 0) := (others => '0');

begin

    process(CLOCK_50)
	 
	

    begin
        if rising_edge(CLOCK_50) then
            s_sw <= SW;
        end if;
    end process;
	 
	 

	 debounce_KEY0: entity work.DebounceUnit(Behavioral)
	
	 generic map(
		
		kHzClkFreq => 50_000,
		mSecMinInWidth => 100,
		inPolarity => '0',
		outPolarity => '1')
		
		
	 port map (
		refClk => CLOCK_50,
		dirtyIn => KEY(0),
		pulsedOut => s_key
	 );
	 
	 
	 contador_inst : entity work.contador
		port map(
		  clk => CLOCK_50,
        inc => s_key,
        data_in => s_ledr,
        data_out => data_write
		);

    ram_1p_16_8_inst: entity work.RAM_1P_16_8
      port map (
        clk         => CLOCK_50,
        address     => s_sw(3 downto 0),
        writeEnable => s_sw(12),
        writeData   => data_write,
        readData    => s_ledr
      );

    LEDR <= s_ledr;

end structural;
