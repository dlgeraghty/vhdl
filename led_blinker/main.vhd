----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/15/2020 05:42:19 PM
-- Design Name: 
-- Module Name: main - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port(
        clk     :   in  std_logic;
        rst     :   in  std_logic;
        sig     :   in  std_logic;
        led     :   out std_logic_vector(15 downto 0)
    );
end main;

architecture rtl of main is
    component divisor is
    port (
        rst        : in  std_logic;         -- asynch reset
        clk_100mhz : in  std_logic;         -- 100 MHz input clock
        clk_1hz    : out std_logic          -- 1 Hz output clock
    );
    end component divisor;
    
    signal clk_1Hz  :   std_logic;
    signal leds_r   :   std_logic_vector(15 downto 0);
    signal counter  :   std_logic;
begin

    i_divisor   :   divisor port    map(
        rst         =>  rst,
        clk_100mhz  =>  clk,
        clk_1hz     =>  clk_1Hz
    );
    
    i_blink :   process(clk_1Hz,rst)    
    begin
        if  rst =   '0' then
            leds_r  <=  (others  =>  '0');
        elsif   rising_edge(clk_1Hz)    then
            if counter  =   '0' then
                leds_r    <=  (others =>  '1');
                counter <=  '1';
            elsif   counter =   '1' then
                leds_r  <=  (others =>  '0');
                counter <=  '0';
            end if;
        end if;
        
    end process i_blink;
            
    led    <=  leds_r;


end rtl;
