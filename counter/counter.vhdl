library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Counter is
  port (Clock, Reset: in Std_logic;
        Q:   out Std_logic_vector(7 downto 0));
end;

architecture RTL of Counter is
  signal q_count: unsigned( 7 downto 0 );
begin
  process ( Reset, Clock )
  begin
    if Reset = '1' then
      q_count <= ( others => '0' );
    elsif rising_edge( Clock ) then
	  q_count <= q_count + 1;
    end if;
  end process;

  Q <= std_logic_vector( q_count );

end;
