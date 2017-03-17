library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity norGate is
    Port ( inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
end norGate;
architecture Behavioral of norGate is
begin
 output<=inputA nor inputB;
end Behavioral;