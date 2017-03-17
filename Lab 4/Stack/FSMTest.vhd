LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY FSMTest IS
END FSMTest;
ARCHITECTURE behavior OF FSMTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FSM
    PORT(
         push : IN  std_logic;
         pop : IN  std_logic;
         add : IN  std_logic;
         empty : IN  std_logic;
         full : IN  std_logic;
         almostEmpty : IN  std_logic;
         carryOut : IN  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic;
         writeEnable : OUT  std_logic;
         upDown : OUT  std_logic;
         counterEnable : OUT  std_logic;
         registerLoad : OUT  std_logic_vector(1 downto 0);
         stackOverflow : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal push : std_logic := '0';
   signal pop : std_logic := '0';
   signal add : std_logic := '0';
   signal empty : std_logic := '0';
   signal full : std_logic := '0';
   signal almostEmpty : std_logic := '0';
   signal carryOut : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal writeEnable : std_logic;
   signal upDown : std_logic;
   signal counterEnable : std_logic;
   signal registerLoad : std_logic_vector(1 downto 0);
   signal stackOverflow : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          push => push,
          pop => pop,
          add => add,
          empty => empty,
          full => full,
          almostEmpty => almostEmpty,
          carryOut => carryOut,
          reset => reset,
          clock => clock,
          writeEnable => writeEnable,
          upDown => upDown,
          counterEnable => counterEnable,
          registerLoad => registerLoad,
          stackOverflow => stackOverflow
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
--------------------------------------------------Reset---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='1';    
			wait for clock_period;

			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*8;
--------------------------------------------------Push1---------------------------------------------

			push			<='1';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;
			
--------------------------------------------------Pop1---------------------------------------------
			push			<='0';
         pop			<='1';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;

--------------------------------------------------AddWithZero---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='1';
         empty			<='0';
         full			<='0';
         almostEmpty	<='1';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='1';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;
			
--------------------------------------------------AddNormal---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='1';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;

--------------------------------------------------AddWithCarry---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='1';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*4;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='1';
         reset			<='0';    
			wait for clock_period*6;
			
--			push			<='0';
--         pop			<='0';
--         add			<='0';
--         empty			<='0';
--         full			<='0';
--         almostEmpty	<='0';
--         carryOut		<='0';
--         reset			<='0';    
--			wait for clock_period*8;
			
--------------------------------------------------PushWhenFull---------------------------------------------
			push			<='1';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='1';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*8;
--reset			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='1';    
			wait for clock_period;  
			
--------------------------------------------------PopWhenEmpty---------------------------------------------
			push			<='0';
         pop			<='1';
         add			<='0';
         empty			<='1';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;

--------------------------------------------------AddWhenEmpty---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='1';
         empty			<='1';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait for clock_period*9;

--------------------------------------------------reset---------------------------------------------
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='1';    
			wait for clock_period;
			
			push			<='0';
         pop			<='0';
         add			<='0';
         empty			<='0';
         full			<='0';
         almostEmpty	<='0';
         carryOut		<='0';
         reset			<='0';    
			wait;
   end process;
END;