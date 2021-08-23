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

-- IP VLNV: xilinx.com:module_ref:BTNMonitor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SixDigitCounter_BTNMonitor_0_2 IS
  PORT (
    CLK : IN STD_LOGIC;
    RESETn : IN STD_LOGIC;
    BTN : IN STD_LOGIC;
    CE_Dbg : OUT STD_LOGIC;
    StC_Dbg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    StN_Dbg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    BTN_Click : OUT STD_LOGIC;
    BTN_LongPress : OUT STD_LOGIC;
    BTN_LPRelease : OUT STD_LOGIC
  );
END SixDigitCounter_BTNMonitor_0_2;

ARCHITECTURE SixDigitCounter_BTNMonitor_0_2_arch OF SixDigitCounter_BTNMonitor_0_2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SixDigitCounter_BTNMonitor_0_2_arch: ARCHITECTURE IS "yes";
  COMPONENT BTNMonitor IS
    GENERIC (
      SAMPLE_DIV_RATE : INTEGER;
      StableTimeSamples : INTEGER;
      LPTimeSamples : INTEGER
    );
    PORT (
      CLK : IN STD_LOGIC;
      RESETn : IN STD_LOGIC;
      BTN : IN STD_LOGIC;
      CE_Dbg : OUT STD_LOGIC;
      StC_Dbg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      StN_Dbg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      BTN_Click : OUT STD_LOGIC;
      BTN_LongPress : OUT STD_LOGIC;
      BTN_LPRelease : OUT STD_LOGIC
    );
  END COMPONENT BTNMonitor;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF SixDigitCounter_BTNMonitor_0_2_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF RESETn: SIGNAL IS "XIL_INTERFACENAME RESETn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF RESETn: SIGNAL IS "xilinx.com:signal:reset:1.0 RESETn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CLK: SIGNAL IS "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RESETn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN SixDigitCounter_CLK, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK CLK";
BEGIN
  U0 : BTNMonitor
    GENERIC MAP (
      SAMPLE_DIV_RATE => 5,
      StableTimeSamples => 3,
      LPTimeSamples => 100
    )
    PORT MAP (
      CLK => CLK,
      RESETn => RESETn,
      BTN => BTN,
      CE_Dbg => CE_Dbg,
      StC_Dbg => StC_Dbg,
      StN_Dbg => StN_Dbg,
      BTN_Click => BTN_Click,
      BTN_LongPress => BTN_LongPress,
      BTN_LPRelease => BTN_LPRelease
    );
END SixDigitCounter_BTNMonitor_0_2_arch;
