-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
entity ula32b_tb is
end ula32b_tb;

architecture tb of ula32b_tb is
component  ula32b_decoder is
	port(e1,e2 : in std_logic_vector (32 downto 1);
	a,b,c : in std_logic;
	s : out std_logic_vector (32 downto 1);
	over : out std_logic);
end component;

signal e1 : std_logic_vector (32 downto 1);
signal e2 : std_logic_vector (32 downto 1);
signal a,b,c :std_logic;
signal over :std_logic;
signal s : std_logic_vector (32 downto 1);

begin
	uut: ula32b_decoder 
		port map(
		e1=>e1,
		e2=>e2,
		a => a,
		b => b,
		c => c,
		s=>s,
		over=>over);
	
	tb1: process
		begin
        --Entradas
        e1 <= "11111111111111111111111111111111";
		e2 <= "11111111111111111111111111111111";
        --Teste AND
		a <='0';
		b <= '0';
		c <= '0';
        wait for 1 ns;
        --Teste OR
        a <='0';
		b <= '0';
		c <= '1';
        wait for 1 ns;
        --Teste ADD
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Teste SUB
        a <='1';
		b <= '1';
		c <= '0';
        --Teste Less
        wait for 1 ns;
        a <='1';
		b <= '1';
		c <= '1';
        wait for 1 ns;
		wait;
	end process;
end tb;