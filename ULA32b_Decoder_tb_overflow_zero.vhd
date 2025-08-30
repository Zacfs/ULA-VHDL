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
        --Testes Overflow
        --Maior positivo + 1 (Overflow)
        e1 <= "01111111111111111111111111111111";
		e2 <= "00000000000000000000000000000001";
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
         --Menor Negativo - 1 (Overflow)
        e1 <="10000000000000000000000000000000";
		e2 <= "00000000000000000000000000000010";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Menor negativo - maior positivo (Overflow)
      	e1 <= "10000000000000000000000000000000";
		e2 <= "01111111111111111111111111111111";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Maior positivo - menor negativo (Overflow)
      	e2 <= "10000000000000000000000000000000";
		e1 <= "01111111111111111111111111111111";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Maior positivo - (-1) (Overflow)
      	e2 <= "11111111111111111111111111111111";
		e1 <= "01111111111111111111111111111111";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
		--Menor negativo + maior positivo (Sem Overflow)
      	e1 <= "10000000000000000000000000000000";
		e2 <= "01111111111111111111111111111111";
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Maior positivo + (-1) (Sem Overflow)
      	e2 <= "11111111111111111111111111111111";
		e1 <= "01111111111111111111111111111111";
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
		--Maior positivo + menor negativo (Sem Overflow)
      	e2 <= "10000000000000000000000000000000";
		e1 <= "01111111111111111111111111111111";
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        --Testes saída 0
      	e2 <= "11111111111111111111111111111111";
		e1 <= "11111111111111111111111111111111";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        e2 <= "01111111111111111111111111111111";
		e1 <= "01111111111111111111111111111111";
        a <='1';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        e2 <= "00000000000000000000000000000000";
		e1 <= "00000000000000000000000000000000";
        a <='0';
		b <= '1';
		c <= '0';
        wait for 1 ns;
        wait for 1 ns;
        e2 <= "00000000000000000000000000000000";
		e1 <= "00000000000000000000000000000000";
        a <='0';
		b <= '0';
		c <= '0';
        wait for 1 ns;
        e2 <= "00000000000000000000000000000000";
		e1 <= "00000000000000000000000000000001";
        a <='0';
		b <= '0';
		c <= '0';
        wait for 1 ns;
        e2 <= "00000000000000000000000000000000";
		e1 <= "00000000000000000000000000000001";
        a <='0';
		b <= '0';
		c <= '1';
        wait for 1 ns;
		wait;
	end process;
end tb;