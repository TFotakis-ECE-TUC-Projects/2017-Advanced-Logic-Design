LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ComparatorTest IS
END ComparatorTest;
ARCHITECTURE behavior OF ComparatorTest IS 
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT Comparator
    PORT(
         input : IN  std_logic_vector(4 downto 0);
         empty : OUT  std_logic;
         almostEmpty : OUT  std_logic;
         full : OUT  std_logic;
         almostFull : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal empty : std_logic;
   signal almostEmpty : std_logic;
   signal full : std_logic;
   signal almostFull : std_logic;
 
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator PORT MAP (
          input => input,
          empty => empty,
          almostEmpty => almostEmpty,
          full => full,
          almostFull => almostFull
        );

   -- Stimulus process
   stim_proc: process
   begin		
		input<="00000";
      wait for 100 ns;	
		
		input<="00001";
      wait for 100 ns;	

		input<="11110";
      wait for 100 ns;

		input<="11111";
      wait for 100 ns;
		
		input<="11001";
      wait for 100 ns;
		
		input<="10110";
      wait for 100 ns;
		
		input<="10101";
      wait for 100 ns;
		
		input<="00101";
      wait for 100 ns;
		
		input<="01010";
      wait for 100 ns;
		
		input<="01111";
      wait for 100 ns;
      wait;
   end process;
END;