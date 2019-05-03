library ieee;
use ieee.std_logic_1164.all; 
use work.S_DataTypes.all;

entity Inv_Affine is
	port(
		A: in Byte;
		Z: out Byte
		);
end entity Inv_Affine;

architecture dataflow of Inv_Affine is
begin
	Z(7) <= A(6) xor A(4) xor A(1);
	Z(6) <= A(5) xor A(3) xor A(0);
	Z(5) <= A(7) xor A(4) xor A(2);
	Z(4) <= A(6) xor A(3) xor A(1);
	Z(3) <= A(5) xor A(2) xor A(0);
	Z(2) <= A(7) xor A(4) xor A(1) xor '1';
	Z(1) <= A(6) xor A(3) xor A(0);
	Z(0) <= A(7) xor A(5) xor A(2) xor '1';
end architecture dataflow;