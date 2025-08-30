-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity meio_somador is
	port( a : in std_logic;
	b : in std_logic;
	soma : out std_logic;
	cout : out std_logic );
end meio_somador;

architecture meio_somador_arch of meio_somador is
begin
	soma <= (a and not b) or (not a and b);
	cout <= a and b;
end meio_somador_arch;