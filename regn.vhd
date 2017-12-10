LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regn IS
	GENERIC ( N	: integer:=11);
	PORT (I					: IN	SIGNED(N-1 DOWNTO 0);
			Q					: OUT	SIGNED(N-1 DOWNTO 0);
			Sel				: IN 	STD_LOGIC_VECTOR(2 downto 0);
			Clock, Reset	: IN 	STD_LOGIC
			);
END regn;

ARCHITECTURE Behavior OF regn IS

Signal SHR1, SHL1: 	SIGNED(N-1 DOWNTO 0);
Signal SHR2, SHL2: 	SIGNED(N-1 DOWNTO 0);
Signal MUXOUT, O:		SIGNED(N-1 DOWNTO 0);

BEGIN

	PROCESS (Clock, Reset)
	BEGIN
		
		IF (Reset = '1') THEN
			O <= (OTHERS => '0');
		ELSIF (Clock'EVENT AND Clock = '1') THEN
			O <= MUXOUT;
		END IF;
		
	END PROCESS;
	
	PROCESS(Sel, I, SHL1, SHL2, SHR1, SHR2, O)
	BEGIN
		
		case SEL is
				when "010" =>   MUXOUT <= I;
				when "110" =>   MUXOUT <= SHR1;
				when "111" =>   MUXOUT <= SHR2;
				when "100" =>   MUXOUT <= SHL1;
				when "101" =>   MUXOUT <= SHL2;
				when others =>  MUXOUT <= O;
		end case;
		
	END PROCESS;

Q <= O;
SHL1 <= SIGNED(O(N-2 downto 0) & '0');
SHR1 <= SIGNED(O(N-1) & O(N-1 downto 1));
SHL2 <= SIGNED(O(N-3 downto 0) & "00");
SHR2 <= SIGNED(O(N-1) & O(N-1) & O(N-1 downto 2));
END Behavior;
