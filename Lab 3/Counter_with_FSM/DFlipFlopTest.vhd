LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY DFlipFlopTest IS
END DFlipFlopTest; 
ARCHITECTURE behavior OF DFlipFlopTest IS  
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT DFlipFlop
    PORT(
         D : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         Qp : out  std_logic;
         Qn : out  std_logic
        );
    END COMPONENT;

   --Inputs
   signal D : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

	--BiDirs
   signal Qp : std_logic;
   signal Qn : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DFlipFlop PORT MAP (
          D => D,
          Reset => Reset,
          Clock => Clock,
          Qp => Qp,
          Qn => Qn
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
      D<='0';
		Reset<='0';
      wait for 100 ns;
		D<='1';
      wait for 100 ns;
		
		D<='0';
      wait for 100 ns;
		D<='1';
      wait for 100 ns;
		
		D<='0';
      wait for 100 ns;
		D<='1';
      wait for 100 ns;
		
		D<='0';
      wait for 100 ns;
		D<='1';
      wait for 100 ns;

		Reset<='1';
		wait for 100 ns;
		Reset<='0';
      wait;
   end process;
END;