-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity decoder is
	port(a,b,c : in std_logic;
	bInv,sel0,sel1 : out std_logic);
end decoder;

architecture decode of decoder is
begin
	bInv <= a;
	sel0 <= b;
	sel1 <= c;
end decode;