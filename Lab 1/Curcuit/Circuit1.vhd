library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Curcuit1 is
    Port ( in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end Curcuit1;

architecture Behavioral of Curcuit1 is
begin
led<=(0=>(in0 and in1) and btn0,
		1=>(in0 xor in1) and btn1,
		2=>(in0 nor in1) and btn2,
		3=>(not in0) and btn3,
		4=>in0,
		5=>in1,
		others=>'0'
		);
end Behavioral;
