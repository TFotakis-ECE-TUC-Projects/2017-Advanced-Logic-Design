LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tester IS
END tester;
 
ARCHITECTURE behavior OF tester IS 

    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT Curcuit1
    PORT(
         in0 : IN  std_logic;
         in1 : IN  std_logic;
         btn0 : IN  std_logic;
         btn1 : IN  std_logic;
         btn2 : IN  std_logic;
         btn3 : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal btn0 : std_logic := '0';
   signal btn1 : std_logic := '0';
   signal btn2 : std_logic := '0';
   signal btn3 : std_logic := '0';
	
	--Outputs
   signal led : std_logic_vector(7 downto 0);

BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Curcuit1 PORT MAP (
          in0 => in0,
          in1 => in1,
          btn0 => btn0,
          btn1 => btn1,
          btn2 => btn2,
          btn3 => btn3,
          led => led
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in1<='0';
		in0<='0';
		btn0<='0';
		btn1<='0';
		btn2<='0';
		btn3<='0';
      wait for 100 ns;
		btn0<='1';
		btn1<='1';
		btn2<='1';
		btn3<='1';
      wait for 100 ns;
		
		in1<='0';
		in0<='1';
		btn0<='0';
		btn1<='0';
		btn2<='0';
		btn3<='0';
      wait for 100 ns;
		btn0<='1';
		btn1<='1';
		btn2<='1';
		btn3<='1';
      wait for 100 ns;
		
		in1<='1';
		in0<='0';
		btn0<='0';
		btn1<='0';
		btn2<='0';
		btn3<='0';
      wait for 100 ns;
		btn0<='1';
		btn1<='1';
		btn2<='1';
		btn3<='1';
      wait for 100 ns;
		
		in1<='1';
		in0<='1';
		btn0<='0';
		btn1<='0';
		btn2<='0';
		btn3<='0';
      wait for 100 ns;
		btn0<='1';
		btn1<='1';
		btn2<='1';
		btn3<='1';
      wait for 100 ns;
      wait;
   end process;
END;
