LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY DFF IS
PORT (	CLOCK_50 : 	IN  STD_LOGIC;
			EN : 			IN  STD_LOGIC;
			CL : 			IN  STD_LOGIC;
			D : 			IN  STD_LOGIC_VECTOR(7 downto 0);
			Q : 			OUT STD_LOGIC_VECTOR(7 downto 0)
);
END DFF;

ARCHITECTURE behavioural OF DFF IS

BEGIN

	PROCESS(CLOCK_50, EN, CL)
	BEGIN

		IF(CLOCK_50='1' AND EN='1' AND CL='0') THEN
			Q <= D;
		ELSIF(CLOCK_50='1' AND CL='1') THEN
			Q <= (others => '0');
		END IF;

	END PROCESS;

END behavioural;