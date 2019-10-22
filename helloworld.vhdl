
-- Hello world program -> credit: quick start guide ghdl

use std.textio.all; -- Text package!

entity hello_world is
end hello_world;

architecture behaviour of hello_world is
begin
  process
    variable l: line;
  begin
    write (l, String'("Hello world"));
    writeline (output, l);
    wait;
  end process;
end behaviour;
