library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GreaterOneBitComparator is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Result : out  STD_LOGIC);
end GreaterOneBitComparator;
architecture Structural of GreaterOneBitComparator is
	component notGate
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	component andGate
    Port ( inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	signal notGateOutput: std_logic;
begin
	notGateInstance: notGate Port Map(input=>B,Output=>notGateOutput);
	andGateInstance: andGate Port Map(inputA=>A,InputB=>notGateOutput,Output=>Result);
end Structural;