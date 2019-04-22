library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity multGF8 is
	port(
	A: in Byte;
	B: in Byte;
	Z: out Byte
	);
end entity multGF8;	

architecture dataflow of multGF8 is
	signal C: Abyte (0 to 6);
begin
	C(0) <= (A and B(0));
	C(1) <= ((C(0) rol 1) xor (P and C(0)(7))) xor (A and B(6));
	C(2) <= ((C(1) rol 1) xor (P and C(1)(7))) xor (A and B(5));
	C(3) <= ((C(2) rol 1) xor (P and C(2)(7))) xor (A and B(4));
	C(4) <= ((C(3) rol 1) xor (P and C(3)(7))) xor (A and B(3));
	C(5) <= ((C(4) rol 1) xor (P and C(4)(7))) xor (A and B(2));
	C(6) <= ((C(5) rol 1) xor (P and C(5)(7))) xor (A and B(1));
	Z <= ((C(6) rol 1) xor (P and C(6)(7))) xor (A and B(0));
end architecture dataflow;