library ieee;
use ieee.std_logic_1164.all;		  		

entity mult_Const_GF2 is
	port(
	A: in std_logic_vector(1 downto 0);
	Z: out std_logic_vector(1 downto 0)
	);
end entity mult_Const_GF2;

architecture dataflow of mult_Const_GF2 is
begin
	Z(1) <= A(1) xor A(0);
	Z(0) <= A(1);
end architecture dataflow;