library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity XnorGate is
    Port (inputA : in  STD_LOGIC;
	      inputB : in  STD_LOGIC;
          output : out  STD_LOGIC);
end XnorGate;
architecture Behavioral of XnorGate is
begin
  output<=inputA xnor inputB;
end Behavioral;