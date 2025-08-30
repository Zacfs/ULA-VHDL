library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_misc.or_reduce;
entity ula32b is
	port(a,b : in std_logic_vector (32 downto 1);
	sel : in std_logic_vector (1 downto 0);
	cin,bInv : in std_logic;
	s : out std_logic_vector (32 downto 1);
	over, zero : out std_logic);
end ula32b;

architecture ulab of ula32b is
component ula is 
	port(a1, b1, c1 : in std_logic;
	bInv, cIn: in std_logic;
	sel : in std_logic_vector (1 downto 0);
	s, cout: out std_logic);
end component;

component ula_of is 
	port(a1, b1, c1 : in std_logic;
	bInv, cIn: in std_logic;
	sel : in std_logic_vector (1 downto 0);
	s, over, set: out std_logic);
end component;

signal carryOut : std_logic_vector(31 downto 1);
signal result : std_logic_vector(32 downto 1);
signal c,slt,rzero : std_logic;

begin
rzero<='0';
	c<='0';
	ula1 : ula
		port map(a1=>a(1),
		b1=>b(1),
		sel => sel,
		bInv => bInv,
		c1=>slt,
		cin=>cin,
		cout=>carryOut(1),
		s=>result(1));
		
	GenerateULA : for i in 2 to 31 generate
		mapa : ula
			port map(a1=>a(i),
			b1=>b(i),
			c1=>c,
			cin=> carryOut(i-1),
			cout=>carryOut(i),
			bInv => bInv,
			sel => sel,
            s=>result(i));
		end generate;

	ula32: ula_of
		port map(a1=>a(32),
		b1=>b(32),
		cin=>carryOut(31),
		c1=>c,
		bInv => bInv,
		over=>over,
        s=>result(32),
		set=>slt,
		sel => sel);
        s<=result;
      zero <= not or_reduce(result);
end ulab;