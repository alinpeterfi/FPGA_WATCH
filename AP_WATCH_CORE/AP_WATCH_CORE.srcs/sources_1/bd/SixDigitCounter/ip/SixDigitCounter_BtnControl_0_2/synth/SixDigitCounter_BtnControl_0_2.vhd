-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:BtnControl:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SixDigitCounter_BtnControl_0_2 IS
  PORT (
    MODE_Click : IN STD_LOGIC;
    MODE_LP : IN STD_LOGIC;
    SET_Click : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    Q_in : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    CE_S : OUT STD_LOGIC;
    CE_M : OUT STD_LOGIC;
    CE_H : OUT STD_LOGIC;
    UnD_S : OUT STD_LOGIC;
    UnD_HM : OUT STD_LOGIC;
    RESETn_S : OUT STD_LOGIC;
    RESETn_HM : OUT STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END SixDigitCounter_BtnControl_0_2;

ARCHITECTURE SixDigitCounter_BtnControl_0_2_arch OF SixDigitCounter_BtnControl_0_2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SixDigitCounter_BtnControl_0_2_arch: ARCHITECTURE IS "yes";
  COMPONENT BtnControl IS
    PORT (
      MODE_Click : IN STD_LOGIC;
      MODE_LP : IN STD_LOGIC;
      SET_Click : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      Q_in : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      CE_S : OUT STD_LOGIC;
      CE_M : OUT STD_LOGIC;
      CE_H : OUT STD_LOGIC;
      UnD_S : OUT STD_LOGIC;
      UnD_HM : OUT STD_LOGIC;
      RESETn_S : OUT STD_LOGIC;
      RESETn_HM : OUT STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
    );
  END COMPONENT BtnControl;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF SixDigitCounter_BtnControl_0_2_arch: ARCHITECTURE IS "BtnControl,Vivado 2020.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF SixDigitCounter_BtnControl_0_2_arch : ARCHITECTURE IS "SixDigitCounter_BtnControl_0_2,BtnControl,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF SixDigitCounter_BtnControl_0_2_arch: ARCHITECTURE IS "SixDigitCounter_BtnControl_0_2,BtnControl,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=BtnControl,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF SixDigitCounter_BtnControl_0_2_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF CLK: SIGNAL IS "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN SixDigitCounter_CLK, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK CLK";
BEGIN
  U0 : BtnControl
    PORT MAP (
      MODE_Click => MODE_Click,
      MODE_LP => MODE_LP,
      SET_Click => SET_Click,
      CLK => CLK,
      Q_in => Q_in,
      CE_S => CE_S,
      CE_M => CE_M,
      CE_H => CE_H,
      UnD_S => UnD_S,
      UnD_HM => UnD_HM,
      RESETn_S => RESETn_S,
      RESETn_HM => RESETn_HM,
      Q => Q
    );
END SixDigitCounter_BtnControl_0_2_arch;
