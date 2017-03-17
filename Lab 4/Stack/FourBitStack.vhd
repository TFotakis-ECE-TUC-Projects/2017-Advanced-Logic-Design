library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitStack is
    Port ( pop 			: in  STD_LOGIC;
           push 			: in  STD_LOGIC;
           add 			: in  STD_LOGIC;
           clock 			: in  STD_LOGIC;
           reset 			: in  STD_LOGIC;
           input 			: in  STD_LOGIC_VECTOR (3 downto 0);
           numberOutput	: out  STD_LOGIC_VECTOR (3 downto 0);
			  stateOutput	: out  STD_LOGIC_VECTOR (3 downto 0));
			  
end FourBitStack;
architecture Structural of FourBitStack is
	
	component Comparator
		 Port ( input 			: in  STD_LOGIC_VECTOR (4 downto 0);
				  empty 			: out  STD_LOGIC;
				  almostEmpty 	: out  STD_LOGIC;
				  full 			: out  STD_LOGIC;
				  almostFull 	: out  STD_LOGIC);
	end component;

	component FSM
		 Port ( push : in  STD_LOGIC;
				  pop : in  STD_LOGIC;
				  add : in  STD_LOGIC;
				  empty : in  STD_LOGIC;
				  full : in  STD_LOGIC;
				  almostEmpty : in  STD_LOGIC;
				  carryOut : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  clock : in  STD_LOGIC;
				  writeEnable : out  STD_LOGIC;
				  upDown : out  STD_LOGIC;
				  counterEnable : out  STD_LOGIC;
				  registerLoad : out  STD_LOGIC_VECTOR (1 downto 0);
				  stackOverflow : out  STD_LOGIC;
				  stackInputChecker : out  STD_LOGIC;
				  addWithZero: out  STD_LOGIC);
	end component;

	component FiveBitCounter
		 Port ( Input 	: in  STD_LOGIC_VECTOR (4 downto 0);
				  Enable : in  STD_LOGIC;
				  Load 	: in  STD_LOGIC;
				  UpDown : in  STD_LOGIC;
				  Reset 	: in  STD_LOGIC;
				  Clock 	: in  STD_LOGIC;
				  Output : out  STD_LOGIC_VECTOR (4 downto 0));
	end component;

	component FourBitFulladder
		 Port ( A 	: in  STD_LOGIC_VECTOR (3 downto 0);
				  B 	: in  STD_LOGIC_VECTOR (3 downto 0);
				  Cin : in  STD_LOGIC;
				  S 	: out  STD_LOGIC_VECTOR (3 downto 0);
				  C3	: out  STD_LOGIC);
	end component;

	component FourBitRegister
		 Port ( input 	: in  STD_LOGIC_VECTOR (3 downto 0);
				  output : out  STD_LOGIC_VECTOR (3 downto 0);
				  load 	: in  STD_LOGIC;
				  reset 	: in  STD_LOGIC;
				  clock 	: in  STD_LOGIC);
	end component;

	component debouncebutton
		Port ( clk 		: in std_logic;
				 rst 		: in std_logic;			
				 input	: in std_logic;
				 output 	: out std_logic);
	end component;

	component StackMemory
	  Port (	clka 	: IN STD_LOGIC;
				wea	: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				dina 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	end component;
	
	component Encoder
    Port ( empty 					: in  STD_LOGIC;
           almostEmpty 			: in  STD_LOGIC;
           full 					: in  STD_LOGIC;
           almostFull 			: in  STD_LOGIC;
           stackOverflow 		: in  STD_LOGIC;
           additionOverflow 	: in  STD_LOGIC;
           Led 					: out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	signal 	writeEnableSignal: STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal	registerLoadSignal: STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal 	counterOutput: STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal 	stackOutput, Register1Input, Register2Input, register1Output, register2Output, stackInputSignal,adderBSignal,adderOutput: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal 	counterEnable,upDown,emptySignal,almostEmptySignal,fullSignal,almostFullSignal,carryOutSignal,popSignal,pushSignal,addSignal,stackOverflowSignal,stackInputCheckerSignal,addWithZeroSignal: STD_LOGIC;

begin	
	comparatorInstance: Comparator Port map(	input=>counterOutput,
															empty=>emptySignal,
															almostEmpty=>almostEmptySignal,
															full=>fullSignal,
															almostFull=>almostFullSignal);

	fsmInstance: FSM Port map(	push=>pushSignal,
										pop=>popSignal,
										add=>addSignal,
										empty=>emptySignal,
										full=>fullSignal,
										almostEmpty=>almostEmptySignal,
										carryOut=>carryOutSignal,
										reset=>reset,
										clock=>clock,
										writeEnable=>writeEnableSignal(0),
										upDown=>upDown,
										counterEnable=>counterEnable,
										registerLoad=>registerLoadSignal,
										stackOverflow=>stackOverflowSignal,
										stackInputChecker=>stackInputCheckerSignal,
										addWithZero=>addWithZeroSignal);

	fiveBitCounterInstance: FiveBitCounter Port map(Input=>"00000",
																	Enable=>counterEnable,
																	Load=>'0',
																	UpDown=>upDown,
																	Reset=>reset,
																	Clock=>clock,
																	Output=>counterOutput);

	fourBitFulladderInstance: FourBitFulladder Port map(	A=>register1Output,
																			B=>register2Output,
																			Cin=>'0',
																			S=>adderOutput,
																			C3=>carryOutSignal);

	fourBitRegisterInstance1: FourBitRegister Port map(input=>stackOutput,
																		output=>register1Output,
																		load=>registerLoadSignal(0),
																		reset=>reset,
																		clock=>clock);
																		
	fourBitRegisterInstance2: FourBitRegister Port map(input=>Register2Input,
																		output=>register2Output,
																		load=>registerLoadSignal(1),
																		reset=>reset,
																		clock=>clock);																		

	debouncePop: debouncebutton Port map(	clk=>clock,
														rst=>reset,
														input=>pop,
														output=>popSignal);
														
	debouncePush: debouncebutton Port map(	clk=>clock,
														rst=>reset,
														input=>push,
														output=>pushSignal);
														
	debounceAdd: debouncebutton Port map(	clk=>clock,
														rst=>reset,
														input=>add,
														output=>addSignal);

	stackMemoryInstance: StackMemory Port map(clka=>clock,
															wea=>writeEnableSignal,
															addra=>counterOutput,
															dina=>stackInputSignal,
															douta=>stackOutput);
															
	encoderInstance: Encoder Port map( 	empty=>emptySignal,
													almostEmpty=>almostEmptySignal,
													full=>fullSignal,
													almostFull=>almostFullSignal,
													stackOverflow=>stackOverflowSignal,
													additionOverflow=>carryOutSignal,
													Led=>StateOutput);
															
	numberOutput<=stackOutput;
	
	process(addWithZeroSignal,clock)
		begin
			if addWithZeroSignal='0' then
				Register2Input<=stackOutput;
			else
				Register2Input<="0000";
			end if;
	end process;
	
	process (stackInputCheckerSignal,clock)
		begin
			if stackInputCheckerSignal='0' then
				stackInputSignal<=input;
			else
				stackInputSignal<=adderOutput;
			end if;
	end process;
end Structural;