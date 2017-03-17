library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity orGate is
    Port ( inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
end orGate;
architecture Behavioral of orGate is
begin
 output<=inputA or inputB;
end Behavioral;