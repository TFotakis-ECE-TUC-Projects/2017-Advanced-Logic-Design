LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Mux2Test IS
END Mux2Test; 
ARCHITECTURE behavior OF Mux2Test IS  
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mux2
    PORT(
         Input : IN  std_logic_vector(1 downto 0);
         S : IN  std_logic;
         Output : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal Input : std_logic_vector(1 downto 0) := (others => '0');
   signal S : std_logic := '0';

 	--Outputs
   signal Output : std_logic;

BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux2 PORT MAP (
          Input => Input,
          S => S,
          Output => Output
        );

   -- Stimulus process
   stim_proc: process
   begin
		input<="00";
		s<='0';
      wait for 100 ns;
		input<="00";
		s<='1';
      wait for 100 ns;
		
		input<="01";
		s<='0';
      wait for 100 ns;
		input<="01";
		s<='1';
      wait for 100 ns;
		
		input<="10";
		s<='0';
      wait for 100 ns;
		input<="10";
		s<='1';
      wait for 100 ns;
		
		input<="11";
		s<='0';
      wait for 100 ns;
		input<="11";
		s<='1';
		wait;
   end process;
END;