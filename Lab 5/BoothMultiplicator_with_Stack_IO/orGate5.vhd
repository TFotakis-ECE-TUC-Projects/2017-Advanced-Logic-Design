library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity orGate5 is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC);
end orGate5;
architecture Structural of orGate5 is
	component orGate
    Port ( inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	signal orOut: std_logic_vector(2 downto 0);
begin
	orGate0: orGate Port Map(inputA=>input(0), inputB=>input(1), output=>orOut(0));
	orGate1: orGate Port Map(inputA=>input(2), inputB=>input(3), output=>orOut(1));
	orGate2: orGate Port Map(inputA=>orOut(0), inputB=>orOut(1), output=>orOut(2));
	orGate3: orGate Port Map(inputA=>orOut(2), inputB=>input(4), output=>output);
	--output<=((input(0) or input(1)) or (input(2) or input(3))) or input(4);
end Structural;