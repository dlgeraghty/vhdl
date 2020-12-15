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
        rst     :   in  std_logic;  --rst activo a baja!!
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
    
    component debounce is
    port (
        clk     : IN  STD_LOGIC;  --input clock
        reset_n : IN  STD_LOGIC;  --asynchronous active low reset
        button  : IN  STD_LOGIC;  --input signal to be debounced
        result  : OUT STD_LOGIC --debounced signal
    );
    end component debounce;
    
    signal clk_1Hz          :   std_logic;
    signal leds_r,shifted   :   std_logic_vector(15 downto 0);
    signal counter          :   std_logic;
    signal  a,  b,  c       :   std_logic;
begin

    i_divisor   :   divisor port    map(
        rst         =>  rst,
        clk_100mhz  =>  clk,
        clk_1hz     =>  clk_1Hz
    );
    
    i_debouncer :   debounce   port    map(
        clk     =>  clk,
        reset_n =>  rst,
        button  =>  sig,
        result  =>  b
    ); 
            
    i_shift_register    :   process(b,rst, clk_1Hz)
    begin
        if  rst =   '0' then
            shifted  <=  (others  =>  '1');
        elsif  rising_edge(clk_1Hz) then
            if b    =   '1' then
                shifted <= shifted(shifted'high-1 downto shifted'low) & '0';
            end if;
        end if;
    end process i_shift_register;
    
    led    <=  shifted;


end rtl;
