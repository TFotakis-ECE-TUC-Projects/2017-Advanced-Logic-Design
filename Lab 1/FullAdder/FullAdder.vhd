library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
			  sum : out  STD_LOGIC
			 );
end FullAdder;

architecture structural of FullAdder is
signal cout1: std_logic;
signal sum1: std_logic;
signal cout2: std_logic;

component halfAdder
	port ( 
			a :in std_logic;
			b :in std_logic;
			cout :out std_logic;
			sum :out std_logic
	);
end component;

begin
	halfAdder1: halfAdder port map(a=>a,b=>b,cout=>cout1,sum=>sum1);
	halfAdder2: halfAdder port map(a=>sum1,b=>cin,cout=>cout2,sum=>sum);
	cout<=cout1 or cout2;
end structural;