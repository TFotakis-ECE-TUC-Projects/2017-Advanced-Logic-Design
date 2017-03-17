library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CarryLookAheadUnit is
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           G : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end CarryLookAheadUnit;
architecture Behavioral of CarryLookAheadUnit is
	component andGate5
		Port (	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	
	component orGate5
		Port (	input : in  STD_LOGIC_VECTOR (4 downto 0);
				output : out  STD_LOGIC);
	end component;
	signal C0andGateOutput: std_logic;
	signal C1andGateOutput: std_logic_vector (1 downto 0);
	signal C2andGateOutput: std_logic_vector (2 downto 0);
	signal C3andGateOutput: std_logic_vector (3 downto 0);
begin
----------gnisio-----------------------------------------------------------------------
--	C(0)<=G(0) or (P(0) and Cin);
--	C(1)<=G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
--	C(2)<=G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
--	C(3)<=G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);
----------epe3ergasmeno----------------------------------------------------------------
	C0andGate0: andGate5 Port Map(input(0)=>P(0), input(1)=>Cin, input(4 downto 2)=>"111", output=>C0andGateOutput);
	C0orGate: 	orGate5  Port Map(input(0)=>G(0), input(1)=>C0andGateOutput, input(4 downto 2)=>"000", output=>C(0));
	
	C1andGate0: andGate5 Port Map(input(0)=>P(1), input(1)=>G(0), input(4 downto 2)=>"111", output=>C1andGateOutput(0));
	C1andGate1: andGate5 Port Map(input(0)=>P(1), input(1)=>P(0), input(2)=>Cin, input(4 downto 3)=>"11", output=>C1andGateOutput(1));
	C1orGate: 	orGate5  Port Map(input(0)=>G(1), input(2 downto 1)=>C1andGateOutput, input(4 downto 3)=>"00", output=>C(1));
	
	C2andGate0: andGate5 Port Map(input(0)=>P(2), input(1)=>G(1), input(4 downto 2)=>"111", output=>C2andGateOutput(0));
	C2andGate1: andGate5 Port Map(input(0)=>P(2), input(1)=>P(1), input(2)=>G(0), input(4 downto 3)=>"11", output=>C2andGateOutput(1));
	C2andGate2: andGate5 Port Map(input(0)=>P(2), input(1)=>P(1), input(2)=>P(0), input(3)=>Cin, input(4)=>'1', output=>C2andGateOutput(2));
	C2orGate: 	orGate5  Port Map(input(0)=>G(2), input(3 downto 1)=>C2andGateOutput, input(4)=>'0', output=>C(2));

	C3andGate0: andGate5 Port Map(input(0)=>P(3), input(1)=>G(2), input(4 downto 2)=>"111", output=>C3andGateOutput(0));
	C3andGate1: andGate5 Port Map(input(0)=>P(3), input(1)=>P(2), input(2)=>G(1), input(4 downto 3)=>"11", output=>C3andGateOutput(1));
	C3andGate2: andGate5 Port Map(input(0)=>P(3), input(1)=>P(2), input(2)=>P(1), input(3)=>G(0), input(4)=>'1', output=>C3andGateOutput(2));
	C3andGate3: andGate5 Port Map(input(0)=>P(3), input(1)=>P(2), input(2)=>P(1), input(3)=>P(0), input(4)=>Cin, output=>C3andGateOutput(3));
	C3orGate: 	orGate5  Port Map(input(0)=>G(3), input(4 downto 1)=>C3andGateOutput, output=>C(3));
end Behavioral;