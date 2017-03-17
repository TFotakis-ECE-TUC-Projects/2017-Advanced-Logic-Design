library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FiveBitCounter is
    Port ( Input : in  STD_LOGIC_VECTOR (4 downto 0);
           Enable : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           UpDown : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end FiveBitCounter;
architecture Structural of FiveBitCounter is
	component OneBitCounterUnit
		Port ( InputBit : in  STD_LOGIC;
				  Load : in  STD_LOGIC;
				  UpDown : in  STD_LOGIC;
				  Enable : in  STD_LOGIC;
				  Previous : in  STD_LOGIC;
				  Reset : in  STD_LOGIC;
				  Clock : in  STD_LOGIC;
				  Output : out  STD_LOGIC);
	end component;
	
	component andGate5
		Port (	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	
	component orGate5
		Port (	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	
	component andGate
    Port ( inputA : in  STD_LOGIC;
	       inputB : in  STD_LOGIC;
           output : out  STD_LOGIC);
	end component;

	component orGate
		Port ( inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
			   output : out  STD_LOGIC);
	end component;

	component norGate
		Port ( inputA : in  STD_LOGIC;
				inputB : in  STD_LOGIC;
			   output : out  STD_LOGIC);
	end component;

	component notGate
		Port ( input : in  STD_LOGIC;
			   output : out  STD_LOGIC);
	end component;
	
	signal PreviousSignal: STD_LOGIC_VECTOR (4 downto 0);
	signal CounterOutputInternal: STD_LOGIC_VECTOR (4 downto 0);
	signal PreviousSignal1_And2Output, PreviousSignal1_Nor2Output, PreviousSignal2_And5Output, PreviousSignal2_Or5Output, PreviousSignal2_Nor5Output, PreviousSignal3_And5Output, PreviousSignal3_Or5Output, PreviousSignal3_Nor5Output, PreviousSignal4_And5Output, PreviousSignal4_Or5Output, PreviousSignal4_Nor5Output: std_logic;
begin
	Counter0: OneBitCounterUnit port map(InputBit=>Input(0),Load=>Load,UpDown=>UpDown,Enable=>Enable,Previous=>PreviousSignal(0),Reset=>Reset,Clock=>Clock,Output=>CounterOutputInternal(0));
	Counter1: OneBitCounterUnit port map(InputBit=>Input(1),Load=>Load,UpDown=>UpDown,Enable=>Enable,Previous=>PreviousSignal(1),Reset=>Reset,Clock=>Clock,Output=>CounterOutputInternal(1));
	Counter2: OneBitCounterUnit port map(InputBit=>Input(2),Load=>Load,UpDown=>UpDown,Enable=>Enable,Previous=>PreviousSignal(2),Reset=>Reset,Clock=>Clock,Output=>CounterOutputInternal(2));
	Counter3: OneBitCounterUnit port map(InputBit=>Input(3),Load=>Load,UpDown=>UpDown,Enable=>Enable,Previous=>PreviousSignal(3),Reset=>Reset,Clock=>Clock,Output=>CounterOutputInternal(3));
	Counter4: OneBitCounterUnit port map(InputBit=>Input(4),Load=>Load,UpDown=>UpDown,Enable=>Enable,Previous=>PreviousSignal(4),Reset=>Reset,Clock=>Clock,Output=>CounterOutputInternal(4));
	Output(0)<=CounterOutputInternal(0);
	Output(1)<=CounterOutputInternal(1);
	Output(2)<=CounterOutputInternal(2);
	Output(3)<=CounterOutputInternal(3);
	Output(4)<=CounterOutputInternal(4);
	PreviousSignal(0)<='1';
	
	--	PreviousSignal(1)<=(CounterOutputInternal(0) and UpDown)or((CounterOutputInternal(0) nor UpDown));
	PreviousSignal1_And2: andGate Port Map(inputA=>CounterOutputInternal(0), inputB=>UpDown, output=>PreviousSignal1_And2Output);
	PreviousSignal1_Nor2: norGate Port Map(inputA=>CounterOutputInternal(0), inputB=>UpDown, output=>PreviousSignal1_Nor2Output);
	PreviousSignal1_Or2:  orGate  Port Map(inputA=>PreviousSignal1_And2Output, inputB=>PreviousSignal1_Nor2Output, output=>PreviousSignal(1));

--	PreviousSignal(2)<=((CounterOutputInternal(0) and CounterOutputInternal(1)) and UpDown)or(not((CounterOutputInternal(0) or CounterOutputInternal(1)) or UpDown));	
	PreviousSignal2_And5: andGate5 Port Map(input(1 downto 0)=>CounterOutputInternal(1 downto 0), input(2)=>UpDown, input(4 downto 3)=>"11", output=>PreviousSignal2_And5Output);
	PreviousSignal2_Or5: orGate5 Port Map(input(1 downto 0)=>CounterOutputInternal(1 downto 0), input(2)=>UpDown, input(4 downto 3)=>"11", output=>PreviousSignal2_Or5Output);
	PreviousSignal2_Not: notGate port Map(input=>PreviousSignal2_Or5Output, output=>PreviousSignal2_Nor5Output);
	PreviousSignal2_Or2: orGate  Port Map(inputA=>PreviousSignal2_And5Output, inputB=>PreviousSignal2_Nor5Output, output=>PreviousSignal(2));
	
--	PreviousSignal(3)<=(((CounterOutputInternal(0) and CounterOutputInternal(1)) and CounterOutputInternal(2)) and UpDown)or(not(((CounterOutputInternal(0) or CounterOutputInternal(1)) or CounterOutputInternal(2)) or UpDown));
	PreviousSignal3_And5: andGate5 Port Map(input(2 downto 0)=>CounterOutputInternal(2 downto 0), input(3)=>UpDown, input(4)=>'1', output=>PreviousSignal3_And5Output);
	PreviousSignal3_Or5: orGate5 Port Map(input(2 downto 0)=>CounterOutputInternal(2 downto 0), input(3)=>UpDown, input(4)=>'1', output=>PreviousSignal3_Or5Output);
	PreviousSignal3_Not: notGate port Map(input=>PreviousSignal2_Or5Output, output=>PreviousSignal3_Nor5Output);
	PreviousSignal3_Or2: orGate  Port Map(inputA=>PreviousSignal3_And5Output, inputB=>PreviousSignal3_Nor5Output, output=>PreviousSignal(3));

--	PreviousSignal(4)<=(((CounterOutputInternal(0) and CounterOutputInternal(1)) and CounterOutputInternal(2) and CounterOutputInternal(3)) and UpDown)or(not((((CounterOutputInternal(0) or CounterOutputInternal(1)) or CounterOutputInternal(2)) or CounterOutputInternal(3)) or UpDown));
	PreviousSignal4_And5: andGate5 Port Map(input(3 downto 0)=>CounterOutputInternal(3 downto 0), input(4)=>UpDown, output=>PreviousSignal4_And5Output);
	PreviousSignal4_Or5: orGate5 Port Map(input(3 downto 0)=>CounterOutputInternal(3 downto 0), input(4)=>UpDown, output=>PreviousSignal4_Or5Output);
	PreviousSignal4_Not: notGate port Map(input=>PreviousSignal4_Or5Output, output=>PreviousSignal4_Nor5Output);
	PreviousSignal4_Or2: orGate  Port Map(inputA=>PreviousSignal4_And5Output, inputB=>PreviousSignal4_Nor5Output, output=>PreviousSignal(4));
end Structural;