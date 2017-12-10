LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb IS
END tb;

ARCHITECTURE behavioural OF tb IS

COMPONENT lab6
PORT (	CLOCK_50 : 	IN STD_LOGIC;
			START : 		IN STD_LOGIC;
			DATA_IN : 	IN SIGNED(7 downto 0);
			DONE : 		OUT STD_LOGIC;
			DATA_OUT :  OUT SIGNED(7 downto 0)                    
);
END COMPONENT;

SIGNAL CLOCK_50, START, DONE: STD_LOGIC;
SIGNAL DATA_IN, DATA_OUT : SIGNED(7 downto 0);

BEGIN

test: lab6 PORT MAP(CLOCK_50, START, DATA_IN, DONE,DATA_OUT);

-- 1 ns Clock
PROCESS
BEGIN

CLOCK_50 <='0';
wait for 1 ns;

CLOCK_50 <='1';
wait for 1 ns;

END PROCESS;

-- Data generator
PROCESS
BEGIN

DATA_IN <="00000001";
wait for 2 ns;

DATA_IN <="00000010";
wait for 2 ns;

DATA_IN <="00000100";
wait for 2 ns;

DATA_IN <="10010100";
wait for 2 ns;

DATA_IN <="10000010";
wait for 2 ns;

DATA_IN <="10000001";
wait for 2 ns;

END PROCESS;

-- Start signal
PROCESS
BEGIN
START <='0';
wait for 5.5 ns;

START<='1';
wait for 1000 ns;

START <='0';
wait for 1000 ns;
END PROCESS;

END behavioural;
