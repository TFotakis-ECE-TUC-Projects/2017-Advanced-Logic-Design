LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Mux4Test IS
END Mux4Test;
ARCHITECTURE behavior OF Mux4Test IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mux4
    PORT(
         Input : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         Output : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal Input : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux4 PORT MAP (
          Input => Input,
          S => S,
          Output => Output
        );
   -- Stimulus process
   stim_proc: process
   begin
		input<="0000";
		s<="00";
      wait for 25 ns;
		s<="01";
      wait for 25 ns;
		s<="10";
      wait for 25 ns;
		s<="11";
      wait for 25 ns;
--------------------------------------------------------------------------
		input<="0001";
		s<="00";
      wait for 25 ns;
		s<="01";
      wait for 25 ns;
		s<="10";
      wait for 25 ns;
		s<="11";
      wait for 25 ns;
--------------------------------------------------------------------------
		input<="0010";
		s<="00";
      wait for 25 ns;
		s<="01";
      wait for 25 ns;
		s<="10";
      wait for 25 ns;
		s<="11";
      wait for 25 ns;
--------------------------------------------------------------------------
		input<="0100";
		s<="00";
      wait for 25 ns;
		s<="01";
      wait for 25 ns;
		s<="10";
      wait for 25 ns;
		s<="11";
      wait for 25 ns;
--------------------------------------------------------------------------
		input<="1000";
		s<="00";
      wait for 25 ns;
		s<="01";
      wait for 25 ns;
		s<="10";
      wait for 25 ns;
		s<="11";
      wait for 25 ns;
--------------------------------------------------------------------------
      wait;
   end process;
END;