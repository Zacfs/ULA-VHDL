-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity overflow_det is
	port(a,b,c, bInv, cout : in std_logic;
	over: out  std_logic);
end overflow_det;

architecture detect of overflow_det is
begin
	over <= (a and not b and c and cout and bInv) or (not a and not b and cout and not bInv) or (not a and not b and c and not cout) or ( a and b and  not c and  not bInv) or ( a and b and not c and not bInv) or ( not a and b and c and cout) or ( a and b and not c and cout);
    --a~bcde + ~a~bd~e + ~a~bc~d + ab~c~e + ~abcd + ab~cd
    --((not a and not b and c) or ( a and b and not c));
end detect;
--Erro em subtrações (Corrigido)