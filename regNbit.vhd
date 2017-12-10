LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regNbit IS
	GENERIC ( N	: integer);
	PORT (I					: IN	SIGNED(N-1 DOWNTO 0);
			Q					: OUT	SIGNED(N-1 DOWNTO 0);
			EN					: IN 	STD_LOGIC;
			Clock, Reset	: IN 	STD_LOGIC
			);
END regNbit;

ARCHITECTURE Behavior OF regNbit IS

BEGIN

	PROCESS (Clock, EN, Reset)
	BEGIN
		IF(Clock='1' AND Clock'event) THEN
			IF(EN='1' AND Reset ='0') THEN
				Q <= I;
			ELSIF(Reset='1') THEN
				Q <= (others =>'0');
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;