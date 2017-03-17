library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitMultiplexer is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end FourBitMultiplexer;
architecture Behavioral of FourBitMultiplexer is
begin
	output<=(((not s(0))and(not s(1))and input(0))or
				(s(0)and(not s(1))and input(1))or
				((not s(0))and s(1) and input(2))or
				(s(0) and s(1) and input(3)));
end Behavioral;