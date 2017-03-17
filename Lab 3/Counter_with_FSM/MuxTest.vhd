LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY MuxTest IS
END MuxTest;
ARCHITECTURE behavior OF MuxTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mux
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic;
         s : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          input => input,
          output => output,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
		s<="00";
		input<="0000";
		wait for 50 ns;
		input<="0001";
		wait for 50 ns;
		input<="0010";
		wait for 50 ns;
		input<="0100";
		wait for 50 ns;
		input<="1000";
		wait for 50 ns;
		
		s<="01";
		input<="0000";
		wait for 50 ns;
		input<="0001";
		wait for 50 ns;
		input<="0010";
		wait for 50 ns;
		input<="0100";
		wait for 50 ns;
		input<="1000";
		wait for 50 ns;
		
		s<="10";
		input<="0000";
		wait for 50 ns;
		input<="0001";
		wait for 50 ns;
		input<="0010";
		wait for 50 ns;
		input<="0100";
		wait for 50 ns;
		input<="1000";
		wait for 50 ns;
		
		s<="11";
		input<="0000";
		wait for 50 ns;
		input<="0001";
		wait for 50 ns;
		input<="0010";
		wait for 50 ns;
		input<="0100";
		wait for 50 ns;
		input<="1000";
		wait for 50 ns;
   end process;
END;