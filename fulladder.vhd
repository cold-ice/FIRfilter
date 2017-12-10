library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port (a, b, ci		:	in  STD_LOGIC;
			co, s			:	out STD_LOGIC);
end fulladder;

architecture behavior of fulladder is

begin
		s	<=	(a XOR b XOR ci);
		co	<=	(a AND b) OR (a AND ci) OR (ci AND b);

end behavior;
