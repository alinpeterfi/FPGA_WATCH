----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2021 04:31:19 PM
-- Design Name: 
-- Module Name: Sim_SixDigitCounter - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sim_SixDigitCounter is
--  Port ( );
end Sim_SixDigitCounter;

architecture Behavioral of Sim_SixDigitCounter is
subtype StrFixLength is string (1 to 20);

function ToFixLength (StringIn : string) return StrFixLength is
variable V : StrFixLength := (others => ' ');
begin
if StringIn'length > StrFixLength'length then
return StringIn(1 to StrFixLength'length);
else 
V(1 to StringIn'length) :=StringIn;
return V;
end if;
end ToFixLength;

component SixDigitCounter_wrapper is
  Port (
    ADJ : out STD_LOGIC;
    CE : in STD_LOGIC;
    CE_Dbg : out STD_LOGIC;
    CLK : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 23 downto 0 );
    HS : out STD_LOGIC;
    INC : out STD_LOGIC;
    Load : in STD_LOGIC;
    MODE : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 23 downto 0 );
    RESETn : in STD_LOGIC;
    SET : in STD_LOGIC;
    TC : out STD_LOGIC_VECTOR ( 0 to 0 );
    UnD : in STD_LOGIC

  );
 end component SixDigitCounter_wrapper;
 
signal    CLK                 : STD_LOGIC                          := '0'   ;
signal    RESETn              : STD_LOGIC                          := '0'   ;
signal    Load                : STD_LOGIC                          := '0'   ;
signal    UnD                 : STD_LOGIC                          := '1'   ;
signal    DIN                 : STD_LOGIC_VECTOR ( 23 downto 0 )            ;
signal    TC                  : STD_LOGIC_VECTOR ( 0 to 0 )                 ;
signal    Q                  : STD_LOGIC_VECTOR ( 23 downto 0 )        ;
signal   CE :  STD_LOGIC := '0';
signal    INC : STD_LOGIC;
signal     HS :  STD_LOGIC;
signal     ADJ :  STD_LOGIC;
signal    MODE :  STD_LOGIC;
signal    SET :  STD_LOGIC;
signal CE_Dbg : STD_LOGIC;

  
 

  

constant CLK_PERIOD : time := 10 ns;
signal MSG: StrFixLength := ToFixLength("RESET");

signal NumClksSinceReset : integer := 0;


begin

UUT: SixDigitCounter_wrapper

Port Map(
    CLK             =>      CLK     ,
    RESETn          =>      RESETn  ,
    Load            =>      Load    ,
    UnD             =>      UnD     ,
    DIN             =>      DIN     ,
    TC              =>      TC      ,
    Q              =>      Q      ,
INC => INC,
HS => HS,
ADJ => ADJ,
CE => CE,
    MODE =>  MODE,
   SET => SET,
  CE_Dbg => CE_Dbg

);


CLK <= NOT CLK after  CLK_PERIOD/2;

 Cnt_Clk_Periods: process (CLK, RESETn, NumClksSinceReset)
 begin
	if RESETn = '0' then
	NumClksSinceReset <= 0;
	elsif rising_edge(CLK) then
	NumClksSinceReset <= NumClksSinceReset + 1;
	end if;
end process Cnt_Clk_Periods;
 --Proces principal
 
 TestBench: process
 variable i: integer :=0;
 begin
 
     --asteptam 3 perioade si ridicam RESETn
	for i in 0 to 2 loop
	wait until rising_edge(CLK);
	end loop;
 RESETn <= '1' after 3 ns;
 CE <= '1' after 3 ns;
 --facem semnalele HS=0, ADJ=1, INC=0
MSG <= ToFixLength("Init btn signals");
 -- Longpress pe buton: Lungime de minim 100 CE
  --  MSG <= ToFixLength("Btn LongPress");






	
--       -- Longpress pe buton: Lungime de minim 100 CE
--    MSG <= ToFixLength("Btn LongPress");
--    MODE <= '1' after 3 ns;
--    for i in 0 to 110 loop
--		wait until rising_edge(CE_Dbg);
--	end loop;
--	MODE <= '0' after 3 ns;
--    for i in 0 to 3 loop
--		wait until rising_edge(CE_Dbg);
--	end loop;


MSG <= ToFixLength("End of init");
 	wait until rising_edge(CLK);
MSG <= ToFixLength("Test Count up");
	
for i in 0 to 200 loop
	wait until rising_edge(CLK);
	end loop;
MSG <= ToFixLength("Test set mode");
   
	 -- Longpress pe buton: Lungime de minim 100 CE
    --MSG <= ToFixLength("Btn LongPress");
    MODE <= '1' after 3 ns;
    for i in 0 to 110 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	MODE <= '0' after 3 ns;
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;

       	
     -- Click pe buton: Lungime de minim 3 CE
	--MSG <= ToFixLength("Btn Click");
    SET <= '1' after 3 ns;
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	SET <= '0' after 3 ns;
    --Asteptam minim Timeout!
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;


	 -- Click pe buton: Lungime de minim 3 CE
	--MSG <= ToFixLength("Btn Click");
    MODE <= '1' after 3 ns;
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	MODE <= '0' after 3 ns;
    --Asteptam minim Timeout!
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	
       	
     -- Click pe buton: Lungime de minim 3 CE
	--MSG <= ToFixLength("Btn Click");
    SET <= '1' after 3 ns;
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	SET <= '0' after 3 ns;
    --Asteptam minim Timeout!
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	
	 -- Longpress pe buton: Lungime de minim 100 CE
    --MSG <= ToFixLength("Btn LongPress");
    MODE <= '1' after 3 ns;
    for i in 0 to 110 loop
		wait until rising_edge(CE_Dbg);
	end loop;
	MODE <= '0' after 3 ns;
    for i in 0 to 3 loop
		wait until rising_edge(CE_Dbg);
	end loop;

   wait;

end process TestBench;
end Behavioral;
