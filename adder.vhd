LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity adder IS
	GENERIC ( N	: INTEGER:=11);
	PORT (A					: IN	SIGNED(N-1 DOWNTO 0);
			Z					: IN	SIGNED(N-1 DOWNTO 0);
			SUB				: IN 	STD_LOGIC;
			SUM				: OUT SIGNED(N-1 DOWNTO 0));
END adder;

Architecture howto of adder is


Signal S, B: 					      SIGNED(N-1 DOWNTO 0);
Signal c0, c1, c2, c3, c4: 		STD_LOGIC;
Signal c5, c6, c7, c8, c9, c10: 	STD_LOGIC;

component fulladder is
	port (a, b, ci			:	in  STD_LOGIC;
			co, s				:	out STD_LOGIC);
end component;


Begin


B <= Z XOR (SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB & SUB);

SUM <= S;

--overflow <= '1' when (to_integer(signed(s)) > 127) else
--				'0' when (to_integer(signed(s)) < 128);
--
--underflow <= '1' when (to_integer(signed(s)) < -128) else
--				 '0' when (to_integer(signed(s)) > -129);
--
--SUM <=   "00001111111" when overflow = '1' else
--			"00010000000" when underflow = '1' else
--			S when (overflow OR underflow) = '0';
--Signal overflow: 						STD_LOGIC;
--Signal underflow: 					STD_LOGIC;			 
FA0: fulladder port map(A(0), B(0), SUB, c0, S(0));
FA1: fulladder port map(A(1), B(1), c0, c1, S(1));
FA2: fulladder port map(A(2), B(2), c1, c2, S(2));
FA3: fulladder port map(A(3), B(3), c2, c3, S(3));
FA4: fulladder port map(A(4), B(4), c3, c4, S(4));
FA5: fulladder port map(A(5), B(5), c4, c5, S(5));
FA6: fulladder port map(A(6), B(6), c5, c6, S(6));
FA7: fulladder port map(A(7), B(7), c6, c7, S(7));
FA8: fulladder port map(A(8), B(8), c7, c8, S(8));
FA9: fulladder port map(A(9), B(9), c8, c9, S(9));
FA10: fulladder port map(A(10), B(10), c9, c10, S(10));

end howto;