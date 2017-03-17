LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TopUnitTest IS
END TopUnitTest; 
ARCHITECTURE behavior OF TopUnitTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT TopUnit
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Load : IN  std_logic;
         Enable : IN  std_logic;
         CounterOut : OUT  std_logic_vector(3 downto 0);
         UpDown : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Load : std_logic := '0';
   signal Enable : std_logic := '0';

 	--Outputs
   signal CounterOut : std_logic_vector(3 downto 0);
   signal UpDown : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopUnit PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Load => Load,
          Enable => Enable,
          CounterOut => CounterOut,
          UpDown => UpDown
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
-----------------------------------------------------Reseting----------------------------------
		Reset	<='0';
		Load	<='0';
		Enable<='0';
      wait for 100 ns;

		Reset	<='1';
		Load	<='0';
		Enable<='0';
      wait for 100 ns;
----------------------------------------------------Loading--------------------------------------------
		Reset	<='0';
		Load	<='1';
		Enable<='0';
      wait for 100 ns;
		
		Reset	<='0';
		Load	<='0';
		Enable<='0';
		wait for 100 ns;
-----------------------------------------------------Counting---------------------------------------------		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
		
		Enable<='1';
      wait for Clock_period*2;
		Enable<='0';
		wait for Clock_period*2;
      wait;
   end process;

END;
