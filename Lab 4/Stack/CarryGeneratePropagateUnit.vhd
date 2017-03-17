library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CarryGeneratePropagateUnit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0));
end CarryGeneratePropagateUnit;
architecture Behavioral of CarryGeneratePropagateUnit is
begin
	P(0) <= A(0) xor B(0);
	G(0) <= A(0) and B(0); 
	P(1) <= A(1) xor B(1);
	G(1) <= A(1) and B(1); 
	P(2) <= A(2) xor B(2);
	G(2) <= A(2) and B(2); 
	P(3) <= A(3) xor B(3);
	G(3) <= A(3) and B(3);
end Behavioral;