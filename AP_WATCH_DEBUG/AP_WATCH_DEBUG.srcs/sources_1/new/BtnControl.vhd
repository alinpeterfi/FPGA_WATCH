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
    MODE_Click : in  std_logic                      ;
    MODE_LP : in  std_logic                         ;
    SET_Click : in  std_logic                    ;
    CLK : in std_logic;
    ADJ : out std_logic := '1';
    HS : out std_logic := '0';
    INC : out std_logic := '0'
     
    );
end BtnControl;

architecture Behavioral of BtnControl is
--semnale de stocare pt comparatie

 signal MODE_LP1 : std_logic;
 signal MODE_Click1 : std_logic;
 signal test : std_logic :='0';
 signal test1 : std_logic :='0';

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
  HS <= test1;       
    end if;
end if;
end process;

--LATCH- mentinere semnal pana la urmatoarea aapasare lunga a MODE
process(CLK, MODE_LP1, MODE_LP, test)
begin
 if rising_edge(CLK) then
   MODE_LP1 <=  MODE_LP;
end if ;
end process;


process(CLK, MODE_LP1, MODE_LP, test)
begin
  if rising_edge(CLK) then

    if MODE_LP1 = '0' and MODE_LP= '1' then  --- Rise edge
         test <= not test;
  ADJ <= test;    
    end if;
end if;


--daca butonul de set e apasat, semnalul inc e 1
 if(SET_Click ='1') then
 INC <= '1';
 else 
 INC <= '0';
 end if;


end process;
end Behavioral;
