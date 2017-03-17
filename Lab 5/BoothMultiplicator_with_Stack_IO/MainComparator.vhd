library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MainComparator is
    Port ( NumberInput : in  STD_LOGIC_VECTOR (4 downto 0);
           StackOverflow : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end MainComparator;
architecture Structural of MainComparator is
component EqualityFiveBitComparator
    Port(input : in  STD_LOGIC_VECTOR (4 downto 0);
			Empty : out  STD_LOGIC;
			AlmostEmpty : out  STD_LOGIC;
			Full : out  STD_LOGIC;
			AlmostFull : out  STD_LOGIC);
end component;

component GreaterLessFiveBitComparator
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           Greater : out  STD_LOGIC;
           Less : out  STD_LOGIC);
end component;

component Encoder
    Port ( Empty : in  STD_LOGIC;
           AlmostEmpty : in  STD_LOGIC;
           Stack2AtLeast : in  STD_LOGIC;
           AlmostFull : in  STD_LOGIC;
           Full : in  STD_LOGIC;
           StackOverflow : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

	signal EmptySignal, AlmostEmptySignal, Stack2AtLeastSignal, AlmostFullSignal, FullSignal:std_logic;

begin
	EncoderInstance: Encoder 
		Port Map(Empty=>EmptySignal, 
					AlmostEmpty=>AlmostEmptySignal, 
					Stack2AtLeast=> Stack2AtLeastSignal, 
					AlmostFull=> AlmostFullSignal, 
					Full=>FullSignal, 
					StackOverflow=>StackOverFlow, 
					Output=>Output);
					
	EqualityFiveBitComparatorInstance: EqualityFiveBitComparator 
		Port Map(input=> NumberInput, 
					Empty=>EmptySignal, 
					AlmostEmpty=>AlmostEmptySignal, 
					Full=>FullSignal, 
					AlmostFull=>AlmostFullSignal);
					
	GreaterLessFiveBitComparatorInstance: GreaterLessFiveBitComparator
		Port Map(A=>NumberInput,
					B=>"00001",
					Greater=>Stack2AtLeastSignal);			
end Structural;