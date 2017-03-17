LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY GreaterOneBitComparatorTest IS
END GreaterOneBitComparatorTest;
ARCHITECTURE behavior OF GreaterOneBitComparatorTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT GreaterOneBitComparator
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Result : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Result : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: GreaterOneBitComparator PORT MAP (
          A => A,
          B => B,
          Result => Result
        );
   -- Stimulus process
   stim_proc: process
   begin		
		A<='0';
		B<='0';
      wait for 100 ns;	
		A<='0';
		B<='1';
      wait for 100 ns;	
		A<='1';
		B<='0';
      wait for 100 ns;	
		A<='1';
		B<='1';
      wait for 100 ns;	
      wait;
   end process;
END;