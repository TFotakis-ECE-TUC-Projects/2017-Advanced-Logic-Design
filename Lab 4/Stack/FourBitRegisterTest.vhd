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
         load : IN  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitRegister PORT MAP (
          input => input,
          output => output,
          load => load,
          reset => reset,
          clock => clock
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
      input<="0111";
		load<='0';
		reset<='0';
		wait for 100 ns;
		
		input<="0111";
		load<='0';
		reset<='1';
		wait for 100 ns;
		
		input<="0111";
		load<='0';
		reset<='0';
		wait for 100 ns;
		
		input<="0111";
		load<='1';
		reset<='0';
		wait for 100 ns;
		
		input<="0111";
		load<='0';
		reset<='0';
		wait for 100 ns;
		
		input<="0101";
		load<='1';
		reset<='0';
		wait for 100 ns;
		
		input<="0111";
		load<='0';
		reset<='0';
		wait for 100 ns;
      wait;
   end process;
END;