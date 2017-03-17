LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FourBitStackTest IS
END FourBitStackTest;
ARCHITECTURE behavior OF FourBitStackTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
   COMPONENT FourBitStack
    PORT(pop : IN  std_logic;
         push : IN  std_logic;
         add : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic_vector(3 downto 0);
         numberOutput: out  STD_LOGIC_VECTOR (3 downto 0);
			stateOutput	: out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;
    
   --Inputs
   signal pop : std_logic := '0';
   signal push : std_logic := '0';
   signal add : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(3 downto 0) := (others => '0');
	
 	--Outputs
	signal numberOutput, stateOutput: STD_LOGIC_VECTOR (3 downto 0);
	
   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitStack PORT MAP (
          pop => pop,
          push => push,
          add => add,
          clock => clock,
          reset => reset,
          input => input,
          numberOutput => numberOutput,
			 stateOutput=>stateOutput);

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
------------------------------------------------------Reset------------------------------------------------
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0100";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='1';
		input<="0100";
      wait for 100 ns;
		
------------------------------------------------------Push1------------------------------------------------
		
		pop<='0';
		push<='1';
		add<='0';
		reset<='0';
		input<="0011";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0011";
      wait for 100 ns;

------------------------------------------------------Push2------------------------------------------------
		
		pop<='0';
		push<='1';
		add<='0';
		reset<='0';
		input<="1110";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="1110";
      wait for 100 ns;
		
------------------------------------------------------Push3------------------------------------------------
		
		pop<='0';
		push<='1';
		add<='0';
		reset<='0';
		input<="0010";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0010";
      wait for 100 ns;

------------------------------------------------------Push4------------------------------------------------
		
		pop<='0';
		push<='1';
		add<='0';
		reset<='0';
		input<="0100";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0100";
      wait for 100 ns;	
------------------------------------------------------Pop1------------------------------------------------
		
		pop<='1';
		push<='0';
		add<='0';
		reset<='0';
		input<="0001";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0001";
      wait for 100 ns;
	
------------------------------------------------------Add1------------------------------------------------
		
		pop<='0';
		push<='0';
		add<='1';
		reset<='0';
		input<="0001";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0001";
      wait for 100 ns;
	
------------------------------------------------------AddWWithZero------------------------------------------------
		
		pop<='0';
		push<='0';
		add<='1';
		reset<='0';
		input<="0001";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0001";
      wait for 100 ns;
		
------------------------------------------------------Push5------------------------------------------------
		
		pop<='0';
		push<='1';
		add<='0';
		reset<='0';
		input<="1010";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="1010";
      wait for 100 ns;	

------------------------------------------------------Add2------------------------------------------------
		
		pop<='0';
		push<='0';
		add<='1';
		reset<='0';
		input<="0001";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0001";
      wait for 100 ns;	
		

-----------------------------------------------Full the memory-------------------------------------------------
		for i in 0 to 35 loop
			pop<='0';
			push<='1';
			add<='0';
			reset<='0';
			input<="1010";
			wait for 100 ns;
			
			pop<='0';
			push<='0';
			add<='0';
			reset<='0';
			input<="1010";
			wait for 100 ns;	
		end loop;

------------------------------------------------------Reset------------------------------------------------
		pop<='0';
		push<='0';
		add<='0';
		reset<='0';
		input<="0100";
      wait for 100 ns;
		
		pop<='0';
		push<='0';
		add<='0';
		reset<='1';
		input<="0100";
      wait for 100 ns;
		
      wait;
   end process;
END;