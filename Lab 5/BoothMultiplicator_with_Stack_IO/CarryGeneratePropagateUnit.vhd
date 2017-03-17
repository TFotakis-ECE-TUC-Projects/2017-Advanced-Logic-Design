library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CarryGeneratePropagateUnit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end CarryGeneratePropagateUnit;
architecture Behavioral of CarryGeneratePropagateUnit is
	component xorGate
		Port (	inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
	
	component andGate
		Port (	inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
begin
----------gnisio-----------------------------------------------------------------------
--	P(0) <= A(0) xor B(0);
--	G(0) <= A(0) and B(0); 
--	P(1) <= A(1) xor B(1);
--	G(1) <= A(1) and B(1); 
--	P(2) <= A(2) xor B(2);
--	G(2) <= A(2) and B(2); 
--	P(3) <= A(3) xor B(3); 
--	G(3) <= A(3) and B(3);
----------epe3ergasmeno----------------------------------------------------------------
	xorGate0: xorGate Port Map(inputA=>A(0), inputB=>B(0), output=>P(0));
	andGate0: andGate Port Map(inputA=>A(0), inputB=>B(0), output=>G(0));

	xorGate1: xorGate Port Map(inputA=>A(1), inputB=>B(1), output=>P(1));
	andGate1: andGate Port Map(inputA=>A(1), inputB=>B(1), output=>G(1));
	
	xorGate2: xorGate Port Map(inputA=>A(2), inputB=>B(2), output=>P(2));
	andGate2: andGate Port Map(inputA=>A(2), inputB=>B(2), output=>G(2));

	xorGate3: xorGate Port Map(inputA=>A(3), inputB=>B(3), output=>P(3));
	andGate3: andGate Port Map(inputA=>A(3), inputB=>B(3), output=>G(3));
end Behavioral;