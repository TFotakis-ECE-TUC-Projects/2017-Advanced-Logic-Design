library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux4 is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC);
end Mux4;
architecture Structural of Mux4 is
	component TwoBitMultiplexer is
    Port ( Input:	in  STD_LOGIC_VECTOR (1 downto 0);
           S:		in STD_LOGIC;
           Output:out  STD_LOGIC);
	end component;
	
	signal Mux2Output: std_logic_vector (1 downto 0);
begin
	Mux2First: 	TwoBitMultiplexer Port Map(Input=>Input(1 downto 0),S=>S(0),Output=>Mux2Output(0));
	Mux2Second: TwoBitMultiplexer Port Map(Input=>Input(3 downto 2),S=>S(0),Output=>Mux2Output(1));
	Mux2Third:	TwoBitMultiplexer Port Map(Input=>Mux2Output,		S=>S(1),Output=>Output);
end Structural;