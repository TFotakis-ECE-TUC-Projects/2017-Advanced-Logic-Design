library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity andGate5 is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC);
end andGate5;
architecture Behavioral of andGate5 is
component andGate
    Port ( inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	signal andOut: std_logic_vector(2 downto 0);
begin
	andGate0: andGate Port Map(inputA=>input(0), inputB=>input(1), output=>andOut(0));
	andGate1: andGate Port Map(inputA=>input(2), inputB=>input(3), output=>andOut(1));
	andGate2: andGate Port Map(inputA=>andOut(0), inputB=>andOut(1), output=>andOut(2));
	andGate3: andGate Port Map(inputA=>andOut(2), inputB=>input(4), output=>output);
--	output<=((input(0) and input(1)) and (input(2) and input(3))) and input(4);
end Behavioral;