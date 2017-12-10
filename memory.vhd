LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY MEMORY IS
GENERIC ( memL	: INTEGER);
PORT (	CLOCK_50 : 		IN  STD_LOGIC;
			CS, WR, RD : 	IN  STD_LOGIC;
			D_IN : 			IN  SIGNED(7 downto 0);
			ADDRESS : 		IN  INTEGER RANGE 0 to memL;
			D_OUT : 			OUT SIGNED(7 downto 0)
);
END MEMORY;

ARCHITECTURE behavioural OF MEMORY IS

TYPE memory IS ARRAY (0 to memL) OF SIGNED(7 downto 0);
SIGNAL byte : memory;

BEGIN

-- Write enable - two processes are separated so write and read may either be enabled, disabled or one enabled and the
-- other disabled
PROCESS(CLOCK_50, CS, WR)
BEGIN

IF(CLOCK_50'EVENT AND CLOCK_50='1' AND CS='1' AND WR='1') THEN
	byte(ADDRESS) <= D_IN;
END IF;

END PROCESS;

-- Read enable
PROCESS(CS,RD,ADDRESS)
BEGIN
	
IF(CS='1' AND RD='1') THEN
	D_OUT <= byte(ADDRESS);
ELSE
	D_OUT <= "00000000";
END IF;

END PROCESS;

END behavioural;