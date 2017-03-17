library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TwoBitMultiplexer is
    Port ( Input : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end TwoBitMultiplexer;
architecture Behavioral of TwoBitMultiplexer is
	component andGate
		Port(inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	
	component orGate
		Port(inputA : in  STD_LOGIC;
	        inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	
	component notGate
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;
	
	signal andGate1output, andGate2output, notS: std_logic;
begin
	notGate1: notGate Port Map(input=>s, output=>notS);
	andGate1: andGate Port Map(inputA=>input(0), inputB=>notS, output=>andGate1output);
	andGate2: andGate Port Map(inputA=>input(1), inputB=>S, output=>andGate2output);
	orGate1: orGate Port Map(inputA=>andGate1Output, inputB=>andGate2Output, output=>output);
end Behavioral;