LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY TopModuleTest IS
END TopModuleTest;
ARCHITECTURE behavior OF TopModuleTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT TopModule
    PORT(
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Multiply : IN  std_logic;
         Reset : IN  std_logic;
         Input : IN  std_logic_vector(3 downto 0);
         Clock : IN  std_logic;
         NumberOutput : OUT  std_logic_vector(3 downto 0);
         StateOutput : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal Multiply : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Input : std_logic_vector(3 downto 0) := (others => '0');
   signal Clock : std_logic := '0';
 	--Outputs
   signal NumberOutput : std_logic_vector(3 downto 0);
   signal StateOutput : std_logic_vector(3 downto 0);
   -- Clock period definitions
   constant Clock_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: TopModule PORT MAP (
          Push => Push,
          Pop => Pop,
          Multiply => Multiply,
          Reset => Reset,
          Input => Input,
          Clock => Clock,
          NumberOutput => NumberOutput,
          StateOutput => StateOutput
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
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0000";
      wait for 100 ns;
-----------------------------------------Reset--------------------------------------------------		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='1';
		Input<="0000";
      wait for 100 ns;
------------------------------------------Push #2---------------------------------------------------
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
------------------------------------------Push #3---------------------------------------------------
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0011";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0011";
      wait for 50 ns;
------------------------------------------Multiply---------------------------------------------------
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		Input<="0011";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0011";
      wait for 150 ns;
------------------------------------------Multiply With Zero-----------------------------------------
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		Input<="0011";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0011";
      wait for 150 ns;
------------------------------------------Push #-2 ---------------------------------------------------
		wait for 100 ns;
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="1110";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="1110";
      wait for 50 ns;
------------------------------------------Push #2 ---------------------------------------------------
		wait for 100 ns;
		Push<='1';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
------------------------------------------Multiply---------------------------------------------------
		Push<='0';
		Pop<='0';
		Multiply<='1';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 150 ns;
------------------------------------------Pop--------------------------------------------------------
		Push<='0';
		Pop<='1';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
------------------------------------------Pop--------------------------------------------------------
		Push<='0';
		Pop<='1';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
------------------------------------------Pop--------------------------------------------------------
		Push<='0';
		Pop<='1';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='0';
		Input<="0010";
      wait for 50 ns;
-----------------------------------------Reset--------------------------------------------------		
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='1';
		Input<="0010";
      wait for 100 ns;
-----------------------------------------------Full the memory-------------------------------------------------
		for i in 0 to 35 loop
			Push<='1';
			Pop<='0';
			Multiply<='0';
			Reset<='0';
			Input<="0010";
			wait for 50 ns;
			
			Push<='0';
			Pop<='0';
			Multiply<='0';
			Reset<='0';
			Input<="0010";
			wait for 50 ns;	
		end loop;
------------------------------------------------------Reset------------------------------------------------
		Push<='0';
		Pop<='0';
		Multiply<='0';
		Reset<='1';
		Input<="0010";
      wait for 100 ns;

      wait;
   end process;
END;