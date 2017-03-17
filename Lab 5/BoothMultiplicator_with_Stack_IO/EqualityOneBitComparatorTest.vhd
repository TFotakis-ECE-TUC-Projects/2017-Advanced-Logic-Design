LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY EqualityOneBitComparatorTest IS
END EqualityOneBitComparatorTest;
ARCHITECTURE behavior OF EqualityOneBitComparatorTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT EqualityOneBitComparator
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         result : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal result : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: EqualityOneBitComparator PORT MAP (
          A => A,
          B => B,
          result => result
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