library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitRegister is
    Port ( 	input : in  STD_LOGIC_VECTOR (3 downto 0);
			output : out  STD_LOGIC_VECTOR (3 downto 0);
			S : in  STD_LOGIC_VECTOR (1 downto 0);
			reset : in  STD_LOGIC;
			clock : in  STD_LOGIC;
			sl : in STD_LOGIC;
			sr : in STD_LOGIC);
end FourBitRegister;

architecture Structural of FourBitRegister is
	component OneBitRegister
    Port ( 	Input : in  STD_LOGIC;
			Reset : in  STD_LOGIC;
			sl : in  STD_LOGIC;
			sr : in  STD_LOGIC;
			S : in STD_LOGIC_VECTOR (1 downto 0);
			Clock : in  STD_LOGIC;
			Output : out  STD_LOGIC);
	end component;
	signal RegisterOutput: std_logic_vector (3 downto 0);
	
begin
	OneBitRegister0: OneBitRegister Port Map(Input=>Input(0), Reset=>Reset, sl=>sl,					sr=>RegisterOutput(1), 	S=>S, Clock=>Clock, Output=>RegisterOutput(0));
	OneBitRegister1: OneBitRegister Port Map(Input=>Input(1), Reset=>Reset, sl=>RegisterOutput(0), 	sr=>RegisterOutput(2), 	S=>S, Clock=>Clock, Output=>RegisterOutput(1));
	OneBitRegister2: OneBitRegister Port Map(Input=>Input(2), Reset=>Reset, sl=>RegisterOutput(1), 	sr=>RegisterOutput(3), 	S=>S, Clock=>Clock, Output=>RegisterOutput(2));
	OneBitRegister3: OneBitRegister Port Map(Input=>Input(3), Reset=>Reset, sl=>RegisterOutput(2), 	sr=>sr,					S=>S, Clock=>Clock, Output=>RegisterOutput(3));
	Output<=RegisterOutput;
end Structural;