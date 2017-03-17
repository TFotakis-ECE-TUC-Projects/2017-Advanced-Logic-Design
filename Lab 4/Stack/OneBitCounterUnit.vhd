library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity OneBitCounterUnit is
    Port ( InputBit : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           UpDown : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Previous : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Clock : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end OneBitCounterUnit;
architecture Behavioral of OneBitCounterUnit is
	component DFlipFlop
		 Port ( D : in  STD_LOGIC;
				  Reset : in  STD_LOGIC;
				  Clock : in  STD_LOGIC;
				  Qp : inout  STD_LOGIC;
				  Qn : inout  STD_LOGIC);
	end component;

	component FourBitMultiplexer
		 Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
				  output : out  STD_LOGIC;
				  s : in  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	signal s0: std_logic;
	signal s1: std_logic;
	signal QpInternal: std_logic;
	signal QnInternal: std_logic;
	signal MuxOutput: std_logic;
begin
	s0<=Previous and Enable;
	s1<=Load;
	multiplexer: FourBitMultiplexer port map(input(0)=>QpInternal, input(1)=>QnInternal, input(2)=>InputBit, input(3)=>InputBit,output=>MuxOutput,s(0)=>s0,s(1)=>s1);
	FlipFlop: DFlipFlop port map (D=>MuxOutput,Reset=>Reset,Clock=>Clock,Qp=>QpInternal,Qn=>QnInternal);
	Output<=QpInternal;
end Behavioral;