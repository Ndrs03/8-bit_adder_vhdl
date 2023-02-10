library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_full_adder_tb is
end eight_bit_full_adder_tb;

architecture behavioral of eight_bit_full_adder_tb is
  component add8 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
  end component;

  signal a, b, sum : STD_LOGIC_VECTOR (7 downto 0);
  signal cin, cout : STD_LOGIC;

begin

  DUT: add8 port map (a, b, cin, sum, cout);

  process is
  begin
    a <= "10101010";
    b <= "01010101";
    cin <= '0';
    wait for 10 ns;

    a <= "00000000";
    b <= "01010101";
    cin <= '0';
    wait for 10 ns;

    a <= "00000000";
    b <= "00000000";
    cin <= '0';
    wait for 10 ns;

    a <= "00000101";
    b <= "00001010";
    cin <= '0';
    wait for 10 ns;
    
   
    wait;
  end process;

end behavioral;