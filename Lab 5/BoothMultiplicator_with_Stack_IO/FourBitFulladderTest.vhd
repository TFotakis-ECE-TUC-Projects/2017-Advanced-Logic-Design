LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY test IS
END test;
ARCHITECTURE behavior OF test IS 
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT FourBitFulladder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         C3 : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C3 : std_logic;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut: FourBitFulladder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          C3 => C3
        );

	stim_proc: process
	begin		
		A<="0000";
		B<="0000";
		Cin<='0';
		wait for 100 ns;	

		A<="1111";
		B<="1111";
		Cin<='0';
		wait for 100 ns;
		
		A<="0010";
		B<="0011";
		Cin<='0';
		wait for 100 ns;
		
		A<="1010";
		B<="1001";
		Cin<='1';
		wait for 100 ns;
		wait;
	end process;
END;
