library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TempAmbBin is
    Port (
        clk      : in std_logic;
        Tamb  : in std_logic_vector(11 downto 0);
		  Tamb_dez: out std_logic_vector(3 downto 0);
		  Tamb_und: out std_logic_vector(3 downto 0);
		  Tamb_dec: out std_logic_vector(3 downto 0)
    );
end TempAmbBin;

architecture Behavioral of TempAmbBin is

	signal dez, und, dec : std_logic_vector(3 downto 0);
	signal s_Tamb  : 	unsigned(11 downto 0);
	signal temp_dec, temp_und, temp_dez : std_logic_vector(11 downto 0);
	
begin
	
	process(clk)
		
	begin
		
		if (rising_edge(clk)) then
        s_Tamb <= unsigned(Tamb);

        temp_dec <= std_logic_vector(s_Tamb rem 10);
        dec <= temp_dec(3 downto 0);

        temp_und <= std_logic_vector((s_Tamb / 10) rem 10);
        und <= temp_und(3 downto 0);

        temp_dez <= std_logic_vector(s_Tamb / 100);
        dez <= temp_dez(3 downto 0);
		  
    end if;
	
	end process;
	
	
	bin7segdecoder_inst4: entity work.Bin7SegDecoder(Behavioral)
	  port map (
		en 		=> '1',
		binInput => dec,
		decOut_n => Tamb_dec
	  );	
	  
	bin7segdecoder_inst5: entity work.Bin7SegDecoder(Behavioral)
	  port map (
	   en 		=> '1',
		binInput => und,
		decOut_n => Tamb_und
	  );

	bin7segdecoder_inst6: entity work.Bin7SegDecoder(Behavioral)
	  port map (
	   en 		=> '1',
		binInput => dez,
		decOut_n => Tamb_dez
		);

end Behavioral;