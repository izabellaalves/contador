LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;

ENTITY Vagas IS
  PORT ( SW1, SW2, clk: IN std_logic;
         led_green,led_red : OUT BIT); 
END Vagas;

architecture Behavioral of Vagas is

BEGIN
   
  PROCESS (SW1, SW2, clk)
  variable count : integer range 0 to 15:=0;
  variable atr : integer;
  variable atr2 : integer;
  BEGIN
    if(clk'event and clk ='1')then
    if(count = 0) then
    if(SW1 ='0' and atr = 0)then
        count := count + 1;
        atr := 1;
    elsif(SW1 = '1') then
        atr:=0;
    end if;
    elsif(count > 0 and count < 15) then
    if(SW1 ='0' and atr = 0)then
        count := count + 1;
        atr := 1;
    elsif(SW1 = '1') then
        atr := 0;
    end if;
    
    if(SW2 ='0' and atr2 = 0)then
        count := count-1;
        atr2 := 1;
    elsif(SW2 = '1') then
        atr2 := 0;
    end if;
    elsif(count = 15) then
    if(SW2 ='0' and atr2 = 0)then
        count := count-1;
        atr2 :=1;
    elsif(SW2 = '1') then
        atr2 := 0;
    end if;
    end if;
    end if;
    if(count=15) then
        led_red <= '1';
        led_green <= '0';
    else 
        led_red <= '0';
        led_green <= '1';
   end if;
    end PROCESS;
    end Behavioral;