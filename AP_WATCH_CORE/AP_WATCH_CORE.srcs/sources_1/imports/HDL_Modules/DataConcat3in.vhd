----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2020 11:18:02 AM
-- Design Name: 
-- Module Name: DataConcat4To12 - Behavioral
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

entity DataConcat3in is
    generic(
		WIDTH0	: integer := 4;
		WIDTH1	: integer := 4;
		WIDTH2	: integer := 4;
		WIDTH3	: integer := 4;
		WIDTH4	: integer := 4;
		WIDTH5	: integer := 4
	);
	Port ( Din0 : in  STD_LOGIC_VECTOR (WIDTH0 -1 downto 0);
           Din1 : in  STD_LOGIC_VECTOR (WIDTH1 -1  downto 0);
           Din2 : in  STD_LOGIC_VECTOR (WIDTH2 -1 downto 0);
           Din3 : in  STD_LOGIC_VECTOR (WIDTH3 -1 downto 0);
           Din4 : in  STD_LOGIC_VECTOR (WIDTH4 -1 downto 0);
           Din5 : in  STD_LOGIC_VECTOR (WIDTH5 -1 downto 0);
 
           Dout   : out STD_LOGIC_VECTOR (WIDTH5 + WIDTH4 + WIDTH3 + WIDTH2 + WIDTH1 + WIDTH0 -1 downto 0)
    );
end DataConcat3in;

architecture Behavioral of DataConcat3in is

begin
Dout <= Din5 & Din4 & Din3 & Din2 & Din1 & Din0;

end Behavioral;
