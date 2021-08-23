--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Sat Feb  6 16:49:45 2021
--Host        : Alin-PC running 64-bit major release  (build 9200)
--Command     : generate_target SixDigitCounter.bd
--Design      : SixDigitCounter
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SixDigitCounter is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SixDigitCounter : entity is "SixDigitCounter,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SixDigitCounter,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=16,numReposBlks=16,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=11,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SixDigitCounter : entity is "SixDigitCounter.hwdef";
end SixDigitCounter;

architecture STRUCTURE of SixDigitCounter is
  component SixDigitCounter_DataExpand3out_0_1 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 23 downto 0 );
    Dout5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component SixDigitCounter_DataExpand3out_0_1;
  component SixDigitCounter_util_vector_logic_0_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SixDigitCounter_util_vector_logic_0_2;
  component SixDigitCounter_util_vector_logic_1_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SixDigitCounter_util_vector_logic_1_0;
  component SixDigitCounter_util_vector_logic_2_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SixDigitCounter_util_vector_logic_2_0;
  component SixDigitCounter_util_vector_logic_3_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SixDigitCounter_util_vector_logic_3_0;
  component SixDigitCounter_util_vector_logic_4_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SixDigitCounter_util_vector_logic_4_0;
  component SixDigitCounter_DataConcat3in_0_1 is
  port (
    Din0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Din1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Din2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Din3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Din4 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Din5 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  end component SixDigitCounter_DataConcat3in_0_1;
  component SixDigitCounter_CntNbits_L_0_0 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_CntNbits_L_0_0;
  component SixDigitCounter_CntNbits_L_0_1 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_CntNbits_L_0_1;
  component SixDigitCounter_Digit1_0 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_Digit1_0;
  component SixDigitCounter_Digit2_0 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_Digit2_0;
  component SixDigitCounter_Digit3_0 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_Digit3_0;
  component SixDigitCounter_Digit4_0 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    Load : in STD_LOGIC;
    UnD : in STD_LOGIC;
    CE : in STD_LOGIC;
    Din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TC : out STD_LOGIC
  );
  end component SixDigitCounter_Digit4_0;
  component SixDigitCounter_BTNMonitor_0_2 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    BTN : in STD_LOGIC;
    CE_Dbg : out STD_LOGIC;
    StC_Dbg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    StN_Dbg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    BTN_Click : out STD_LOGIC;
    BTN_LongPress : out STD_LOGIC;
    BTN_LPRelease : out STD_LOGIC
  );
  end component SixDigitCounter_BTNMonitor_0_2;
  component SixDigitCounter_BTNMonitor_0_3 is
  port (
    CLK : in STD_LOGIC;
    RESETn : in STD_LOGIC;
    BTN : in STD_LOGIC;
    CE_Dbg : out STD_LOGIC;
    StC_Dbg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    StN_Dbg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    BTN_Click : out STD_LOGIC;
    BTN_LongPress : out STD_LOGIC;
    BTN_LPRelease : out STD_LOGIC
  );
  end component SixDigitCounter_BTNMonitor_0_3;
  component SixDigitCounter_BtnControl_0_2 is
  port (
    MODE_Click : in STD_LOGIC;
    MODE_LP : in STD_LOGIC;
    SET_Click : in STD_LOGIC;
    CLK : in STD_LOGIC;
    ADJ : out STD_LOGIC;
    HS : out STD_LOGIC;
    INC : out STD_LOGIC
  );
  end component SixDigitCounter_BtnControl_0_2;
  signal BTNMonitor_0_BTN_Click : STD_LOGIC;
  signal BTNMonitor_0_BTN_LongPress : STD_LOGIC;
  signal BTNMonitor_0_CE_Dbg : STD_LOGIC;
  signal BTNMonitor_1_BTN_Click : STD_LOGIC;
  signal BtnControl_0_ADJ : STD_LOGIC;
  signal BtnControl_0_HS : STD_LOGIC;
  signal BtnControl_0_INC : STD_LOGIC;
  signal CE_1 : STD_LOGIC;
  signal CLK_1 : STD_LOGIC;
  signal DIN_1 : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal DataConcat3in_0_Dout : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal DataExpand3out_0_Dout0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DataExpand3out_0_Dout1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DataExpand3out_0_Dout2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DataExpand3out_0_Dout3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DataExpand3out_0_Dout4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DataExpand3out_0_Dout5 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit0_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit1_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit1_TC : STD_LOGIC;
  signal Digit2_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit2_TC : STD_LOGIC;
  signal Digit3_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit3_TC : STD_LOGIC;
  signal Digit4_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit4_TC : STD_LOGIC;
  signal Digit5_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Digit5_TC : STD_LOGIC;
  signal Load_1 : STD_LOGIC;
  signal MODE_1 : STD_LOGIC;
  signal RESETn_1 : STD_LOGIC;
  signal SET_1 : STD_LOGIC;
  signal UnD_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC;
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_3_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_4_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_5_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_BTNMonitor_0_BTN_LPRelease_UNCONNECTED : STD_LOGIC;
  signal NLW_BTNMonitor_0_StC_Dbg_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_BTNMonitor_0_StN_Dbg_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_BTNMonitor_1_BTN_LPRelease_UNCONNECTED : STD_LOGIC;
  signal NLW_BTNMonitor_1_BTN_LongPress_UNCONNECTED : STD_LOGIC;
  signal NLW_BTNMonitor_1_CE_Dbg_UNCONNECTED : STD_LOGIC;
  signal NLW_BTNMonitor_1_StC_Dbg_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_BTNMonitor_1_StN_Dbg_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET RESETn, CLK_DOMAIN SixDigitCounter_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of RESETn : signal is "xilinx.com:signal:reset:1.0 RST.RESETN RST";
  attribute X_INTERFACE_PARAMETER of RESETn : signal is "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  ADJ <= BtnControl_0_ADJ;
  CE_1 <= CE;
  CE_Dbg <= BTNMonitor_0_CE_Dbg;
  CLK_1 <= CLK;
  DIN_1(23 downto 0) <= DIN(23 downto 0);
  HS <= BtnControl_0_HS;
  INC <= BtnControl_0_INC;
  Load_1 <= Load;
  MODE_1 <= MODE;
  Q(23 downto 0) <= DataConcat3in_0_Dout(23 downto 0);
  RESETn_1 <= RESETn;
  SET_1 <= SET;
  TC(0) <= util_vector_logic_5_Res(0);
  UnD_1 <= UnD;
BTNMonitor_0: component SixDigitCounter_BTNMonitor_0_2
     port map (
      BTN => MODE_1,
      BTN_Click => BTNMonitor_0_BTN_Click,
      BTN_LPRelease => NLW_BTNMonitor_0_BTN_LPRelease_UNCONNECTED,
      BTN_LongPress => BTNMonitor_0_BTN_LongPress,
      CE_Dbg => BTNMonitor_0_CE_Dbg,
      CLK => CLK_1,
      RESETn => RESETn_1,
      StC_Dbg(6 downto 0) => NLW_BTNMonitor_0_StC_Dbg_UNCONNECTED(6 downto 0),
      StN_Dbg(6 downto 0) => NLW_BTNMonitor_0_StN_Dbg_UNCONNECTED(6 downto 0)
    );
BTNMonitor_1: component SixDigitCounter_BTNMonitor_0_3
     port map (
      BTN => SET_1,
      BTN_Click => BTNMonitor_1_BTN_Click,
      BTN_LPRelease => NLW_BTNMonitor_1_BTN_LPRelease_UNCONNECTED,
      BTN_LongPress => NLW_BTNMonitor_1_BTN_LongPress_UNCONNECTED,
      CE_Dbg => NLW_BTNMonitor_1_CE_Dbg_UNCONNECTED,
      CLK => CLK_1,
      RESETn => RESETn_1,
      StC_Dbg(6 downto 0) => NLW_BTNMonitor_1_StC_Dbg_UNCONNECTED(6 downto 0),
      StN_Dbg(6 downto 0) => NLW_BTNMonitor_1_StN_Dbg_UNCONNECTED(6 downto 0)
    );
BtnControl_0: component SixDigitCounter_BtnControl_0_2
     port map (
      ADJ => BtnControl_0_ADJ,
      CLK => CLK_1,
      HS => BtnControl_0_HS,
      INC => BtnControl_0_INC,
      MODE_Click => BTNMonitor_0_BTN_Click,
      MODE_LP => BTNMonitor_0_BTN_LongPress,
      SET_Click => BTNMonitor_1_BTN_Click
    );
DataConcat3in_0: component SixDigitCounter_DataConcat3in_0_1
     port map (
      Din0(3 downto 0) => Digit0_Q(3 downto 0),
      Din1(3 downto 0) => Digit1_Q(3 downto 0),
      Din2(3 downto 0) => Digit2_Q(3 downto 0),
      Din3(3 downto 0) => Digit3_Q(3 downto 0),
      Din4(3 downto 0) => Digit4_Q(3 downto 0),
      Din5(3 downto 0) => Digit5_Q(3 downto 0),
      Dout(23 downto 0) => DataConcat3in_0_Dout(23 downto 0)
    );
DataExpand3out_0: component SixDigitCounter_DataExpand3out_0_1
     port map (
      DIN(23 downto 0) => DIN_1(23 downto 0),
      Dout0(3 downto 0) => DataExpand3out_0_Dout0(3 downto 0),
      Dout1(3 downto 0) => DataExpand3out_0_Dout1(3 downto 0),
      Dout2(3 downto 0) => DataExpand3out_0_Dout2(3 downto 0),
      Dout3(3 downto 0) => DataExpand3out_0_Dout3(3 downto 0),
      Dout4(3 downto 0) => DataExpand3out_0_Dout4(3 downto 0),
      Dout5(3 downto 0) => DataExpand3out_0_Dout5(3 downto 0)
    );
Digit0: component SixDigitCounter_CntNbits_L_0_0
     port map (
      CE => CE_1,
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout0(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit0_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => util_vector_logic_0_Res,
      UnD => UnD_1
    );
Digit1: component SixDigitCounter_CntNbits_L_0_1
     port map (
      CE => util_vector_logic_0_Res,
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout1(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit1_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => Digit1_TC,
      UnD => UnD_1
    );
Digit2: component SixDigitCounter_Digit1_0
     port map (
      CE => util_vector_logic_1_Res(0),
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout2(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit2_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => Digit2_TC,
      UnD => UnD_1
    );
Digit3: component SixDigitCounter_Digit2_0
     port map (
      CE => util_vector_logic_2_Res(0),
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout3(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit3_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => Digit3_TC,
      UnD => UnD_1
    );
Digit4: component SixDigitCounter_Digit3_0
     port map (
      CE => util_vector_logic_3_Res(0),
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout4(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit4_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => Digit4_TC,
      UnD => UnD_1
    );
Digit5: component SixDigitCounter_Digit4_0
     port map (
      CE => util_vector_logic_4_Res(0),
      CLK => CLK_1,
      Din(3 downto 0) => DataExpand3out_0_Dout5(3 downto 0),
      Load => Load_1,
      Q(3 downto 0) => Digit5_Q(3 downto 0),
      RESETn => RESETn_1,
      TC => Digit5_TC,
      UnD => UnD_1
    );
util_vector_logic_1: component SixDigitCounter_util_vector_logic_0_2
     port map (
      Op1(0) => Digit1_TC,
      Op2(0) => util_vector_logic_0_Res,
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component SixDigitCounter_util_vector_logic_1_0
     port map (
      Op1(0) => Digit2_TC,
      Op2(0) => util_vector_logic_1_Res(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
util_vector_logic_3: component SixDigitCounter_util_vector_logic_2_0
     port map (
      Op1(0) => Digit3_TC,
      Op2(0) => util_vector_logic_2_Res(0),
      Res(0) => util_vector_logic_3_Res(0)
    );
util_vector_logic_4: component SixDigitCounter_util_vector_logic_3_0
     port map (
      Op1(0) => Digit4_TC,
      Op2(0) => util_vector_logic_3_Res(0),
      Res(0) => util_vector_logic_4_Res(0)
    );
util_vector_logic_5: component SixDigitCounter_util_vector_logic_4_0
     port map (
      Op1(0) => Digit5_TC,
      Op2(0) => util_vector_logic_4_Res(0),
      Res(0) => util_vector_logic_5_Res(0)
    );
end STRUCTURE;
