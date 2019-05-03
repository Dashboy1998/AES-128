library ieee;
use ieee.std_logic_1164.all;		  		

entity mult_GF2 is
	port(
	A: in std_logic_vector(1 downto 0);	 
	B: in std_logic_vector(1 downto 0);
	Z: out std_logic_vector(1 downto 0)
	);
end entity mult_GF2;

architecture dataflow of mult_GF2 is
begin
	Z(1) <= (A(1) and B(1))	xor (A(0) and B(1)) xor (A(1) and B(0));
	Z(0) <= (A(1) and B(1))	xor (A(0) and B(0));
end architecture dataflow;