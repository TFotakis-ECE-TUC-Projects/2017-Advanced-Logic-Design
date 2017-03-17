library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TwoBitMultiplexer is
	Port (input : in  STD_LOGIC_VECTOR (1 downto 0);
			output : out  STD_LOGIC;
			s : in  STD_LOGIC);
	end TwoBitMultiplexer;
architecture Behavioral of TwoBitMultiplexer is
begin
	output<=((not s) and input(0))or(s and input(1));
end Behavioral;