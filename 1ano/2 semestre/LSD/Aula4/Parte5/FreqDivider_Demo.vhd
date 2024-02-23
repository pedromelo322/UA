library ieee;
use ieee.std_logic_1164.all;

entity FreqDivider_Demo is
      port(
              clk: in std_logic;
              SW : in std_logic_vector(1 downto 0);
              LEDR : out std_logic_vector(0 downto 0);
              Hex0 : out std_logic_vector(6 downto 0)
              );

end FreqDivider_Demo;

architecture Shell of FreqDivider_Demo is

    signal k_value : std_logic_vector(31 downto 0) := x"02FAF080";
    signal clk_div : std_logic;
    signal bin7dec : std_logic_vector(3 downto 0);


begin

    freq_div : entity work.FreqDivider(Behavioral)
    port map(
        clkIn => clk,
        k => k_value,
        clkOut => clk_div
        );

    LEDR(0) <= clk_div;

    counter: entity work.CounterUpDown4(Behavioral)
    port map(
        clk => clk_div,
        reset => SW(0),
        upDown => Sw(1),
        count => bin7dec
        );

    bin7segdec : entity work.Bin7SegDecoder(Behavioral)
    port map(
        bininput => bin7dec,
        decOut_n => Hex0
        );
    
end Shell;