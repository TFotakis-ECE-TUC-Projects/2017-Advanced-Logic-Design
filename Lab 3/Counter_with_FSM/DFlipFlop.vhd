library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DFlipFlop is
    Port ( D : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Qp : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end DFlipFlop;
architecture Behavioral of DFlipFlop is
signal tester: std_logic;
begin
--	Qp<=(D nand Clock) nand Qn;
--	tester<=(((not D) nand Clock) nand Qp);
--	Qn<=(not Reset) nand tester;
	
	process(clock,reset)
	 begin
		if reset='1' then 
		  Qp<='0';
		  Qn<='1';
		elsif rising_edge(clock) then 
			Qp<=D;
			Qn<=not D;
		end if;
	 end process;
end Behavioral;