library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity EqualityOneBitComparator is
    Port (A : in  STD_LOGIC;
          B : in  STD_LOGIC;
          result : out  STD_LOGIC);
end EqualityOneBitComparator;
architecture Structural of EqualityOneBitComparator is
 component XnorGate
      Port (inputA : in  STD_LOGIC;
			inputB : in  STD_LOGIC;
			output : out  STD_LOGIC);
 end component;
begin
	XNorG:XnorGate port map(inputA=>A,inputB=>B,output=>result);
end Structural;