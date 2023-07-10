library ieee;
use ieee.std_logic_1164.all;

entity versuch1a is

port ( 
			X: in std_logic_vector(2 downto 0);
			Y: out std_logic
			
			);
			
end versuch1a;

architecture verhalten of versuch1a is

begin 
		Y <= (X(0) and not x(1)) or (X(2) and not X(1));
		
end verhalten;