library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MainFSM is
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
end MainFSM;
architecture Behavioral of MainFSM is
	type StateType is(DoNothing, PreIncrementPush, PushState, PopState, MultiplyState, StackOverflowState);
	signal currentState,nextState:StateType;
begin
	process(clock,reset)
		begin
			if reset='1' then currentState<=DoNothing;
			elsif rising_edge(clock) then currentState<=nextState;
			end if;
	end process;

	process(currentState,pop,push,Multiply,MultiplierWriteEnable,StackState)
		begin
			case currentState is
	when DoNothing=>				if pop='1' then
											if StackState="000" then
												nextState<=DoNothing;
											else
												nextState<=PopState;
											end if;
										elsif push='1' then
											if StackState="111" then 
												nextState<=StackOverflowState;
											else
												nextState<=PreIncrementPush;
											end if;
										elsif Multiply='1' then
											if StackState="010" then
												nextState<=MultiplyState;
											elsif StackState="111" then
												nextState<=MultiplyState;
											elsif StackState="100" then
												nextState<=MultiplyState;
											elsif StackState="001" then
												nextState<=MultiplyState;
											else
												nextState<=DoNothing;
											end if;
										else
											nextState<=DoNothing;
										end if;
			when PopState=>				nextState<=DoNothing;
			when PreIncrementPush=>		nextState<=PushState;
			when PushState=>				nextState<=DoNothing;
			when MultiplyState=>			if MultiplierWriteEnable='0' then
													nextState<=MultiplyState;
												else
													nextState<=DoNothing;
												end if;
			when StackOverflowState=>	nextState<=StackOverflowState;
			when others=>					nextState<=DoNothing;
		end case;
	end process;

	with currentState select
		writeEnable<=		'1' when PushState,
							'0' when others;

	with currentState select
		upDown<=			'1' when PreIncrementPush,
							'0' when others;
	
	with currentState select
		counterEnable<=		'1' when PreIncrementPush, 
							'1' when PopState, 
							'0' when others;
		
	with currentState select
		stackOverflow<=		'1' when StackOverflowState,
							'0' when others;
							
	with currentState select
		MultiplierEnable<=	'1' when MultiplyState,
							'0' when others;
								
	with currentState select
		StackInputChecker<=	'1' when MultiplyState,
							'0' when others;								
end Behavioral;