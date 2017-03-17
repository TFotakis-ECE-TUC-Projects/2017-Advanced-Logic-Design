library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SumUnit is
    Port ( C : in  STD_LOGIC_VECTOR (2 downto 0);
           P : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end SumUnit;
architecture Behavioral of SumUnit is
	component xorGate
		Port (	inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
begin
----------gnisio-----------------------------------------------------------------------
--	S(0)<=P(0) xor Cin ;
--	S(1)<=P(1) xor C(0);
--	S(2)<=P(2) xor C(1);
--	S(3)<=P(3) xor C(2);
----------epe3ergasmeno----------------------------------------------------------------
	xorGate0: xorGate Port Map(inputA=>P(0), inputB=>Cin,  output=>S(0));
	xorGate1: xorGate Port Map(inputA=>P(1), inputB=>C(0), output=>S(1));
	xorGate2: xorGate Port Map(inputA=>P(2), inputB=>C(1), output=>S(2));
	xorGate3: xorGate Port Map(inputA=>P(3), inputB=>C(2), output=>S(3));
end Behavioral;

