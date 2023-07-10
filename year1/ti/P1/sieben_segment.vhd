library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------------------------------------------
-- Programm dient zur Darstellung der Bitfolge aus 4 Bits in Form einer hexadezimalen Zahl
-- auf der 7-Segmentanzeige
---------------------------------------------------------------------------------------------------

entity sieben_segment is 
	port
		( 																		-- Schnittstelle-Beschreibung						-- 
--	 																			-------------------------------------------------------------------------
			bin		:	in std_logic_vector(3 downto 0);			-- Bitfolge aus 4 Bits								-- (SW3..SW0)
			led_hex	:	out std_logic_vector(6 downto 0)			-- Bitmuster für 7-Segmentanzeige				-- (HEX0)
		);
end sieben_segment;

architecture verhalten of sieben_segment is



begin

with bin select

	led_hex <=  "1000000" when "0000",
					"1111001" when "0001",
					"0100100" when "0010",
					"0111111" when others;
end verhalten;