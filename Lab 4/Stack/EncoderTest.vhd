LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY EncoderTest IS
END EncoderTest;
ARCHITECTURE behavior OF EncoderTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Encoder
    PORT(empty : IN  std_logic;
         almostEmpty : IN  std_logic;
         full : IN  std_logic;
         almostFull : IN  std_logic;
         stackOverflow : IN  std_logic;
         additionOverflow : IN  std_logic;
         Led : OUT  std_logic_vector(3 downto 0));
    END COMPONENT;   

   --Inputs
   signal empty : std_logic := '0';
   signal almostEmpty : std_logic := '0';
   signal full : std_logic := '0';
   signal almostFull : std_logic := '0';
   signal stackOverflow : std_logic := '0';
   signal additionOverflow : std_logic := '0';

 	--Outputs
   signal Led : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Encoder PORT MAP (
          empty => empty,
          almostEmpty => almostEmpty,
          full => full,
          almostFull => almostFull,
          stackOverflow => stackOverflow,
          additionOverflow => additionOverflow,
          Led => Led
        );

   -- Stimulus process
   stim_proc: process
   begin		
      empty<='0';
		almostEmpty<='0';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='0';
      wait for 100 ns;
		
		empty<='1';
		almostEmpty<='0';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='0';
      wait for 100 ns;
		
		empty<='0';
		almostEmpty<='1';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='0';
      wait for 100 ns;
		
		empty<='0';
		almostEmpty<='0';
		full<='1';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='0';
      wait for 100 ns;
		
		empty<='0';
		almostEmpty<='0';
		full<='0';
		almostFull<='1';
		stackOverflow<='0';
		additionOverflow<='0';
		wait for 100 ns;
		
		empty<='0';
		almostEmpty<='0';
		full<='0';
		almostFull<='0';
		stackOverflow<='1';
		additionOverflow<='0';
      wait for 100 ns;
		
		empty<='0';
		almostEmpty<='0';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='1';
      wait for 100 ns;
		
		
		empty<='1';
		almostEmpty<='0';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='1';
      wait for 100 ns;
		
		empty<='0';
		almostEmpty<='1';
		full<='0';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='1';
      wait for 100 ns;
		
		empty<='1';
		almostEmpty<='0';
		full<='1';
		almostFull<='0';
		stackOverflow<='0';
		additionOverflow<='1';
      wait for 100 ns;
      wait;
   end process;
END;