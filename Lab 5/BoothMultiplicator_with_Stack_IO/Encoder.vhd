library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Encoder is
    Port ( Empty : in  STD_LOGIC;
           AlmostEmpty : in  STD_LOGIC;
           Stack2AtLeast : in  STD_LOGIC;
           AlmostFull : in  STD_LOGIC;
           Full : in  STD_LOGIC;
           StackOverflow : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end Encoder;

architecture Structural of Encoder is
	component orGate
		Port( inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
	
	component notGate 
		Port( input : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;

	component andGate
		Port(	inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
	signal Led0or1Output, Led1OrOutput, NotStackOvf, Led2or1Output: std_logic;
begin
	Led0Or1: orGate Port Map(inputA=>Full, inputB=>AlmostEmpty, output=> Led0or1Output);
	Led0Or2: orGate Port Map(inputA=>Led0or1Output, inputB=>StackOverflow, output=> Output(0));

	Led1Or: orGate Port Map(inputA=>Full, inputB=>Stack2AtLeast, output=>Led1OrOutput);
	NotStackOverflow: notGate Port Map(input=>StackOverflow, output=>NotStackOvf);
	Led1And: andGate Port Map(inputA=>Led1OrOutput, inputB=>NotStackOvf,output=>Output(1));

	Led2Or1: orGate Port Map(inputA=>Full, inputB=>AlmostFull, output=> Led2or1Output);
	Led2Or2: orGate Port Map(inputA=>Led2or1Output, inputB=>StackOverflow, output=> Output(2));
end Structural;