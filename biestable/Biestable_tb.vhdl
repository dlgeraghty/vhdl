library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Biestable_tb is
end;

architecture bench of Biestable_tb is

  component Biestable
  port ( Clock, Reset: in Std_logic; d: in bit;
        q:   out bit);
  end component;

  signal Clock, Reset: Std_logic;
  signal d, q: bit;

  constant clock_period: time := 1 ns;

begin

  uut: Biestable port map ( Clock  => Clock,
                          Reset  => Reset,
                          d      => d,
                          q      => q);

  stimulus: process
  begin
  
    -- Put initialisation code here

    Reset <= '0';
    d <= '1';
    wait for 10 ns;
    Reset <= '1';
    wait for 10 ns;
    Reset <= '0';
    -- Put test bench stimulus code here

    wait;
  end process;

  clocking: process
  begin
    while true loop
      Clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
