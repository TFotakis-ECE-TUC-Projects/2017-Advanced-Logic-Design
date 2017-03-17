library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity andGate is
    Port ( inputA : in  STD_LOGIC;
	       inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
end andGate;
architecture Behavioral of andGate is
begin
	output<=inputA and inputB;
end Behavioral;