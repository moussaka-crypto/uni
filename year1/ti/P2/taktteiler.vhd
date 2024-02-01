library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity taktteiler is 


	port (
	clk         : in std_logic; --50 MHz
	clk_10Hz	: out std_logic			
		
		);
end entity taktteiler;

architecture arch of taktteiler is
signal counter: unsigned (21 downto 0);
signal clk_10Hz_int: std_logic;

begin

p: process(clk)
begin

if(rising_edge(clk)) then 

counter <= counter + 1;

	if (to_integer(counter)) = 2500000 - 1 then

		clk_10Hz_int <= not clk_10Hz_int; --fertig mit den Takzyklen
		counter <= to_unsigned(0, counter' length); -- counter reset 
	end if;
	
end if;

end process p;

clk_10Hz <= clk_10Hz_int;

end architecture arch;
