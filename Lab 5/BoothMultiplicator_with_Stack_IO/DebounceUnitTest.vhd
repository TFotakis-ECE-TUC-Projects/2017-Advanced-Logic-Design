LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY DebounceUnitTest IS
END DebounceUnitTest;
ARCHITECTURE behavior OF DebounceUnitTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DebounceUnit
    PORT(Input : IN  std_logic_vector(2 downto 0);
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         Output : OUT  std_logic_vector(2 downto 0));
    END COMPONENT;

   --Inputs
   signal Input : std_logic_vector(2 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DebounceUnit PORT MAP (
          Input => Input,
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
		input<="000";
		Reset<='0';
      wait for 100 ns;
		input<="000";
		Reset<='1';
      wait for 100 ns;
		input<="111";
		Reset<='0';
      wait for 100 ns;		
      wait;
   end process;
END;