library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity OneBitRegister is
    Port(	Input : in  STD_LOGIC;
			Reset : in  STD_LOGIC;
			sl : in  STD_LOGIC;
			sr : in  STD_LOGIC;
			S : in STD_LOGIC_VECTOR (1 downto 0);
			Clock : in  STD_LOGIC;
			Output : out  STD_LOGIC);
end OneBitRegister;

architecture Structural of OneBitRegister is

	component DFlipFlop
		Port (	D : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				Clock : in  STD_LOGIC;
				Qp : out  STD_LOGIC;
				Qn : out  STD_LOGIC);
	end component;
	
	component Mux4
		Port (	input : in  STD_LOGIC_VECTOR (3 downto 0);
				output : out  STD_LOGIC;
				s : in  STD_LOGIC_VECTOR (1 downto 0));
	end component;

	signal MuxOutput,QSignal: std_logic;
begin
	FlipFlop: DFlipFlop port map (D=>MuxOutput,Reset=>Reset,Clock=>Clock,Qp=>QSignal);
	Multiplexer: Mux4 port map (input(0)=>QSignal, input(1)=>sr, input(2)=>sl,input(3)=>Input, output=>MuxOutput, s=>S);
	Output<=QSignal;
end Structural;