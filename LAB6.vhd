-- ULTIMO UPDATE: 12/06/2016 19:27 (Valerio)

-- Rimpiccioliti registri in input del datapath da 11 a 8 bit, aggiunto segnale di overflow con MUX in fondo al
-- DATAPATH

-- Aggiunti Generics (B) in Datapath, Control Unit e Memory per cambiare  velocemente il numero di bytes da gestire;
-- per cambiare numero di bytes basta cambiare il generic nell'entity LAB6.
-- Aggiunta la sequenza per fare uscire tutto il contenuto della memoria B;
-- Nel datapath ho riscritto l'if statement nel process del counter, dovrebbe funzionare in maniera identica a prima
-- (altrimenti non mi compilava).


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY LAB6 IS
GENERIC (memL : INTEGER:=5);
PORT (	CLOCK_50 : 	IN STD_LOGIC;
			START : 		IN STD_LOGIC;
			DATA_IN : 	IN SIGNED(7 downto 0);
			DONE : 		OUT STD_LOGIC;
			DATA_OUT :  OUT SIGNED(7 downto 0)                    
);
END LAB6;

ARCHITECTURE behavioural OF LAB6 IS

-- Quando CS e' alto, la memoria e' accessibile. Se WR e' alto, la memoria, al prossimo colpo di clock, si prende i bit in ingresso e li mette
-- nell'address che gli viene dato, altrimenti non prende niente.
-- Se RD e' alto la memoria fa uscire i byte immagazzinati nell'address che gli viene fornito, altrimenti esce
-- "00000000". Da notare che i byte in uscita partono subito, senza bisogno che il clock gli dia l'ok.
COMPONENT MEMORY
GENERIC ( memL	: INTEGER);
PORT (	CLOCK_50 : 		IN  STD_LOGIC;
			CS, WR, RD : 	IN  STD_LOGIC;
			D_IN : 			IN  SIGNED(7 downto 0);
			ADDRESS : 		IN  INTEGER RANGE 0 to memL;
			D_OUT : 			OUT SIGNED(7 downto 0)
);
END COMPONENT;

COMPONENT DATAPATH is
GENERIC ( memL	: INTEGER);
PORT (	CLOCK_50 : 				 IN  STD_LOGIC;
			EN_COUNTER : 			 IN  STD_LOGIC;
			CL : 						 IN  STD_LOGIC;
			X : 						 IN  SIGNED(7 downto 0);
			ADD_SUB :				 IN  STD_LOGIC;
			ADD_SEL :				 IN  STD_LOGIC_VECTOR(1 downto 0);
			SELdata :				 IN  STD_LOGIC;
			SEL:						 IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			Y : 						 OUT SIGNED(7 downto 0);
			ADDRTOMEM : 			 OUT INTEGER RANGE 0 to memL;
			COUNT_DONE : 			 OUT STD_LOGIC:='0'
);
END COMPONENT;

COMPONENT adder8bit IS
	GENERIC ( N	: INTEGER:=8);
	PORT (A					: IN	SIGNED(N-1 DOWNTO 0);
			B					: IN	SIGNED(N-1 DOWNTO 0);
			Cin				: IN 	STD_LOGIC;
			Cout				: OUT STD_LOGIC;
			S					: OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT CONTROL_UNIT
PORT (	CLOCK_50 : IN STD_LOGIC;
			START : IN STD_LOGIC;
			COUNT_DONE : IN STD_LOGIC;
			CS_A, WR_A, RD_A, CS_B, WR_B, RD_B : OUT STD_LOGIC;
			loadQ : OUT STD_LOGIC;
			CL : OUT STD_LOGIC;
			count : OUT STD_LOGIC;
			DONE : OUT STD_LOGIC;
			MUXIN : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			temp_command : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			sub : OUT STD_LOGIC;
			RESET : IN STD_LOGIC
);
END COMPONENT;


SIGNAL CS_A, WR_A, RD_A, CS_B, WR_B, RD_B: 	STD_LOGIC;
SIGNAL EN_COUNTER, COUNT_DONE, CL :		STD_LOGIC;
SIGNAL ADD_SUB, loadQ: STD_LOGIC;
SIGNAL ADD_SEL: STD_LOGIC_VECTOR(1 DOWNTO 0); 
SIGNAL SEL: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ADDRESS : 	INTEGER RANGE 0 to memL;
SIGNAL X, Y : 	SIGNED(7 downto 0);

BEGIN

MEM_A: memory 			GENERIC MAP(memL => memL)
							PORT MAP(CLOCK_50, CS_A, WR_A, RD_A, DATA_IN, ADDRESS,X);
							
MEM_B: memory 			GENERIC MAP(memL => memL)
							PORT MAP(CLOCK_50, CS_B, WR_B, RD_B, Y, ADDRESS, DATA_OUT);
							
CU: control_unit 		PORT MAP(CLOCK_50, START, COUNT_DONE, CS_A, WR_A, RD_A, CS_B, WR_B, RD_B, loadQ, CL, EN_COUNTER, DONE, ADD_SEL, SEL, ADD_SUB, '0');

DP: datapath 			GENERIC MAP(memL => memL)
							PORT MAP(CLOCK_50, EN_COUNTER, CL, X, ADD_SUB, ADD_SEL, loadQ, SEL, Y, ADDRESS, COUNT_DONE);

END behavioural;