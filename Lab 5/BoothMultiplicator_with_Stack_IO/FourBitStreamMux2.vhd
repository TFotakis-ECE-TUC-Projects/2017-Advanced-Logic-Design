library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitStreamMux2 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  S : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end FourBitStreamMux2;
architecture Structural of FourBitStreamMux2 is

	component TwoBitMultiplexer
    Port ( Input:	in  STD_LOGIC_VECTOR (1 downto 0);
           S:		in STD_LOGIC;
           Output:out  STD_LOGIC);
	end component;

begin
	TwoBitMultiplexer0: TwoBitMultiplexer Port Map (Input(0)=>A(0), Input(1)=>B(0), S=>S, Output=>Output(0));
	TwoBitMultiplexer1: TwoBitMultiplexer Port Map (Input(0)=>A(1), Input(1)=>B(1), S=>S, Output=>Output(1));
	TwoBitMultiplexer2: TwoBitMultiplexer Port Map (Input(0)=>A(2), Input(1)=>B(2), S=>S, Output=>Output(2));
	TwoBitMultiplexer3: TwoBitMultiplexer Port Map (Input(0)=>A(3), Input(1)=>B(3), S=>S, Output=>Output(3));
end Structural;