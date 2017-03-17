LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FiveBitCounterTest IS
END FiveBitCounterTest; 
ARCHITECTURE behavior OF FiveBitCounterTest IS 
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT FiveBitCounter
    PORT(
         Input : IN  std_logic_vector(4 downto 0);
         Enable : IN  std_logic;
         Load : IN  std_logic;
         UpDown : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         Output : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;    

   --Inputs
   signal Input : std_logic_vector(4 downto 0) := (others => '0');
   signal Enable : std_logic := '0';
   signal Load : std_logic := '0';
   signal UpDown : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: FiveBitCounter PORT MAP (
          Input => Input,
          Enable => Enable,
          Load => Load,
          UpDown => UpDown,
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
	
		Reset<='1';
      wait for 100 ns;	
		Reset<='0';
		Enable<='1';
		Load<='0';
		UpDown<='1';
		wait for 400 ns;
		
		Reset<='0';
		Enable<='1';
		Load<='0';
		UpDown<='0';
		wait for 500 ns;
		
		input<="11001";
		Reset<='0';
		Enable<='1';
		Load<='1';
		UpDown<='0';
		wait for 100 ns;
		
		Reset<='1';
		Enable<='1';
		Load<='0';
		UpDown<='0';
		wait for 100 ns;
	 
		Reset<='0';
		Enable<='1';
		Load<='0';
		UpDown<='0';
		wait for 300 ns;
      wait;
   end process;
END;