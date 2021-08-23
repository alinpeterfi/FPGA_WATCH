----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2020 11:14:14 AM
-- Design Name: 
-- Module Name: DataExpand12To4 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;

use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity DataExpand3out is
    generic(
		IN_WIDTH : integer := 24;
		WIDTH5	 : integer := 4;
		WIDTH4	 : integer := 4;
		WIDTH3	 : integer := 4;
		WIDTH2	 : integer := 4;
		WIDTH1	 : integer := 4;
		WIDTH0	 : integer := 4
		);
			
    Port ( DIN    : in STD_LOGIC_Vector(IN_WIDTH - 1 downto 0);
           Dout5  : out std_logic_vector (WIDTH5 - 1 downto 0);
           Dout4  : out std_logic_vector (WIDTH4 - 1 downto 0);
           Dout3  : out std_logic_vector (WIDTH3 - 1 downto 0);
           Dout2  : out std_logic_vector (WIDTH2 - 1 downto 0);
           Dout1  : out std_logic_vector (WIDTH1 - 1 downto 0);
           Dout0  : out std_logic_vector (IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 - WIDTH2 - WIDTH1 -1  downto 0) 
    );
end DataExpand3out;

architecture Behavioral of DataExpand3out is

begin

Dout5 <=  DIN(IN_WIDTH - 1 downto IN_WIDTH - WIDTH5);
Dout4 <= DIN(IN_WIDTH - WIDTH5 -1 downto IN_WIDTH - WIDTH5 - WIDTH4);
Dout3 <= DIN(IN_WIDTH - WIDTH5 - WIDTH4 -1 downto IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3);
Dout2 <= DIN(IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 -1 downto IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 - WIDTH2);
Dout1 <= DIN(IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 - WIDTH2 -1 downto IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 - WIDTH2 - WIDTH1);
Dout0 <= DIN(IN_WIDTH - WIDTH5 - WIDTH4 - WIDTH3 - WIDTH2 - WIDTH1 -1 downto 0);

end Behavioral;
