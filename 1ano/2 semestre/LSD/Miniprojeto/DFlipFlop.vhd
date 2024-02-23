Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFlipFlop is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;  
      rst: in std_logic;
      D :in  std_logic    
   );
end DFlipFlop;

architecture Behavioral of DFlipFlop is  

begin  
	process(Clk,rst)
	begin 
     if(rst='1') then 
			Q <= '1';
	  elsif(rising_edge(Clk)) then
			if (D = '1') then
				Q <= '0'; 
			else
				Q <= '1'; 
			end if;
	  end if;      
 end process;  
end Behavioral;