library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 



	port (
		reset_n     : in std_logic; -- Key 3
      clk         : in std_logic; --50 MHz
		switches		: in std_logic_vector(7 downto 0); -- zur Übernahme des ofl-values
		cnt_enable	: in std_logic; -- SW9
		ofl_rd		: in std_logic; -- read and store ofl-value, KEY0
		cnt_rd		: in std_logic; -- read and store the actual count-value, KEY1
		cnt_val_act : out std_logic_vector(7 downto 0); -- aktueller Zählwert
		cnt_val_stored_out : out std_logic_vector(7 downto 0) -- gespeicherter Zählwert
		
		
		
		);
end entity counter;

architecture arch of counter is

signal counter_int : unsigned(7 downto 0);
signal counter_of : std_logic_vector(7 downto 0);
signal clk_count: unsigned(22 downto 0);
signal cnt_val_stored_out_int : std_logic_vector(7 downto 0);

begin

counter: process(Clk, reset_n) is
begin

if (reset_n = '1') then --key 3
	counter_int <= (others => '0');

	
elsif(rising_edge(clk)) then 
	
	clk_count<= clk_count+1;
	
	if (ofl_rd = '1') then --key 0
		counter_of <= not switches;
	end if;
	
	if (cnt_rd = '1') then -- key 1
		cnt_val_stored_out_int <= std_logic_vector(counter_int);
	end if;
	
	if(cnt_enable = '0' and to_integer(clk_count) = 5000000-1 ) then
	
			if (counter_of = std_logic_vector(counter_int)) then
				counter_int <= (others => '0');
			else
			counter_int <= counter_int + 1;
			end if;
			
			clk_count <= (others => '0');
			

	end if;
	
end if;

cnt_val_act <= std_logic_vector(not counter_int);
cnt_val_stored_out <= not cnt_val_stored_out_int;

end process counter;

end architecture arch;


	