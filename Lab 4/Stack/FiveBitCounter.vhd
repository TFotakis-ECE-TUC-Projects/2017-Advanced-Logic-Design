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
	signal PreviousSignal: STD_LOGIC_VECTOR (4 downto 0);
	signal CounterOutputInternal: STD_LOGIC_VECTOR (4 downto 0);
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
	PreviousSignal(1)<=(CounterOutputInternal(0) and UpDown)or((CounterOutputInternal(0) nor UpDown));
	PreviousSignal(2)<=((CounterOutputInternal(0) and CounterOutputInternal(1)) and UpDown)or(not((CounterOutputInternal(0) or CounterOutputInternal(1)) or UpDown));
	PreviousSignal(3)<=(((CounterOutputInternal(0) and CounterOutputInternal(1)) and CounterOutputInternal(2)) and UpDown)or(not(((CounterOutputInternal(0) or CounterOutputInternal(1)) or CounterOutputInternal(2)) or UpDown));
	PreviousSignal(4)<=(((CounterOutputInternal(0) and CounterOutputInternal(1)) and CounterOutputInternal(2) and CounterOutputInternal(3)) and UpDown)or(not((((CounterOutputInternal(0) or CounterOutputInternal(1)) or CounterOutputInternal(2)) or CounterOutputInternal(3)) or UpDown));
end Structural;