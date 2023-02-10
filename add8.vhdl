LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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
    carry(0) <= cin;
    sum(0) <= a(0) XOR b(0) XOR carry(0);
    T_LABEL : FOR i IN 1 TO 7 GENERATE
        u1 : fa PORT MAP(a(i), b(i), carry(i - 1), sum(i), carry(i));
    END GENERATE;
    cout <= carry(7);
END struct;
