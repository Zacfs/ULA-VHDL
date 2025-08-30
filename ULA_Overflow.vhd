library IEEE;
use IEEE.std_logic_1164.all;
entity ula_of is 
port(a1, b1,c1 : in std_logic;
	 bInv, cIn: in std_logic;
	 sel : in std_logic_vector (1 downto 0);
	 s, over, set: out std_logic);
end ula_of;

architecture ulab of ula_of is
component somador1b is
	port(a : in std_logic;
		b : in std_logic;
		cin : in std_logic;
		soma : out std_logic;
		cout : out std_logic);
end component;

component mux4x1 is
	port (e1, e2, e3, e4: in std_logic;
	sel : in std_logic_vector(1 downto 0);
	s: out std_logic);
end component;

component mux2x1 is
	port (e1, e2, sel: in std_logic;
	s: out std_logic);
end component;

component overflow_det is
	port(a,b,c, bInv, cout : in std_logic;
	over: out  std_logic);
end component;

signal rSoma, sAnd, sOr, overf, sB, notB, cout : std_logic;
begin
	notB <= not b1;
	mux1 : mux2x1
		port map(e1 => b1,
		e2=>notB,
		sel => bInv,
		s => sB);


	somador : somador1b
		port map(a=>a1,
		b=>sB,
		cin=>cin,
		cout=>cout,
		soma=>rSoma);

	mux2 : mux4x1
		port map(e1=>sAnd,
		e2=>sOr,
		e3=>rSoma,
		e4=>c1,
		sel=>sel,
		s=>s);

	ofd : overflow_det
		port map( a =>a1,
		b=>sB,
		c=>rSoma,
		bInv=>bInv,
		cout=>cout,
		over=>overf);
		
	sAnd <= a1 and b1;
	sOr <= a1 or b1;
	over<=overf;
	set <= overf xor rSoma; --Retorna 1 se e1 < e2
end ulab;