LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY GreaterLessFiveBitComparatorTest IS
END GreaterLessFiveBitComparatorTest;
ARCHITECTURE behavior OF GreaterLessFiveBitComparatorTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT GreaterLessFiveBitComparator
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         Greater : OUT  std_logic;
         Less : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Greater : std_logic;
   signal Less : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: GreaterLessFiveBitComparator PORT MAP (
          A => A,
          B => B,
          Greater => Greater,
          Less => Less
        );

   -- Stimulus process
   stim_proc: process
   begin		
		A<="00000";
		B<="00000";
      wait for 100 ns;
		A<="00001";
		B<="00000";
      wait for 100 ns;
		
		A<="00000";
		B<="00001";
      wait for 100 ns;
		
		A<="10000";
		B<="00000";
      wait for 100 ns;
		
		A<="00000";
		B<="10000";
      wait for 100 ns;
      wait;
   end process;
END;