LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY FourBitTwosComplementConverterTest IS
END FourBitTwosComplementConverterTest;
ARCHITECTURE behavior OF FourBitTwosComplementConverterTest IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FourBitTwosComplementConverter
    PORT(
         Input : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal Input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(3 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitTwosComplementConverter PORT MAP (
          Input => Input,
          Output => Output
        );
   -- Stimulus process
   stim_proc: process
   begin		
		input<="0000";
      wait for 50 ns;
		input<="0001";
      wait for 50 ns;
		input<="0010";
      wait for 50 ns;
		input<="0011";
      wait for 50 ns;
		input<="0100";
      wait for 50 ns;
		input<="0101";
      wait for 50 ns;
		input<="0110";
      wait for 50 ns;
		input<="0111";
      wait for 50 ns;
		input<="1000";
      wait for 50 ns;
		input<="1001";
      wait for 50 ns;
		input<="1010";
      wait for 50 ns;
		input<="1011";
      wait for 50 ns;
		input<="1100";
      wait for 50 ns;
		input<="1101";
      wait for 50 ns;
		input<="1110";
      wait for 50 ns;
		input<="1111";
      wait for 50 ns;
      wait;
   end process;
END;