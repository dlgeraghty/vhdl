library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Counter_tb is
end;

architecture bench of Counter_tb is

  component Counter
    port (Clock, Reset: in Std_logic;
          Q:   out Std_logic_vector(7 downto 0));
  end component;

  signal Clock, Reset: Std_logic;
  signal Q: Std_logic_vector(7 downto 0);

  constant clock_period: time := 1 ns;

begin

  uut: Counter port map ( Clock  => Clock,
                          Reset  => Reset,
                          Q      => Q );

  stimulus: process
  begin
  
    -- Put initialisation code here

    Reset <= '1';
    wait for 1 ns;
    Reset <= '0';
    wait for 1 ns;
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
