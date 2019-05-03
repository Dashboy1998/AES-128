library ieee;
use ieee.std_logic_1164.all;
use work.S_DataTypes.all;

entity mult_Inverse_GF4 is
	port(
	A: in hByte;
	Z: out hByte
	);
end entity mult_Inverse_GF4;

architecture dataflow of mult_Inverse_GF4 is
begin
	Z(3) <= A(3) xor (A(3) and A(2) and A(1)) xor (A(3) and A(0)) xor A(2);
	Z(2) <= (A(3) and A(2) and A(1)) xor (A(3) and A(2) and A(0)) xor (A(3) and A(0)) xor A(2) xor (A(2) and A(1));
	Z(1) <= A(3) xor (A(3) and A(2) and A(1)) xor (A(3) and A(1) and A(0)) xor A(2) xor (A(2) and A(0)) xor A(1);
	Z(0) <= (A(3) and A(2) and A(1)) xor (A(3) and A(2) and A(0)) xor (A(3) and A(1)) xor (A(3) and A(1) and A(0)) xor (A(3) and A(0)) xor A(2) xor (A(2) and A(1)) xor (A(2) and A(1) and A(0)) xor A(1) xor A(0);
end architecture dataflow;
	