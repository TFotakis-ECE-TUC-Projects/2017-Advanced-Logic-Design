LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY MainFSMTest IS
END MainFSMTest;
ARCHITECTURE behavior OF MainFSMTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MainFSM
    PORT(Push : IN  std_logic;
         Pop : IN  std_logic;
         Multiply : IN  std_logic;
         Reset : IN  std_logic;
         StackState : IN  std_logic_vector(2 downto 0);
         MultiplierWriteEnable : IN  std_logic;
         Clock : IN  std_logic;
         CounterEnable : OUT  std_logic;
         WriteEnable : OUT  std_logic;
         UpDown : OUT  std_logic;
         MultiplierEnable : OUT  std_logic;
         StackOverflow : OUT  std_logic;
         StackInputChecker : OUT  std_logic);
    END COMPONENT;
    

   --Inputs
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal Multiply : std_logic := '0';
   signal Reset : std_logic := '0';
   signal StackState : std_logic_vector(2 downto 0) := (others => '0');
   signal MultiplierWriteEnable : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal CounterEnable : std_logic;
   signal WriteEnable : std_logic;
   signal UpDown : std_logic;
   signal MultiplierEnable : std_logic;
   signal StackOverflow : std_logic;
   signal StackInputChecker : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainFSM PORT MAP (
          Push => Push,
          Pop => Pop,
          Multiply => Multiply,
          Reset => Reset,
          StackState => StackState,
          MultiplierWriteEnable => MultiplierWriteEnable,
          Clock => Clock,
          CounterEnable => CounterEnable,
          WriteEnable => WriteEnable,
          UpDown => UpDown,
          MultiplierEnable => MultiplierEnable,
          StackOverflow => StackOverflow,
          StackInputChecker => StackInputChecker
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='1';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for 8*Clock_period;
		
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for 9*Clock_period;
		
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for 8*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='1';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='1';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for 9*Clock_period;
		
		Push<='0';
		Pop<='1';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for 9*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		StackState<="010";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="010";
		MultiplierWriteEnable<='0';
      wait for 4*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="010";
		MultiplierWriteEnable<='1';
      wait for 5*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for 4*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='1';
      wait for 5*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='0';
      wait for 4*Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="000";
		MultiplierWriteEnable<='1';
      wait for 5*Clock_period;
		
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for Clock_period;
		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		StackState<="111";
		MultiplierWriteEnable<='0';
      wait for 9*Clock_period;
      wait;
   end process;
END;