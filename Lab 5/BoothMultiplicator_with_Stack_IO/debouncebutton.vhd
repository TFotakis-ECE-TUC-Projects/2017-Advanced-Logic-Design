library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity debouncebutton is
    Port ( clk 		: in std_logic;		-- connect it to the Clock of the board
           rst 		: in std_logic;		-- connect it to the Reset Button of the board			
           input 		: in std_logic;		-- connect it to the Push Button of the board
           output 	: out std_logic		-- connect it to your circuit
          );
end debouncebutton;
architecture behavioral of debouncebutton is
	type stateType is (S0, S1, S2);
	signal currentS, nextS: stateType;
	
    begin	-- begin architecture
        
   	fsm_comb: process (currentS, input)
	begin			
		case currentS IS
			when S0 	=>	if input = '1' then 	nextS <= S1; 
							else	             	nextS <= S0; 
                		end if;		
			when S1 	=>									nextS <= S2;     			
			when S2		=>	if input = '1' then 	nextS <= S2; 
								else						nextS <= S0;
                			end if;
   		when others	=> 							nextS <= S2;                				
		end case;
	end process fsm_comb;
        
    fsm_synch: process (clk, rst)
	begin
		if (rst='1')  	   			then 	currentS <= S0;  
      elsif (rising_edge(clk))  	then	currentS <= nextS; 
     	end if;
	end process fsm_synch;
              
   output <= '1' when currentS = S1 else '0';    
                           
end Behavioral;	-- end architecture    