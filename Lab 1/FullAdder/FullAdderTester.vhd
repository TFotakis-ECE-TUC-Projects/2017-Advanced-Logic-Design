LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY test IS
END test;
ARCHITECTURE behavior OF test IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FullAdder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         sum : OUT  std_logic
        );
    END COMPONENT;

	--Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';
	
	--Outputs
   signal cout : std_logic;
   signal sum : std_logic;
 
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => cout,
          sum => sum
        );

   -- Stimulus process
   stim_proc: process
   begin		
		a<='0';
		b<='0';
		cin<='0';
      wait for 100 ns;	
		
		a<='0';
		b<='0';
		cin<='1';
      wait for 100 ns;	

		a<='0';
		b<='1';
		cin<='0';
      wait for 100 ns;	

		a<='0';
		b<='1';
		cin<='1';
      wait for 100 ns;	


		a<='1';
		b<='0';
		cin<='0';
      wait for 100 ns;	
		
		a<='1';
		b<='0';
		cin<='1';
      wait for 100 ns;	

		a<='1';
		b<='1';
		cin<='0';
      wait for 100 ns;	

		a<='1';
		b<='1';
		cin<='1';
      wait for 100 ns;	
      wait;
   end process;
END;