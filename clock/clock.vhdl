library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity clock is port(clk: out bit);
end clock;

architecture clock_arch of clock is
	begin 
		process
			begin
				wait for 10 ns;
				clock_loop : loop
					clk <= '0';
					wait for 10 ns;
					clk <= '1';
					wait for 10 ns;
				end loop clock_loop;
		end process;
	end clock_arch;
