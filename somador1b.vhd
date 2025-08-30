-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity somador1b is
	port( a : in std_logic;
	b : in std_logic;
	cin : in std_logic;
	soma : out std_logic;
	cout : out std_logic );
end somador1b;

architecture soma_and of somador1b is
component meio_somador is
	port( a : in std_logic;
	b : in std_logic;
	soma : out std_logic;
	cout : out std_logic );
end component;

signal S_primeira_soma : std_logic;
signal S_primeiro_carry : std_logic;
signal S_segundo_carry : std_logic;

begin
	somador1 : meio_somador
	port map(a=>a,b=>b,soma=>S_primeira_soma, cout=>S_primeiro_carry);
	somador2 : meio_somador
	port map(a=>S_primeira_soma,b=>cin,soma=>soma, cout=> S_segundo_carry);
	cout <= S_primeiro_carry or S_segundo_carry;
end soma_and;