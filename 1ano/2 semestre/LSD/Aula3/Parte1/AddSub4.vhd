library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity AddSub4 is
    port(sub : in std_logic;
        a,b :in std_logic_vector(3 downto 0);
        cout : out std_logic;
        s : out std_logic_vector(3 downto 0));


end AddSub4;

--architecture Structural of AddSub4 is
--    signal s_b : std_logic_vector(3 downto 0);
--
--    signal s_cout : std_logic;
--
--begin
--    cout <= s_cout when (sub = '0') else not s_cout;
--    s_b <= b when (sub = '0') else not b;
--
--    AddSub4: entity work.Adder4(Structural)
--        port map(a => a,
--                 b => s_b,
--                 cin => sub,
--                 cout => s_cout,
--                 s => s);
--
--end Structural;

architecture Behavioral of AddSub4 is
    signal s_a, s_b, s_s : unsigned(4 downto 0);
    begin
    s_a <= '0' & unsigned(a); -- '0's para capturar o cout do
    s_b <= '0' & unsigned(b); -- do bit mais significativo
    s_s <= (s_a + s_b) when (sub = '0') else
    (s_a - s_b);
    s <= std_logic_vector(s_s(3 downto 0));
    cout <= s_s(4);
end Behavioral;