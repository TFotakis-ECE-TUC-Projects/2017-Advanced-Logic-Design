library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DFlipFlop is
    Port ( 	D : in  STD_LOGIC;
			Reset : in  STD_LOGIC;
			Clock : in  STD_LOGIC;
			Qp : out  STD_LOGIC;
			Qn : out  STD_LOGIC);
end DFlipFlop;
architecture Behavioral of DFlipFlop is
signal tester: std_logic;
begin
	process(clock,reset)
	 begin
		if rising_edge(clock) then
			if reset='1' then 
				Qp<='0';
				Qn<='1';
			else
				Qp<=D;
				Qn<=not D;
			end if;
		end if;
	 end process;
end Behavioral;