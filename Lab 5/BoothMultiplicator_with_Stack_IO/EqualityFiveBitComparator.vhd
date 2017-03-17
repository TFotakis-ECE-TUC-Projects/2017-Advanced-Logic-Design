library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity EqualityFiveBitComparator is
    Port(input : in  STD_LOGIC_VECTOR (4 downto 0);
			Empty : out  STD_LOGIC;
			AlmostEmpty : out  STD_LOGIC;
			Full : out  STD_LOGIC;
			AlmostFull : out  STD_LOGIC);
end EqualityFiveBitComparator;

architecture Structural of EqualityFiveBitComparator is
  component EqualityOneBitComparator
      Port (A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				result : out  STD_LOGIC);
  end component;
  
  component andGate5
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC);
	end component;
  
  signal almostFullSignal,fullSignal,emptySignal,almostEmptySignal : STD_LOGIC_VECTOR (4 downto 0);
begin
	--Check if sp is equal to "00000"  Empty
	Empty0Bit:EqualityOneBitComparator port map(A=>input(0),B=>'0',result=>emptySignal(0));
	Empty1Bit:EqualityOneBitComparator port map(A=>input(1),B=>'0',result=>emptySignal(1));
	Empty2Bit:EqualityOneBitComparator port map(A=>input(2),B=>'0',result=>emptySignal(2));
	Empty3Bit:EqualityOneBitComparator port map(A=>input(3),B=>'0',result=>emptySignal(3));
	Empty4Bit:EqualityOneBitComparator port map(A=>input(4),B=>'0',result=>emptySignal(4));
	
	--Check if sp is equal to "00001"  AlmostEmpty
	AlEmpty0Bit:EqualityOneBitComparator port map(A=>input(0),B=>'1',result=>almostEmptySignal(0));
	AlEmpty1Bit:EqualityOneBitComparator port map(A=>input(1),B=>'0',result=>almostEmptySignal(1));
	AlEmpty2Bit:EqualityOneBitComparator port map(A=>input(2),B=>'0',result=>almostEmptySignal(2));
	AlEmpty3Bit:EqualityOneBitComparator port map(A=>input(3),B=>'0',result=>almostEmptySignal(3));
	AlEmpty4Bit:EqualityOneBitComparator port map(A=>input(4),B=>'0',result=>almostEmptySignal(4));
	
	--Check if sp is equal to "11111"  Full
	Full0Bit:EqualityOneBitComparator port map(A=>input(0),B=>'1',result=>fullSignal(0));
	Full1Bit:EqualityOneBitComparator port map(A=>input(1),B=>'1',result=>fullSignal(1));
	Full2Bit:EqualityOneBitComparator port map(A=>input(2),B=>'1',result=>fullSignal(2));
	Full3Bit:EqualityOneBitComparator port map(A=>input(3),B=>'1',result=>fullSignal(3));
	Full4Bit:EqualityOneBitComparator port map(A=>input(4),B=>'1',result=>fullSignal(4));
	
	--Check if sp is equal to "11110"  AlmostFull
	AlFull0Bit:EqualityOneBitComparator port map(A=>input(0),B=>'0',result=>almostFullSignal(0));
	AlFull1Bit:EqualityOneBitComparator port map(A=>input(1),B=>'1',result=>almostFullSignal(1));
	AlFull2Bit:EqualityOneBitComparator port map(A=>input(2),B=>'1',result=>almostFullSignal(2));
	AlFull3Bit:EqualityOneBitComparator port map(A=>input(3),B=>'1',result=>almostFullSignal(3));
	AlFull4Bit:EqualityOneBitComparator port map(A=>input(4),B=>'1',result=>almostFullSignal(4));
	
	--Outputs
	EmptyAndGate: 			andGate5 port map(input=>emptySignal, 			output=>Empty);
	AmlostEmptyAndGate: 	andGate5 port map(input=>almostEmptySignal, 	output=>AlmostEmpty);
	FullAndGate: 			andGate5 port map(input=>fullSignal, 			output=>Full);
	AlmostFullAndGate: 		andGate5 port map(input=>almostFullSignal, 		output=>AlmostFull);
end Structural;