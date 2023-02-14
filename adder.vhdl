LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fa IS
	PORT (
		a, b, cin : IN STD_LOGIC;
		s, cout : OUT STD_LOGIC);
END fa;

ARCHITECTURE struct OF fa IS
BEGIN
	s <= a XOR b XOR cin;
	cout <= (a AND b) OR (b AND cin) OR (cin AND a);
END struct;