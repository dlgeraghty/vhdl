library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Biestable is
  port ( Clock, Reset: in Std_logic; d: in bit;
        q:   out bit);
end;

architecture RTL of Biestable is
signal q_val: bit;
begin
  process ( Reset, Clock, d )
  begin
  	if(Reset = '1') then q_val <= '0';
  	elsif rising_edge(Clock) then q_val <= d;
  	end if; 	  	
  end process;
  
  q <= q_val;

end;
