library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SumUnit is
    Port ( C : in  STD_LOGIC_VECTOR (2 downto 0);
           P : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end SumUnit;
architecture Behavioral of SumUnit is
begin
	S(0)<=P(0) xor Cin ;
	S(1)<=P(1) xor C(0);
	S(2)<=P(2) xor C(1);
	S(3)<=P(3) xor C(2);
end Behavioral;

