----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2020 12:31:34 PM
-- Design Name: 
-- Module Name: Cnt4Bits - Behavioral
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


entity CntNbits_L is
	generic(
		NUMBITS 		: integer range 0 to 31	:= 4;
		LIMIT   		: integer range 0 to 15 := 9
	);
    Port ( 
			CLK 		: in 	STD_LOGIC			                  ;
			RESETn 		: in 	STD_LOGIC			                  ;	
			Load		: in 	STD_LOGIC			                  ;
			UnD			: in 	STD_LOGIC			                  ;
			CE			: in 	STD_LOGIC			                  ;
			Din			: in 	STD_LOGIC_VECTOR (NUMBITS-1 downto 0) ;
			Q			: out	STD_LOGIC_VECTOR (NUMBITS-1 downto 0) ;
			TC			: out	STD_LOGIC					  
			);
end CntNbits_L;

architecture Behavioral of CntNbits_L is
signal	Q_Intern : STD_LOGIC_VECTOR (NUMBITS-1 downto 0) := X"0";

constant LIMIT_VEC : STD_LOGIC_VECTOR (NUMBITS-1 downto 0) := conv_std_logic_vector(LIMIT, NUMBITS);
constant ZERO_VEC : STD_LOGIC_VECTOR (NUMBITS-1 downto 0) := conv_std_logic_vector(0, NUMBITS);

begin

Q <= Q_Intern;

Count: process (CLK, RESETn, Load, UnD, CE, Q_Intern, Din)
begin
	if rising_edge(CLK) then
		if RESETn = '0' then
			Q_Intern<= (others => '0');
		elsif Load = '1' then
			if Din > LIMIT_VEC then
				Q_Intern <= LIMIT_VEC;
			else
				Q_Intern <= Din;
			end if;
		elsif CE = '1'   then
			if UnD = '1' then
				if Q_Intern = LIMIT_VEC then
					Q_Intern <= (others => '0');
			    else
					Q_Intern <= Q_Intern + X"1";
				end if;
			else
				if Q_Intern = ZERO_VEC then
					Q_Intern <= LIMIT_VEC;
			    else
					Q_Intern <= Q_Intern - X"1";
				end if;
			end if;
		end if;
	end if;
end process Count;

TC <= '1' when (UnD = '1' AND Q_Intern = LIMIT_VEC)
			OR (UnD = '0' AND Q_Intern = ZERO_VEC)
			else '0';

end Behavioral;
