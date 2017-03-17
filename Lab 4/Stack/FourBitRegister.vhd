library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitRegister is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           load : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock : in  STD_LOGIC);
end FourBitRegister;

architecture Structural of FourBitRegister is

	component DFlipFlop
		Port (D : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				Clock : in  STD_LOGIC;
				Qp : out  STD_LOGIC;
				Qn : out  STD_LOGIC);
	end component;
	
	component TwoBitMultiplexer
		Port (input : in  STD_LOGIC_VECTOR (1 downto 0);
				output : out  STD_LOGIC;
				s : in  STD_LOGIC);
	end component;

	signal MuxOutput: std_logic_vector (3 downto 0);
	signal QSignal: std_logic_vector (3 downto 0);

begin
	FlipFlop0: DFlipFlop port map (D=>MuxOutput(0),Reset=>Reset,Clock=>Clock,Qp=>QSignal(0));
	FlipFlop1: DFlipFlop port map (D=>MuxOutput(1),Reset=>Reset,Clock=>Clock,Qp=>QSignal(1));
	FlipFlop2: DFlipFlop port map (D=>MuxOutput(2),Reset=>Reset,Clock=>Clock,Qp=>QSignal(2));
	FlipFlop3: DFlipFlop port map (D=>MuxOutput(3),Reset=>Reset,Clock=>Clock,Qp=>QSignal(3));
	
	Multiplexer0: TwoBitMultiplexer port map (input(0)=>QSignal(0), input(1)=>input(0), output=>MuxOutput(0), s=>load);
	Multiplexer1: TwoBitMultiplexer port map (input(0)=>QSignal(1), input(1)=>input(1), output=>MuxOutput(1), s=>load);
	Multiplexer2: TwoBitMultiplexer port map (input(0)=>QSignal(2), input(1)=>input(2), output=>MuxOutput(2), s=>load);
	Multiplexer3: TwoBitMultiplexer port map (input(0)=>QSignal(3), input(1)=>input(3), output=>MuxOutput(3), s=>load);
	
	output<=QSignal;
end Structural;