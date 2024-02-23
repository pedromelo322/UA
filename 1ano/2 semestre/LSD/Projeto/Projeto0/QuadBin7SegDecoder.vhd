library ieee;
use ieee.std_logic_1164.all;

entity QuadBin7SegDecoder is
    port(
        binInput : in  std_logic_vector(15 downto 0);
        decOut_n0, decOut_n1, decOut_n2, decOut_n3 : out std_logic_vector(6 downto 0)
    );
end QuadBin7SegDecoder;

architecture Behavioral of QuadBin7SegDecoder is
begin 
    Bin7SegDecoder_inst0: entity work.Bin7SegDecoder
      port map (
        binInput => binInput(3 downto 0),
        decOut_n => decOut_n0
      );

    Bin7SegDecoder_inst1: entity work.Bin7SegDecoder
      port map (
        binInput => binInput(7 downto 4),
        decOut_n => decOut_n1
      );

    Bin7SegDecoder_inst2: entity work.Bin7SegDecoder
      port map (
        binInput => binInput(11 downto 8),
        decOut_n => decOut_n2
      );

    Bin7SegDecoder_inst3: entity work.Bin7SegDecoder
      port map (
        binInput => binInput(15 downto 12),
        decOut_n => decOut_n3
      );
end Behavioral;
