library ieee;
use ieee.std_logic_1164.all;


entity demultiplexer is 

	port(
		a:		in std_logic;			-- zu demultiplexendes Eingangssignal SW0 
		s:		in std_logic_vector(2 downto 0); -- Adresse: Key 2..0			
		x:		out std_logic_vector(7 downto 0) -- Output auf LEDs
	);

end demultiplexer;

architecture verhalten of demultiplexer is
begin 

		x(0) <= a when s = "000" else '0';
		x(1) <= a when s = "001" else '0';
		x(2) <= a when s = "010" else '0';
		x(3) <= a when s = "011" else '0';
		x(4) <= a when s = "100" else '0';
		x(5) <= a when s = "101" else '0';
		x(6) <= a when s = "110" else '0';
		x(7) <= a when s = "111" else '0';
		
end verhalten;