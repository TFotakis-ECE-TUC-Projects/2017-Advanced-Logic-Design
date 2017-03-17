library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DebounceUnit is
    Port (	Input : in  STD_LOGIC_VECTOR (2 downto 0);
				Reset : in 	STD_LOGIC;
				Clock : in 	STD_LOGIC;
				Output: out STD_LOGIC_VECTOR (2 downto 0));
end DebounceUnit;
architecture Structural of DebounceUnit is

	component debouncebutton
	Port (clk 	: in std_logic;
         rst 	: in std_logic;	
         input	: in std_logic;
         output: out std_logic);
	end component;

begin
	debounce0: debouncebutton Port Map(clk=>Clock,rst=>Reset,input=>Input(0),output=>Output(0));
	debounce1: debouncebutton Port Map(clk=>Clock,rst=>Reset,input=>Input(1),output=>Output(1));
	debounce2: debouncebutton Port Map(clk=>Clock,rst=>Reset,input=>Input(2),output=>Output(2));
end Structural;