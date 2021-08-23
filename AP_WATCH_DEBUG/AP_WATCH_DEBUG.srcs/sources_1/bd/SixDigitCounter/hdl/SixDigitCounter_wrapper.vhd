--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Sat Feb  6 16:50:12 2021
--Host        : Alin-PC running 64-bit major release  (build 9200)
--Command     : generate_target SixDigitCounter_wrapper.bd
--Design      : SixDigitCounter_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SixDigitCounter_wrapper is
  port (
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
end SixDigitCounter_wrapper;

architecture STRUCTURE of SixDigitCounter_wrapper is
  component SixDigitCounter is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    UnD : in STD_LOGIC;
    TC : out STD_LOGIC_VECTOR ( 0 to 0 );
    MODE : in STD_LOGIC;
    SET : in STD_LOGIC;
    CE_Dbg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 23 downto 0 );
    CE : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 23 downto 0 );
    ADJ : out STD_LOGIC;
    HS : out STD_LOGIC;
    INC : out STD_LOGIC;
    Load : in STD_LOGIC
  );
  end component SixDigitCounter;
begin
SixDigitCounter_i: component SixDigitCounter
     port map (
      ADJ => ADJ,
      CE => CE,
      CE_Dbg => CE_Dbg,
      CLK => CLK,
      DIN(23 downto 0) => DIN(23 downto 0),
      HS => HS,
      INC => INC,
      Load => Load,
      MODE => MODE,
      Q(23 downto 0) => Q(23 downto 0),
      RESETn => RESETn,
      SET => SET,
      TC(0) => TC(0),
      UnD => UnD
    );
end STRUCTURE;
