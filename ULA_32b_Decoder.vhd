-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity ula32b_decoder is
	port(e1,e2 : in std_logic_vector (32 downto 1);
	a,b,c : in std_logic;
	s : out std_logic_vector (32 downto 1);
	over : out std_logic
	);
end ula32b_decoder;

architecture ulab of ula32b_decoder is
component decoder is
	port(a,b,c : in std_logic;
	bInv,sel0,sel1 : out std_logic);
end component;

component ula32b is
	port(a,b : in std_logic_vector (32 downto 1);
	sel : in std_logic_vector (1 downto 0);
	cin,bInv : in std_logic;
	s : out std_logic_vector (32 downto 1);
	over, zero : out std_logic);
end component;

signal Sinal_bInv_Cin : std_logic;
signal Sinal_Sel: std_logic_vector (1 downto 0);

begin
	dec : decoder
		port map(a=>a,
		b=>b,
		c=>c,
		bInv=>Sinal_bInv_Cin,
		sel0=>Sinal_Sel(1),
		sel1=>Sinal_Sel(0));

	ula : ula32b
		port map(a=>e1,
		b=>e2,
		sel=>Sinal_Sel,
		bInv=>Sinal_bInv_Cin,
		cin=>Sinal_bInv_Cin,
		s=>s,
		over=>over);
end ulab;