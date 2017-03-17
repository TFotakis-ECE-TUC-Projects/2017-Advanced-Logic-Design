library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitTwosComplementConverter is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end FourBitTwosComplementConverter;
architecture Structural of FourBitTwosComplementConverter is
	component TwoBitMultiplexer is
    Port ( Input:	in  STD_LOGIC_VECTOR (1 downto 0);
           S:		in STD_LOGIC;
           Output:out  STD_LOGIC);
	end component;
	
	component orGate
		port(	inputA: in std_logic;
				inputB: in std_logic;
				output: out std_logic);
	end component;
	
	component notGate
		Port(	input: in std_logic;
				output: out std_logic);
	end component;
	
	signal Outputs: std_logic_vector (3 downto 0);
	signal selectors, notInput: std_logic_vector (2 downto 0);
begin
	Outputs(0)<=Input(0);
	selectors(0)<=Input(0);
	selectorsOr1: orGate Port Map(inputA=>selectors(0), inputB=>input(1), output=>selectors(1));
	selectorsOr2: orGate Port Map(inputA=>selectors(1), inputB=>input(2), output=>selectors(2));
	notGate0: notGate Port Map(input=>input(1), output=>notInput(0));
	notGate1: notGate Port Map(input=>input(2), output=>notInput(1));
	notGate2: notGate Port Map(input=>input(3), output=>notInput(2));
	TwoBitMultiplexer0: TwoBitMultiplexer Port Map(Input(0)=>Input(1),Input(1)=>notInput(0),s=>selectors(0),Output=>Outputs(1));
	TwoBitMultiplexer1: TwoBitMultiplexer Port Map(Input(0)=>Input(2),Input(1)=>notInput(1),s=>selectors(1),Output=>Outputs(2));
	TwoBitMultiplexer2:	TwoBitMultiplexer Port Map(Input(0)=>Input(3),Input(1)=>notInput(2),s=>selectors(2),Output=>Outputs(3));
	Output<=Outputs;
end Structural;