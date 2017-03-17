library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FSM is
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
end FSM;
architecture Behavioral of FSM is
	
	type StateType is(DoNothing, PreIncrementPush, PushState, PopState, AddPop1, RegisterLoad1, AddPop2, RegisterLoad2, PushAdd, StackOverflowState, AdditionCompleted, Delay, RegisterLoadZero);
	signal currentState,nextState:StateType;

begin
	
	process(clock,reset)
		begin
			if reset='1' then currentState<=DoNothing;
			elsif rising_edge(clock) then currentState<=nextState;
			end if;
	end process;
	
	process(currentState,pop,push,add,carryOut,full)
	begin
		case currentState is
			when DoNothing=>				if pop='1' then
													if empty='0' then
														nextState<=PopState;
													else
														nextState<=DoNothing;
													end if;
												elsif push='1' then
													if full='0' then 
														nextState<=PreIncrementPush;
													else
														nextState<=StackOverflowState;
													end if;
												elsif add='1' then
													if empty='0' then
														nextState<=RegisterLoad1;
													else
														nextState<=DoNothing;
													end if;
												else
													nextState<=DoNothing;
												end if;
			when PopState=>				nextState<=DoNothing;
			when PreIncrementPush=>		nextState<=PushState;
			when PushState=>				nextState<=DoNothing;
			when AddPop1=>					nextState<=Delay;
			when Delay=>					nextState<=RegisterLoad2;
			when RegisterLoad1=>			if almostEmpty='0' then
													nextState<=AddPop1;
												else
													nextState<=RegisterLoadZero;
												end if;
			when AddPop2=>					nextState<=DoNothing;
			when RegisterLoad2=>			nextState<=AdditionCompleted;
			when RegisterLoadZero=>		nextState<=AdditionCompleted;
			when AdditionCompleted=>	if carryOut='0' then
													nextState<=PushAdd;
												else
													nextState<=AddPop2;
												end if;
			when PushAdd=>					nextState<=DoNothing;
			when StackOverflowState=>	nextState<=StackOverflowState;
			when others=>					nextState<=DoNothing;
		end case;
	end process;

	with currentState select
		writeEnable<=	'1' when PushState,
							'1' when PushAdd,
							'0' when others;
	
	with currentState select
		upDown<=			'1' when PreIncrementPush,
							'0' when others;
	
	with currentState select
		counterEnable<='1' when PreIncrementPush, 
							'1' when PopState, 
							'1' when AddPop1, 
							'1' when AddPop2, 
							'0' when others;
		
	with currentState select
		registerLoad<=	"01" when RegisterLoad1,
							"10" when RegisterLoad2,
							"10" when RegisterLoadZero,
							"00" when others;
		
	with currentState select
		stackOverflow<='1' when StackOverflowState,
							'0' when others;
							
	with currentState select
		stackInputChecker<='1' when PushAdd,
								 '0' when others;
							
	with currentState select
		addWithZero<=	'1' when RegisterLoadZero,
							'0' when others;								 
end Behavioral;