library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD is
    Port ( 
        Bin : in std_logic_vector(7 downto 0);
        bInout0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        bInout1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        bInout2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end Bin2BCD;


architecture Behavioral of Bin2BCD is

SIGNAL rmSignal : unsigned(7 DOWNTO 0);
BEGIN
    rmsignal <= unsigned(Bin);
    bInout2 <= STD_LOGIC_VECTOR(rmSignal/100)(3 DOWNTO 0);
    bInout1 <= STD_LOGIC_VECTOR((rmSignal REM 100)/10)(3 DOWNTO 0);
    bInout0 <= STD_LOGIC_VECTOR((rmSignal REM 100) REM 10)(3 DOWNTO 0);
END Behavioral;