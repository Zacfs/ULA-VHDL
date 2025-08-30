-- Code your architeture here
library IEEE;
use IEEE.std_logic_1164.all;
entity mux4x1 is
	port (e1, e2, e3, e4: in std_logic;
	sel : in std_logic_vector(1 downto 0);
	s: out std_logic);
end mux4x1;

architecture arch_mux4x1 of mux4x1 is
begin
	with sel select
	s <= e1 when "00",
	e2 when "01",
	e3 when "10",
	e4 when others;
end arch_mux4x1;