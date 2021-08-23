----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2021 09:24:17 PM
-- Design Name: 
-- Module Name: BtnControl - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BtnControl is
    Port ( 
    MODE_Click          : in  STD_LOGIC                            ;
    MODE_LP             : in  STD_LOGIC                            ;
    SET_Click           : in  STD_LOGIC                            ;
    CLK                 : in STD_LOGIC                             ;
    Q_in                : in STD_LOGIC_VECTOR ( 23 downto 0 )      ;
    CE_S                : out STD_LOGIC                            ;
    CE_M                : out STD_LOGIC                            ;
    CE_H                : out STD_LOGIC                            ;    
    UnD_S               : out STD_LOGIC                            ;
    UnD_HM              : out STD_LOGIC                            ;
    RESETn_S            : out STD_LOGIC                            ;
    RESETn_HM           : out STD_LOGIC                            ;
    
         Q : out STD_LOGIC_VECTOR ( 23 downto 0 )
    );
end BtnControl;

architecture Behavioral of BtnControl is
--semnale de stocare pt comparatie
 signal HM          :   STD_LOGIC            ;
 signal ADJ         :   STD_LOGIC            ;
 signal INC         :   STD_LOGIC            ;
 signal MODE_LP1    :   STD_LOGIC            ;
 signal MODE_Click1 :   STD_LOGIC            ;
 signal test        :   STD_LOGIC       :='0';
 signal test1       :   STD_LOGIC       :='0';

begin

  --LATCH- mentinere semnal pana la urmatoarea apasare click a MODE
process(CLK, MODE_Click1, MODE_Click, test1)
begin
 if rising_edge(CLK) then
     MODE_Click1 <=   MODE_Click;
 end if ;
end process;


process(CLK, MODE_Click1, MODE_Click, test1)
begin
  if rising_edge(CLK) then
    if MODE_Click1 = '0' and MODE_Click= '1' then  --- Rise edge
         test1 <= not test1;
         HM <= test1;       
    end if;
  end if;
end process;
-------------------------------------------------------------------

--LATCH- mentinere semnal pana la urmatoarea aapasare lunga a MODE
process(CLK, MODE_LP1, MODE_LP, test)
begin
 if rising_edge(CLK) then
   MODE_LP1 <=  MODE_LP;
end if ;
end process;


process(CLK, MODE_LP1, MODE_LP, MODE_Click, test)
begin
  if rising_edge(CLK) then
    if MODE_LP1 = '0' and MODE_LP= '1' then  --- Rise edge
         test <= not test;
         ADJ <= test;    
    end if;
  end if;
-----------------------------------------------------------------------

--DE AICI INCEPE LOGICA SEMNALELOR 

--daca butonul de set e apasat, semnalul inc e 1
 if(SET_Click ='1') then
     INC <= '1';
 else 
    INC <= '0';
 end if;

--daca nu suntem in modul de ajustare 
if(ADJ = '1') then
--dupa ce iesim din adjust mode, trebuie sa apasam set ca sa repornim counter-ul    if(INC ='1') then
--semnalele sunt aferente functionarii normale a counter-ului, in functie de portile logice asignate
    CE_S <= '1';
    CE_M <= '1';
    CE_H <= '0'; --aici avem 0 deoarece avem poarta SAU
    RESETn_S <= '1';
    RESETn_HM <= '1';
    UnD_S <= '1';
    UnD_HM <= '1';

else

--daca suntem in modul de ajustare
--coboram toate CE-urile
    CE_S <= '0';
    CE_M <= '0';
    CE_H <= '0';
--coboram reset de la secunde si UnD pentru a avea Q=00 si TC mereu 1
    RESETn_S <= '0';
    UnD_S <= '0';
--pana aici am facut TC_SEC = '1' // Q_SS = X"00"
--aici incrementam in functie de semnalul HM
        if(HM = '1' AND INC = '1') then
        --daca HM = '1', setam minutele
            CE_M <= '1';--activam CE aferent minutelor pentru un impuls INC
            --CE aferent orelor ramane 0, deci daca TC de la minute = 1, orele se incrementeaza
        end if;
        --daca HM = '0', setam orele
        if(HM = '0' AND INC = '1') then
        --facem CE de la ore 1, deoarece avem poarta SAU care are ca intrare CE_H si TC de la minute
        --TC minute in modul de ajustare e 0
            CE_H <= '1';--activam CE aferent orelor pentru un impuls INC
        end if;
end if;
--numaratorul numara pana la limita 295959
--punem conditia sa se opreasca la 235959
if(Q_in = X"235959") then
--dezactivam toate semnalele de reset si UnD
    RESETn_HM <= '0';
    RESETn_S <= '0';
    UnD_S <= '0';
    UnD_HM <= '0';
else
--in rest semnalele aferente orelor si minutelor sunt active
    RESETn_HM <= '1';
    UnD_HM <= '1';
end if;
    Q <= Q_in;

end process;
end Behavioral;
