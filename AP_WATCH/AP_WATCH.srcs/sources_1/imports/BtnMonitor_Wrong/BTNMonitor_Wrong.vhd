library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;

use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;


entity BTNMonitor is
generic(
      SAMPLE_DIV_RATE        : integer := 5          ;
      StableTimeSamples      : integer := 3          ;
      LPTimeSamples          : integer := 100        
       
   );
port(
    CLK           : in  std_logic                    ; 
    RESETn        : in  std_logic                    ; 
    BTN           : in  std_logic                    ;
-- Debug Signals    
    CE_Dbg        : out std_logic                    ;  
    StC_Dbg       : out std_logic_vector(6 downto 0) ;
    StN_Dbg       : out std_logic_vector(6 downto 0) ;
-- End of Debug Signals
    BTN_Click     : out std_logic                    ; 
    BTN_LongPress : out std_logic                    ; 
    BTN_LPRelease : out std_logic
    );
end entity BTNMonitor;

architecture behavioral of BTNMonitor is
--to divide CE
signal CE_Cnt: integer   :=0;
signal CE_DIV: std_logic :='0';
    
--***********************************************************************

--Definitii

--***********************************************************************/
    
--                                                     Definirea starilor - din documentatie
--                                                       (6:4)    3      2     1     0
--                                                       State  DblClk  Click  LP  LP_rel          
constant stIdle        : std_logic_vector(6 downto 0):= ("000" & '0' &  '0' & '0' & '0'  ); -- In total 7 biti   
constant stPressed     : std_logic_vector(6 downto 0):= ("001" & '0' &  '0' & '0' & '0'  ); -- Aceeasi latime 
constant stStable      : std_logic_vector(6 downto 0):= ("010" & '0' &  '0' & '0' & '0'  );
constant stLongPress   : std_logic_vector(6 downto 0):= ("100" & '0' &  '0' & '1' & '0'  );
constant stLPReleased  : std_logic_vector(6 downto 0):= ("101" & '0' &  '0' & '0' & '1'  );
constant stClick       : std_logic_vector(6 downto 0):= ("110" & '0' &  '1' & '0' & '0'  );

signal StC: std_logic_vector(6 downto 0) := StIdle;
signal StN: std_logic_vector(6 downto 0) := StIdle;


--Definirea semnalelor pentru numaratoare 
--Pentru a verifica, daca BTN e stabil, dupa ce a fost apasat
signal CntBtnTime : integer := 0;
signal CntDblClickTimeout : integer := 0;

--Semnalele pentru iesiri
signal LP_Intern        : std_logic :='0';
signal Click_Intern     : std_logic :='0';

signal LP_Rel_Intern    : std_logic :='0';

signal LP_Rel : std_logic;

--Registri pentru iesirile One-Shot
signal ClickOneShotReg    : std_logic_vector (1 downto 0):="00";

signal LP_RelOneShotReg   : std_logic_vector (1 downto 0):="00";


begin

--Atribuirea iesirilor automatului secvential
LP_Rel_Intern   <= StC(0);
LP_Intern       <= StC(1);
Click_Intern    <= StC(2);


--One-Shot pentru Click, DoubleClick si LpRel
OneShot: process (CLK, ClickOneShotReg, Click_Intern, LP_RelOneShotReg, LP_Rel_Intern)
begin
    if rising_edge(CLK) then
        ClickOneShotReg (1 downto 0)    <= ClickOneShotReg(0) & Click_Intern;
        LP_RelOneShotReg (1 downto 0)   <= LP_RelOneShotReg(0) & LP_Rel_Intern;
    end if;
end process OneShot;

--***********************************************************************
--Atribuire Iesiri
--***********************************************************************/
BTN_LongPress <= LP_Intern;
BTN_Click     <= ClickOneShotReg(0) AND (NOT ClickOneShotReg(1));
BTN_LPRelease <= LP_RelOneShotReg(0) AND (NOT LP_RelOneShotReg(1));

StC_Dbg <= StC;
StN_Dbg <= StN;
CE_DBG <= CE_Div;

--Inregistrarea starii curente a automatului secvential
REGISTER_STC: process (CLK, RESETn, StN)
begin
    if rising_edge(CLK) then
        if RESETn = '0' then StC <= stIdle;
        else StC <= StN;
        end if;
    end if;
end process REGISTER_STC;

--Procesul de tranzitii - Combinational!
STC_TRANSITIONS: process (StC, BTN, CntBtnTime)
begin
StN <= StC; --Implicit: Ramai in starea curenta
case StC is 
    when  stIdle        => if BTN ='1' then StN <= stPressed; end if; 
    when  stPressed     => if BTN = '1' and CntBtnTime = StableTimeSamples 
                           then  StN <= StStable;
                           elsif BTN = '0' then StN <= stIdle; end if;
    when  stStable      =>  if BTN = '1' and CntBtnTime = LPTimeSamples 
                           then  StN <= StLongPress;
                           elsif BTN = '0' then StN <= stClick; end if;                  
    when  stLongPress   => if BTN = '0' then StN <= stLPReleased; end if;
    when  stLPReleased  => StN <= StIdle;
    when  stClick       => StN <= stIdle;
    when others         => StN <= stIdle;
end case;
end process STC_TRANSITIONS;

--Divizorul pentru CE
Div_Ce: process (CLK, RESETn, CE_Cnt)
begin
    if rising_edge(CLK) then
        if RESETn = '0' or Ce_Cnt = (SAMPLE_DIV_RATE-1) 
            then CE_Cnt <= 0;
        else
            Ce_Cnt <= Ce_Cnt +1;
        end if;
    end if;
end process Div_Ce;

CE_DIV <= '1' when Ce_Cnt = (SAMPLE_DIV_RATE-1) else '0';

--Numaratoare
--Stable

BtnTime: process (CLK, RESETn, CntBtnTime)
begin
    if rising_edge(CLK) then
        if RESETn = '0' or StC = stIdle
            then CntBtnTime <= 0;
        elsif CE_Div = '1' then
            CntBtnTime <= CntBtnTime +1;
        end if;
    end if;
end process BtnTime;


end behavioral;
