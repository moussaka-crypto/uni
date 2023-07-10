library ieee;
use ieee.std_logic_1164.all;

entity versuch1b is

port ( 
			S: in std_logic_vector(3 downto 0);
			Y: out std_logic
		);
		
end versuch1b;

architecture verhalten of versuch1b is

begin
		Y <= not (S(3) or (S(2) and S(1) and S(0)));
	
end verhalten;
