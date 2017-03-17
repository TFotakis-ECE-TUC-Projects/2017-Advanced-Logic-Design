library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity xorGate is
    Port (inputA : in  STD_LOGIC;
	      inputB : in  STD_LOGIC;
          output : out  STD_LOGIC);
end xorGate;
architecture Behavioral of xorGate is
begin
  output<=inputA xor inputB;
end Behavioral;