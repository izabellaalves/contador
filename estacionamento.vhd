library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std;

entity estacionamento is
    Port (entra : in std_logic;
          sai : in std_logic;
          elib : out std_logic;
          enao : out std_logic);
end estacionamento;

architecture Behavioral of estacionamento is
begin
    process(entra, sai)
    variable contagem : integer:=0;
    begin 
    
    if rising_edge(entra) then
        contagem:= contagem + 1;
        if contagem<15 then 
            elib <= '1';
            enao<='0';
        elsif contagem>=15 then
            contagem:=15;
            enao <= '1';
            elib<='0';
    end if;
    end if;
    
    
    if rising_edge(sai) then
        contagem:= contagem - 1;
        if contagem<15 then 
            elib <= '1';
            enao<='0';
        elsif contagem>=15 then
            contagem:=15;
            enao <= '1';
            elib<='0';
            end if;
     end if;
