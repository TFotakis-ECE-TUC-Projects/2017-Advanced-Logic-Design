library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MultiplierFSM is
	Port ( 	MultiplierEnable : in  STD_LOGIC;
			Reset : in  STD_LOGIC;
			StackState : in STD_LOGIC_VECTOR (2 downto 0);
			ControlBits : in STD_LOGIC_VECTOR (1 downto 0);
			Clock : in  STD_LOGIC;
			WriteEnable : out  STD_LOGIC;
			CounterEnable : out  STD_LOGIC;
			UpperRegisterMode : out  STD_LOGIC_VECTOR (1 downto 0);
			LowerRegisterMode : out  STD_LOGIC_VECTOR (1 downto 0);
			RegisterReset : out  STD_LOGIC;
			MultiplicantSelection : out  STD_LOGIC);
end MultiplierFSM;
architecture Behavioral of MultiplierFSM is
	type StateType is(DoNothing, Load, LoadZero, Pop, Add1, Sub1, Shift1, Add2, Sub2, Shift2, Add3, Sub3, Shift3, Add4, Sub4, Shift4, Push, Delay1, Delay2, Delay3, Delay4);
	signal currentState,nextState:StateType;
begin
	process(clock,reset)
		begin
			if reset='1' then currentState<=DoNothing;
			elsif rising_edge(clock) then currentState<=nextState;
			end if;
	end process;

	process(currentState,MultiplierEnable,StackState,ControlBits)
		begin
			case currentState is
			when DoNothing=> 	if MultiplierEnable='1' then
										if StackState="001" then
											nextState<=LoadZero;
										else
											nextState<=Load;
										end if;
									else
										nextState<=DoNothing;
									end if;
									
			when Load=>			nextState<=Pop;
			when Pop=>			nextState<=Delay1;
			when Delay1=>		if ControlBits="01" then
										nextState<=Add1;
									elsif ControlBits="10" then
										nextState<=Sub1;
									else
										nextState<=Shift1;
									end if;
			when LoadZero=>	if ControlBits="01" then
										nextState<=Add1;
									elsif ControlBits="10" then
										nextState<=Sub1;
									else
										nextState<=Shift1;
									end if;
			when Add1=>			nextState<=Shift1;
			when Sub1=>			nextState<=Shift1;
			
			when Shift1=>		nextState<=Delay2;
			when Delay2=>		if ControlBits="01" then
										nextState<=Add2;
									elsif ControlBits="10" then
										nextState<=Sub2;
									else
										nextState<=Shift2;
									end if;
			when Add2=>			nextState<=Shift2;
			when Sub2=>			nextState<=Shift2;
			
			when Shift2=>		nextState<=Delay3;
			when Delay3=>		if ControlBits="01" then
										nextState<=Add3;
									elsif ControlBits="10" then
										nextState<=Sub3;
									else
										nextState<=Shift3;
									end if;
			when Add3=>			nextState<=Shift3;
			when Sub3=>			nextState<=Shift3;
			
			when Shift3=>		nextState<=Delay4;
			when Delay4=>		if ControlBits="01" then
										nextState<=Add4;
									elsif ControlBits="10" then
										nextState<=Sub4;
									else
										nextState<=Shift4;
									end if;
			when Add4=>			nextState<=Shift4;
			when Sub4=>			nextState<=Shift4;
			
			when Shift4=>		nextState<=Push;
			when Push=>			nextState<=DoNothing;
			when others=>		nextState<=DoNothing;
		end case;
	end process;

	with currentState select
		writeEnable<=			'1' when Push,
								'0' when others;
	
	with currentState select
		counterEnable<=			'1' when Pop, 
									'0' when others;
								
	with currentState select
		UpperRegisterMode<=		"01" when Shift1,
								"01" when Shift2,
								"01" when Shift3,
								"01" when Shift4,
								"11" when Add1,
								"11" when Sub1,
								"11" when Add2,
								"11" when Sub2,
								"11" when Add3,
								"11" when Sub3,
								"11" when Add4,
								"11" when Sub4,
								"00" when others;
		
	with currentState select
		LowerRegisterMode<=		"01" when Shift1,
								"01" when Shift2,
								"01" when Shift3,
								"01" when Shift4,
								"11" when Load,
								"00" when others;
		
	with currentState select
		RegisterReset<=			'1' when LoadZero,
								'0' when others;		

	with currentState select
		MultiplicantSelection<=	'1' when Sub1,
								'1' when Sub2,
								'1' when Sub3,
								'1' when Sub4,
								'0' when others;
end Behavioral;