library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Multiplier is
    Port ( 	NumberInput : in  STD_LOGIC_VECTOR (3 downto 0);
			Reset : in  STD_LOGIC;
			MultiplierEnable : in STD_LOGIC;
			StackState : in STD_LOGIC_VECTOR (2 downto 0);
			Clock : in  STD_LOGIC;
			WriteEnable : out STD_LOGIC;
			CounterEnable : out STD_LOGIC;
			NumberOutput : out  STD_LOGIC_VECTOR (3 downto 0);
			MultiplicationOverflow : out STD_LOGIC);
end Multiplier;

architecture Structural of Multiplier is
--------------------------------------------------------------components-----------------------------------------
	component FourBitFulladder
		Port(	A : in  STD_LOGIC_VECTOR (3 downto 0);
				B : in  STD_LOGIC_VECTOR (3 downto 0);
				Cin : in  STD_LOGIC;
				S : out  STD_LOGIC_VECTOR (3 downto 0);
				C3 : out  STD_LOGIC);
	end component;

	component FourBitRegister
		Port( 	input : in  STD_LOGIC_VECTOR (3 downto 0);
				output : out  STD_LOGIC_VECTOR (3 downto 0);
				S : in  STD_LOGIC_VECTOR (1 downto 0);
				reset : in  STD_LOGIC;
				clock : in  STD_LOGIC;
				sl : in STD_LOGIC;
				sr : in STD_LOGIC);
	end component;

	component OneBitRegister
		Port(	Input : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				sl : in  STD_LOGIC;
				sr : in  STD_LOGIC;
				S : in STD_LOGIC_VECTOR (1 downto 0);
				Clock : in  STD_LOGIC;
				Output : out  STD_LOGIC);
	end component;

	component FourBitStreamMux2
		Port( 	A : in  STD_LOGIC_VECTOR (3 downto 0);
				B : in  STD_LOGIC_VECTOR (3 downto 0);
				S : in  STD_LOGIC;
				Output : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component FourBitTwosComplementConverter
		Port( 	Input : in  STD_LOGIC_VECTOR (3 downto 0);
				Output : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component MultiplierFSM
		Port(	MultiplierEnable : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				StackState : in STD_LOGIC_VECTOR (2 downto 0);
				ControlBits : in STD_LOGIC_VECTOR (1 downto 0);
				Clock : in  STD_LOGIC;
				WriteEnable : out  STD_LOGIC;
				CounterEnable : out  STD_LOGIC;
				UpperRegisterMode : out  STD_LOGIC_VECTOR (1 downto 0);
				LowerRegisterMode : out  STD_LOGIC_VECTOR (1 downto 0);
				RegisterReset : out  STD_LOGIC;
				MultiplicantSelection :out  STD_LOGIC);
	end component;
	
	component orGate5
		Port(	input: in std_logic_vector (4 downto 0);
				output: out std_logic);
	end component;
---------------------------------------------------------------Signals------------------------------------------------

	signal MultiplicantSelectionSignal, PreviousBitOutput, RegisterResetSignal, RegisterReset: std_logic;
	signal UpperRegisterModeSignal, LowerRegisterModeSignal: std_logic_vector (1 downto 0);
	signal InvertedNumberInput, MultiplicantAdder, UpperProductRegisterOutput, LowerProductRegisterOutput, Sum: std_logic_vector (3 downto 0);
	
---------------------------------------------------------------Instances---------------------------------------------
begin
	MultiplierFSMInstance: MultiplierFSM
		Port Map(	MultiplierEnable=>MultiplierEnable,
					Reset=>Reset,
					StackState=>StackState,
					ControlBits(0)=>PreviousBitOutput,
					ControlBits(1)=>LowerProductRegisterOutput(0),
					Clock=>Clock,
					WriteEnable=>WriteEnable,
					CounterEnable=>CounterEnable,
					UpperRegisterMode=>UpperRegisterModeSignal,
					LowerRegisterMode=>LowerRegisterModeSignal,
					RegisterReset=>RegisterResetSignal,
					MultiplicantSelection=>MultiplicantSelectionSignal);
	
	FourBitFullAdderInstance: FourBitFulladder 
		Port Map(A=>UpperProductRegisterOutput,
					B=>MultiplicantAdder,
					Cin=>'0',
					S=>Sum);
	
	RegisterReset<=Reset or RegisterResetSignal;
	UpperProductRegister: FourBitRegister 
		Port Map(	input=>Sum,
					output=>UpperProductRegisterOutput,
					S=>UpperRegisterModeSignal,
					reset=>RegisterReset,
					clock=>Clock,
					sl=>'0',
					sr=>UpperProductRegisterOutput(3));
					
	LowerProductRegister: FourBitRegister 
		Port Map(	input=>NumberInput,
					output=>LowerProductRegisterOutput,
					S=>LowerRegisterModeSignal,
					reset=>RegisterReset,
					clock=>Clock,
					sl=>'0',
					sr=>UpperProductRegisterOutput(0));
					
	PreviousBitRegister: OneBitRegister 
		Port Map(	Input=>'0',
					Reset=>Reset,
					sl=>'0',
					sr=>LowerProductRegisterOutput(0),
					S=>LowerRegisterModeSignal,
					Clock=>Clock,
					Output=>PreviousBitOutput);

	FourBitStreamMux2Instance: FourBitStreamMux2 
		Port Map(	A=>NumberInput,
					B=>InvertedNumberInput,
					S=>MultiplicantSelectionSignal,
					Output=>MultiplicantAdder);
					
	FourBitTwosComplementConverterInstance: FourBitTwosComplementConverter
		Port Map(	Input=>NumberInput,
					Output=>InvertedNumberInput);
	
	NumberOutput<=LowerProductRegisterOutput;
	
	MultiplicationOverflowOr: orGate5 port map(input(3 downto 0)=> UpperProductRegisterOutput, input(4)=>'0', output=>MultiplicationOverflow);
end Structural;