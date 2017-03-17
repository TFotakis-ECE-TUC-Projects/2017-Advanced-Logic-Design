LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FSMTest IS
END FSMTest;
ARCHITECTURE behavior OF FSMTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FSM
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          input => input,
          output => output,
          reset => reset,
          clock => clock
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
      reset<='1';
      wait for 100 ns;	
		
		reset<='0';
		input<="0000";
      wait for 100 ns;	

		input<="1110";
      wait for 100 ns;
		
		input<="0001";
      wait for 100 ns;	
		
		input<="1010";
      wait for 100 ns;
		
		input<="1110";
      wait for 100 ns;
      wait;
   end process;

END;
