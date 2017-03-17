LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FourBitRegisterTest IS
END FourBitRegisterTest;
ARCHITECTURE behavior OF FourBitRegisterTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FourBitRegister
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         reset : IN  std_logic;
         clock : IN  std_logic;
         sl : IN  std_logic;
         sr : IN  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';
   signal sl : std_logic := '0';
   signal sr : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitRegister PORT MAP (
          input => input,
          output => output,
          S => S,
          reset => reset,
          clock => clock,
          sl => sl,
          sr => sr
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		input<="0000";
		S<="00";
		reset<='0';
		sr<='0';
		sl<='0';
      wait for 50 ns;
		
		input<="0000";
		S<="00";
		reset<='1';
		sr<='0';
		sl<='0';
      wait for 50 ns;
		
		input<="1010";
		S<="11";
		reset<='0';
		sr<='0';
		sl<='0';
      wait for 50 ns;
		
		input<="1010";
		S<="00";
		reset<='0';
		sr<='0';
		sl<='0';
      wait for 50 ns;
			
		input<="0000";
		S<="01";
		reset<='0';
		sr<='0';
		sl<='0';
      wait for 50 ns;
		
		input<="0000";
		S<="01";
		reset<='0';
		sr<='1';
		sl<='0';
      wait for 50 ns;
		
		input<="0000";
		S<="10";
		reset<='0';
		sr<='0';
		sl<='0';
      wait for 50 ns;
		
		input<="0000";
		S<="10";
		reset<='0';
		sr<='0';
		sl<='1';
      wait for 50 ns;
      wait;
   end process;
END;