library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(reset, clk : in std_logic; number : out std_logic_vector(3 downto 0));
end counter;

architecture circuit of counter is
signal inner: std_logic_vector(3 downto 0);
begin
	process (reset, clk, inner)
	begin
		if(reset = '1') then
			inner <= "0000";
		elsif clk'event and clk = '1' then
			inner <= inner+1;
		end if;
	end process;
	number <= inner;
end circuit;

