library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FSM is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC;
			  reset : in  STD_LOGIC;
           clock : in  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
type StateType is(UpCounting,DownCounting);
signal currentState,nextState:StateType;

begin
	process(currentState,input)
		begin
			case currentState is
				when UpCounting =>	if input="1111" then
												nextState<=DownCounting;
											else
												nextState<=UpCounting;
											end if;
				when DownCounting=>	if input="0000" then
												nextState<=UpCounting;
											else
												nextState<=DownCounting;
											end if;
				when others => 			nextState<=UpCounting;
			end case;
		end process;
		
	process(clock,reset)
		begin
			if reset='1' then currentState<=UpCounting;
			elsif rising_edge(clock) then currentState<=nextState;
			end if;
	end process;
	
	with currentState select
		output <= '1' when UpCounting,
					 '0' when others;
end Behavioral;

