library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity fsm_tb is
end;

architecture bench of fsm_tb is

  component FSM
  port (reset, E : in bit; Clock: in Std_logic;
        O:   out bit;
        CURRENT_STATE: out std_logic_vector(3 downto 0));
  end component;

  signal Clock: Std_logic;
  signal reset, E, O: bit;
  signal CURRENT_STATE: std_logic_vector(3 downto 0);
  
  constant clock_period: time := 1 ns;

begin

  uut: FSM port map ( Clock  => Clock,
                          Reset  => reset,
                          E      => E,
                          O      => O,
                          CURRENT_STATE => CURRENT_STATE);

  stimulus: process
  begin
  
    -- Put initialisation code here

    Reset <= '0';
    wait for 1 ns;
    E <= '1';
    wait for 1 ns;
    E <= '0';
    wait for 4 ns;
    E <= '1';
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
