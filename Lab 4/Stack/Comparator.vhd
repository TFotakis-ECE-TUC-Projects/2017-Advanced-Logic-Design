library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Comparator is
    Port ( input : in  STD_LOGIC_VECTOR (4 downto 0);
           empty : out  STD_LOGIC;
           almostEmpty : out  STD_LOGIC;
           full : out  STD_LOGIC;
           almostFull : out  STD_LOGIC);
end Comparator;
architecture Structural of Comparator is
begin
	empty<=			not (input(4) or input(3) or input(2) or input(1) or input(0));
	almostEmpty<=	not (input(4) or input(3) or input(2) or input(1) or(not input(0)));
	full<=			(input(4) and input(3) and input(2) and input(1) and input(0));
	almostFull<=	(input(4) and input(3) and input(2) and input(1) and (not input(0)));
end Structural;