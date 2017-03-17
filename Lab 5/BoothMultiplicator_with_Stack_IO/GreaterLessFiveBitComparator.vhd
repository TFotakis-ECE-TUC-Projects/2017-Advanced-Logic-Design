library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity GreaterLessFiveBitComparator is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           Greater : out  STD_LOGIC;
           Less : out  STD_LOGIC);
end GreaterLessFiveBitComparator;

architecture Structural of GreaterLessFiveBitComparator is
	component EqualityOneBitComparator
		Port (	A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				result : out  STD_LOGIC);
	end component;
  
	component GreaterOneBitComparator
		Port ( 	A : in  STD_LOGIC;
				B : in  STD_LOGIC;
				Result : out  STD_LOGIC);
	end component;
	
	component andGate5
		Port ( 	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	
	component orGate5
		Port ( 	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	
	component norGate
		Port ( 	inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
				output : out  STD_LOGIC);
	end component;
	
	signal EResult, GResult: std_logic_vector (4 downto 0);
	signal andResult: std_logic_vector (3 downto 0);
	signal orResult,equalityAndGateResult: std_logic;
begin
	E0: EqualityOneBitComparator	Port Map(A=>A(0), B=>B(0), Result=>EResult(0));
	G0: GreaterOneBitComparator 	Port Map(A=>A(0), B=>B(0), Result=>GResult(0));
	
	E1: EqualityOneBitComparator	Port Map(A=>A(1), B=>B(1), Result=>EResult(1));
	G1: GreaterOneBitComparator 	Port Map(A=>A(1), B=>B(1), Result=>GResult(1));
	
	E2: EqualityOneBitComparator	Port Map(A=>A(2), B=>B(2), Result=>EResult(2));
	G2: GreaterOneBitComparator 	Port Map(A=>A(2), B=>B(2), Result=>GResult(2));
	
	E3: EqualityOneBitComparator	Port Map(A=>A(3), B=>B(3), Result=>EResult(3));
	G3: GreaterOneBitComparator 	Port Map(A=>A(3), B=>B(3), Result=>GResult(3));
	
	E4: EqualityOneBitComparator	Port Map(A=>A(4), B=>B(4), Result=>EResult(4));
	G4: GreaterOneBitComparator 	Port Map(A=>A(4), B=>B(4), Result=>GResult(4));
	
	orGate:	orGate5	Port Map(input(0)=>GResult(4), input(4 downto 1)=>andResult, output=>orResult);
	andGate0: andGate5 Port Map(input(0)=>GResult(3),Input(1)=>EResult(4), input(2)=>'1',			input(3)=>'1',			input(4)=>'1',			output=>andResult(0));
	andGate1: andGate5 Port Map(input(0)=>GResult(2),Input(1)=>EResult(4), input(2)=>EResult(3),	input(3)=>'1',			input(4)=>'1',			output=>andResult(1));
	andGate2: andGate5 Port Map(input(0)=>GResult(1),Input(1)=>EResult(4), input(2)=>EResult(3),	input(3)=>EResult(2),input(4)=>'1',			output=>andResult(2));
	andGate3: andGate5 Port Map(input(0)=>GResult(0),Input(1)=>EResult(4), input(2)=>EResult(3),	input(3)=>EResult(2),input(4)=>EResult(1),output=>andResult(3));
	Greater<=orResult;
	equalityAndGate: andGate5 Port Map(input=>EResult, output=>equalityAndGateResult);
	LessNorGate: norGate Port Map(inputA=>orResult, inputB=>equalityAndGateResult, output=>Less);
end Structural;