library ieee;
use ieee.std_logic_1164.all; 
use work.S_DataTypes.all;

entity Affine is
	port(
		A: in Byte;
		Z: out Byte
		);
end entity Affine;

architecture dataflow of Affine is
begin
	Z(7) <= A(7) xor A(6) xor A(5) xor A(4) xor A(3);
	Z(6) <= A(6) xor A(5) xor A(4) xor A(3)	xor A(2) xor '1';
	Z(5) <= A(5) xor A(4) xor A(3) xor A(2) xor A(1) xor '1';
	Z(4) <= A(4) xor A(3) xor A(2) xor A(1) xor A(0);
	Z(3) <= A(7) xor A(3) xor A(2) xor A(1) xor A(0);
	Z(2) <= A(7) xor A(6) xor A(2) xor A(1) xor A(0);
	Z(1) <= A(7) xor A(6) xor A(5) xor A(1) xor A(0) xor '1';
	Z(0) <= A(7) xor A(6) xor A(5) xor A(4) xor A(0) xor '1';
end architecture dataflow;