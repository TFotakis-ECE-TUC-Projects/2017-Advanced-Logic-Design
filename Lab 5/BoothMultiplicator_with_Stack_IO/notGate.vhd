library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity notGate is
    Port ( input : in  STD_LOGIC;
           output : out  STD_LOGIC);
end notGate;
architecture Behavioral of notGate is
begin
   output<=not input;
end Behavioral;