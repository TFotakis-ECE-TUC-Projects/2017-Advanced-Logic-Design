library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Encoder is
    Port ( empty : in  STD_LOGIC;
           almostEmpty : in  STD_LOGIC;
           full : in  STD_LOGIC;
           almostFull : in  STD_LOGIC;
           stackOverflow : in  STD_LOGIC;
           additionOverflow : in  STD_LOGIC;
           Led : out  STD_LOGIC_VECTOR (3 downto 0));
end Encoder;
architecture Behavioral of Encoder is
begin
	process(empty,almostEmpty,full,almostFull,stackOverflow,additionOverflow)
		begin
			if additionOverflow='0' then
				if empty='1' then
					Led<="0000";
				elsif almostEmpty='1' then
					Led<="0010";
				elsif full='1' and stackOverflow='1' then
					Led<="1010";
				elsif almostFull='1' then
					Led<="1000";
				elsif full='1' then
					Led<="1110";
				else
					Led<="0000";
				end if;
			else
				if empty='1' then
					Led<="0001";
				elsif almostEmpty='1' then
					Led<="0011";
				elsif full='1' and stackOverflow='1' then
					Led<="1011";
				elsif almostFull='1' then
					Led<="1001";
				elsif full='1' then
					Led<="1111";
				else
					Led<="0001";
				end if;
			end if;
	end process;
end Behavioral;