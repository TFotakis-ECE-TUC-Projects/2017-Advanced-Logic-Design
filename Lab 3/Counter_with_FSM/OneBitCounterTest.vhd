LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY OneBitCounterTest IS
END OneBitCounterTest; 
ARCHITECTURE behavior OF OneBitCounterTest IS  
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT OneBitCounterUnit
    PORT(
         InputBit : IN  std_logic;
         Load : IN  std_logic;
         UpDown : IN  std_logic;
         Enable : IN  std_logic;
         Previous : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         Output : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal InputBit : std_logic := '0';
   signal Load : std_logic := '0';
   signal UpDown : std_logic := '0';
   signal Enable : std_logic := '0';
   signal Previous : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Output : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: OneBitCounterUnit PORT MAP (
          InputBit => InputBit,
          Load => Load,
          UpDown => UpDown,
          Enable => Enable,
          Previous => Previous,
          Reset => Reset,
          Clock => Clock,
          Output => Output
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
		InputBit<='0';
		Load<='0';
		UpDown<='0';
		Enable<='0';
		Previous<='0';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='0';
		Load<='0';
		UpDown<='0';
		Enable<='0';
		Previous<='0';
		Reset<='1';
      wait for 100 ns;
		
		InputBit<='0';
		Load<='0';
		UpDown<='1';
		Enable<='1';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='0';
		Load<='0';
		UpDown<='0';
		Enable<='1';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='1';
		Load<='1';
		UpDown<='1';
		Enable<='0';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='1';
		Load<='1';
		UpDown<='0';
		Enable<='0';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='1';
		Load<='0';
		UpDown<='0';
		Enable<='0';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='1';
		Load<='0';
		UpDown<='0';
		Enable<='1';
		Previous<='1';
		Reset<='0';
      wait for 100 ns;
		
		InputBit<='1';
		Load<='0';
		UpDown<='0';
		Enable<='1';
		Previous<='0';
		Reset<='0';
      wait for 100 ns;
      wait;
   end process;
END;
