----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2023 10:41:29
-- Design Name: 
-- Module Name: estacionamento - Behavioral
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
use IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity estacionamento is
    Port (entra : in std_logic;
          sai : in std_logic;
          elib : out std_logic;
          enao : out std_logic);
end estacionamento;

architecture Behavioral of estacionamento is
begin
    process(entra, sai)
    variable contagem : integer range 0 to 15;
    begin 
    if entra'event and entra='1' then
        contagem:= contagem + 1;
    elsif sai'event and sai='1' then
        contagem:= contagem - 1;
     end if;
     
     if contagem<15 then 
        elib <= '1';
        enao <= '0';
     elsif contagem<=15 then
        contagem := 15;
        enao <= '1';
        elib<='0';
     end if;
    end process;

end Behavioral;
