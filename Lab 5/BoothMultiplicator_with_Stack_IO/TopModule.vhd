library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TopModule is
    Port ( Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Multiply : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Input : in  STD_LOGIC_VECTOR (3 downto 0);
			  Clock : in  STD_LOGIC;
           NumberOutput : out  STD_LOGIC_VECTOR (3 downto 0);
           StateOutput : out  STD_LOGIC_VECTOR (3 downto 0));
end TopModule;
architecture Structural of TopModule is
---------------------------------------------------------------Components-------------------------------------------------
	component DebounceUnit
		Port(	Input : in  STD_LOGIC_VECTOR (2 downto 0);
				Reset : in 	STD_LOGIC;
				Clock : in 	STD_LOGIC;
				Output: out STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component FiveBitCounter
		Port(	Input : in  STD_LOGIC_VECTOR (4 downto 0);
				Enable : in  STD_LOGIC;
				Load : in  STD_LOGIC;
				UpDown : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				Clock : in  STD_LOGIC;
				Output : out  STD_LOGIC_VECTOR (4 downto 0));
	end component;
	
	component StackMemory
		Port(	clka : IN STD_LOGIC;
				wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	
	component MainFSM
		Port(	Push : in  STD_LOGIC;
				Pop : in  STD_LOGIC;
				Multiply : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				StackState: in STD_LOGIC_VECTOR (2 downto 0);
				MultiplierWriteEnable: in STD_LOGIC;
				Clock : in  STD_LOGIC;
				CounterEnable : out  STD_LOGIC;
				WriteEnable : out  STD_LOGIC;
				UpDown : out STD_LOGIC;
				MultiplierEnable : out  STD_LOGIC;
				StackOverflow : out  STD_LOGIC;
				StackInputChecker : out  STD_LOGIC);
	end component;
	
	component Multiplier
		Port(	NumberInput : in  STD_LOGIC_VECTOR (3 downto 0);
				Reset : in  STD_LOGIC;
				MultiplierEnable : in STD_LOGIC;
				StackState : in STD_LOGIC_VECTOR (2 downto 0);
				Clock : in  STD_LOGIC;
				WriteEnable : out STD_LOGIC;
				CounterEnable : out STD_LOGIC;
				NumberOutput : out  STD_LOGIC_VECTOR (3 downto 0);
				MultiplicationOverflow : out STD_LOGIC);
	end component;
	
	component FourBitStreamMux2
		Port(	A : in  STD_LOGIC_VECTOR (3 downto 0);
				B : in  STD_LOGIC_VECTOR (3 downto 0);
				S : in  STD_LOGIC;
				Output : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component MainComparator
    Port ( 		NumberInput : in  STD_LOGIC_VECTOR (4 downto 0);
				StackOverflow : in  STD_LOGIC;
				Output : out  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
---------------------------------------------------------------Signals-------------------------------------------------------------

	signal PushSignal,PopSignal,MultiplySignal, MultiplierWriteEnableSignal, FSMWriteEnableSignal, CounterEnableSignal, UpDownSignal, MultiplierEnableSignal, StackInputCheckerSignal, StackOverflowSignal, MultiplierCounterEnableSignal, CounterEnable: std_logic;
	signal StackStateSignal: std_logic_vector (2 downto 0);
	signal StackInput, StackOutput, MultiplierOutput: std_logic_vector (3 downto 0);
	signal CounterOutput: std_logic_vector (4 downto 0);
	signal WriteEnableSignal: std_logic_vector (0 downto 0);

------------------------------------------------------------Instantiations---------------------------------------------------------	
begin

	MainComparatorInstance: MainComparator
    Port Map(		NumberInput=>CounterOutput,
					StackOverflow=>StackOverflowSignal,
					Output=>StackStateSignal);

	StackInputMux: FourBitStreamMux2
		Port Map(	A=>Input,
					B=>MultiplierOutput,
					S=>MultiplierWriteEnableSignal,
					Output=>StackInput);

	MultiplierInstance: Multiplier
		Port Map(	NumberInput=>StackOutput,
					Reset=>Reset,
					MultiplierEnable=>MultiplierEnableSignal,
					StackState=>StackStateSignal,
					Clock=>Clock,
					WriteEnable=>MultiplierWriteEnableSignal,
					CounterEnable=>MultiplierCounterEnableSignal,
					NumberOutput=>MultiplierOutput,
					MultiplicationOverflow=>StateOutput(0));

	MainFSMInstance: MainFSM
		Port Map(	Push=>PushSignal,
					Pop=>PopSignal,
					Multiply=>MultiplySignal,
					Reset=>Reset,
					StackState=>StackStateSignal,
					MultiplierWriteEnable=>MultiplierWriteEnableSignal,
					Clock=>Clock,
					CounterEnable=>CounterEnableSignal,
					WriteEnable=>FSMWriteEnableSignal,
					UpDown=>UpDownSignal,
					MultiplierEnable=>MultiplierEnableSignal,
					StackOverflow=>StackOverflowSignal,
					StackInputChecker=>StackInputCheckerSignal);

	DebounceUnitInstance: DebounceUnit 
		Port Map(	Input(0)=>Push,
					Input(1)=>Pop,
					Input(2)=>Multiply,
					Reset=>Reset,
					Clock=>Clock,
					Output(0)=>PushSignal,
					Output(1)=>PopSignal,
					Output(2)=>MultiplySignal);	
	
	CounterEnable<=CounterEnableSignal or MultiplierCounterEnableSignal;
	FiveBitCounterInstance: FiveBitCounter	
		Port Map(	Input=>"00000",
					Enable=>CounterEnable,
					Load=>'0',
					UpDown=>UpDownSignal,
					Reset=>Reset,
					Clock=>Clock,
					Output=>CounterOutput);

	WriteEnableSignal(0)<=FSMWriteEnableSignal or MultiplierWriteEnableSignal;
	StackMemoryInstance: StackMemory
		Port Map(	clka=>Clock,
					wea=>WriteEnableSignal,
					addra=>CounterOutput,
					dina=>StackInput,
					douta=>StackOutput);
	StateOutput(3 downto 1)<=StackStateSignal;
	NumberOutput<=StackOutput;
end Structural;