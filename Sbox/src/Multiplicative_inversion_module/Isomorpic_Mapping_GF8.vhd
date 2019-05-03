library ieee;
use ieee.std_logic_1164.all;  
use work.S_DataTypes.all;

entity Isomorpic_Map_GF8 is
	port(
	A: in byte;	
	Z: out byte
	);
end entity Isomorpic_Map_GF8;

architecture dataflow of Isomorpic_Map_GF8 is
begin
	Z(7) <= A(7) xor A(5);
	Z(6) <= A(7) xor A(6) xor A(4) xor A(3) xor A(2) xor A(1);
	Z(5) <= A(7) xor A(5) xor A(3) xor A(2);
	Z(4) <= A(7) xor A(5) xor A(3) xor A(2) xor A(1);
	Z(3) <= A(7) xor A(6) xor A(2) xor A(1);
	Z(2) <= A(7) xor A(4) xor A(3) xor A(2) xor A(1);
	Z(1) <= A(6) xor A(4) xor A(1);
	Z(0) <= A(6) xor A(1) xor A(0);
end architecture dataflow;