library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FourBitFulladder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C3 : out  STD_LOGIC);
end FourBitFulladder;
architecture Structural of FourBitFulladder is
 component CarryGeneratePropagateUnit
   port(a,b : in std_logic_vector(3 downto 0);
		p,g : out std_logic_vector(3 downto 0));
 end component;

 component CarryLookAheadUnit
   port(p,g : in std_logic_vector(3 downto 0);
		cin : in std_logic ;
		c : out std_logic_vector(3 downto 0));
 end component;

 component SumUnit
   port(c : in std_logic_vector(2 downto 0);
		p : in std_logic_vector(3 downto 0);
		cin :in std_logic;
		s : out std_logic_vector(3 downto 0));
 end component;
 
 signal prop : std_logic_vector(3 downto 0);
 signal gener : std_logic_vector(3 downto 0); 
 signal car : std_logic_vector(2 downto 0);
 
begin
	CGP: CarryGeneratePropagateUnit port map(a=>A,b=>B,p=>prop,g=>gener);
	CLA: CarryLookAheadUnit port map(p=>prop,g=>gener,cin=>Cin,c(0)=>car(0),c(1)=>car(1),c(2)=>car(2),c(3)=>C3);
	Sumy: SumUnit port map(c=>car,p=>prop,cin=>Cin,s=>S);
end Structural;