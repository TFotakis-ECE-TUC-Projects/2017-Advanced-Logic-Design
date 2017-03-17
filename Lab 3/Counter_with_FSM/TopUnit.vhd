library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TopUnit is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           CounterOut : out  STD_LOGIC_VECTOR (3 downto 0);
           UpDown : out  STD_LOGIC);
end TopUnit;
architecture Behavioral of TopUnit is

	component FourBitCounter
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Enable : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           UpDown : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component FSM
		 Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
				  output : out  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  clock : in  STD_LOGIC);
	end component;

	component debouncebutton
		 Port ( clk 		: in std_logic;
				  rst 		: in std_logic;		
				  input 		: in std_logic;
				  output 	: out std_logic);
	end component;
	
	signal DebounceOutput: std_logic;
	signal FSMOutput: std_logic;
	signal CounterOutput: std_logic_vector (3 downto 0);
	
begin

	TheCounter: FourBitCounter
		Port map(Input	=>"0011",
					Enable=>DebounceOutput,
					Load	=>Load,
					UpDown=>FSMOutput,
					Reset	=>Reset,
					Clock	=>Clock,
					Output=>CounterOutput);

	CounterOut<=CounterOutput;
	
	TheFSM: FSM
		Port map(input	=>CounterOutput,
					output=>FSMOutput,
					reset	=>Reset,
					clock	=>Clock);
	
	UpDown<=FSMOutput;
	
	TheDebounce: debouncebutton
		Port map(clk	=>Clock,
					rst	=>Reset,
					input	=>Enable,
					output=>DebounceOutput);
end Behavioral;

