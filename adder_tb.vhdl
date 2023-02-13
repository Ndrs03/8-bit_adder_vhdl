LIBRARY IEEE;
USE work.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY add8_tb IS
END add8_tb;

ARCHITECTURE behave OF add8_tb IS
	SIGNAL a_in, b_in, s_behave, s_struct : STD_LOGIC_VECTOR(7 DOWNTO 0); -- skapar alla nödvändiga signaler
	SIGNAL c_in : STD_LOGIC := '0';
	SIGNAL cout_behave, cout_struct : STD_LOGIC;

BEGIN
	add8_0 : ENTITY work.add8(struct) PORT MAP (a_in, b_in, c_in, s_struct, cout_struct); -- kopplar dessa signaler till add8:s struct
	add8_1 : ENTITY work.add8(add8_behave) PORT MAP (a_in, b_in, c_in, s_behave, cout_behave); -- samma men för add8_behave istället

	PROCESS
		VARIABLE a_vector, b_vector : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	BEGIN -- process
		FOR a_vector IN 0 TO 255 LOOP -- prövar alla möjliga kombinationer av a och b, kommer dock inte hinna köra klart innan stop-time i makefile nås
			FOR b_vector IN 0 TO 255 LOOP
				a_in <= conv_std_logic_vector(a_vector, 8);
				b_in <= conv_std_logic_vector(b_vector, 8);
				WAIT FOR 1 ns;
			END LOOP; -- b_vector
		END LOOP; -- a_vector
	END PROCESS;

END behave;