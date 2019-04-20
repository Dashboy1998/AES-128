library ieee;
use ieee.std_logic_1164.all;

entity EDRotate is
	port(
		s: in std_logic_vector(127 downto 0);
		r: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity EDRotate;

architecture dataflow of EDRotate is
	signal forward: std_logic_vector(127 downto 0);
	signal inverse: std_logic_vector(127 downto 0);
begin
	
end architecture;