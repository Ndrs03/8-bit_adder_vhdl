LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY add8 IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		cin : IN STD_LOGIC;
		sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout : OUT STD_LOGIC);
END add8;

ARCHITECTURE struct OF add8 IS
	COMPONENT fa IS
		PORT (
			a, b, cin : IN STD_LOGIC;
			s, cout : OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL carry : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	u0 : fa PORT MAP(a(0), b(0), cin, sum(0), carry(0));
	u1 : fa PORT MAP(a(1), b(1), carry(0), sum(1), carry(1));
	u2 : fa PORT MAP(a(2), b(2), carry(1), sum(2), carry(2));
	u3 : fa PORT MAP(a(3), b(3), carry(2), sum(3), carry(3));
	u4 : fa PORT MAP(a(4), b(4), carry(3), sum(4), carry(4));
	u5 : fa PORT MAP(a(5), b(5), carry(4), sum(5), carry(5));
	u6 : fa PORT MAP(a(6), b(6), carry(5), sum(6), carry(6));
	u7 : fa PORT MAP(a(7), b(7), carry(6), sum(7), carry(7));

	cout <= carry(7);
END struct;

ARCHITECTURE add8_behave OF add8 IS
BEGIN
	PROCESS (a, b, cin)
		VARIABLE temp : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		temp := ('0' & a) + ('0' & b) + ('0' & '0' & '0' & '0' & '0' & '0' & '0' & cin); -- lägger till en '0' framför a och b vektorn innan addition ifall det blir overflow
		sum <= temp(7 DOWNTO 0);
		cout <= temp(8);
	END PROCESS;
END add8_behave;
--assert false report "Assignment statement not executed" severity error;   -- för att debbuga kod, klistra in och terminalen skriver om den stöter på linjen