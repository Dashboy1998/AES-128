library ieee;
use ieee.std_logic_1164.all; 
use work.data_types.all;
use work.mult_x.all;
use work.std_int.all;

entity MixColumns is
	port(
		r: in AWord;
		nR: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity MixColumns;

architecture dataflow of MixColumns is
	alias r00 is r(0)(31 downto 24);
	alias r10 is r(1)(31 downto 24);
	alias r20 is r(2)(31 downto 24);
	alias r30 is r(3)(31 downto 24);
	alias r01 is r(0)(23 downto 16);
	alias r11 is r(1)(23 downto 16);
	alias r21 is r(2)(23 downto 16);
	alias r31 is r(3)(23 downto 16);
	alias r02 is r(0)(15 downto  8);
	alias r12 is r(1)(15 downto  8);
	alias r22 is r(2)(15 downto  8);
	alias r32 is r(3)(15 downto  8);
	alias r03 is r(0)( 7 downto  0);
	alias r13 is r(1)( 7 downto  0);
	alias r23 is r(2)( 7 downto  0);
	alias r33 is r(3)( 7 downto  0);
	signal C: AAByte(0 to 3)(0 to 3);
begin
	-- First Row
	C(0)(0) <= M00(int(ED))(int(r00)) xor M01(int(ED))(int(r10)) xor M02(int(ED))(int(r20)) xor M03(int(ED))(int(r30));
	C(0)(1) <= M00(int(ED))(int(r01)) xor M01(int(ED))(int(r11)) xor M02(int(ED))(int(r21)) xor M03(int(ED))(int(r31));
	C(0)(2) <= M00(int(ED))(int(r02)) xor M01(int(ED))(int(r12)) xor M02(int(ED))(int(r22)) xor M03(int(ED))(int(r32));
	C(0)(3) <= M00(int(ED))(int(r03)) xor M01(int(ED))(int(r13)) xor M02(int(ED))(int(r23)) xor M03(int(ED))(int(r33));
	-- Second Row
	C(1)(0) <= M10(int(ED))(int(r00)) xor M11(int(ED))(int(r10)) xor M12(int(ED))(int(r20)) xor M13(int(ED))(int(r30));
	C(1)(1) <= M10(int(ED))(int(r01)) xor M11(int(ED))(int(r11)) xor M12(int(ED))(int(r21)) xor M13(int(ED))(int(r31));
	C(1)(2) <= M10(int(ED))(int(r02)) xor M11(int(ED))(int(r12)) xor M12(int(ED))(int(r22)) xor M13(int(ED))(int(r32));
	C(1)(3) <= M10(int(ED))(int(r03)) xor M11(int(ED))(int(r13)) xor M12(int(ED))(int(r23)) xor M13(int(ED))(int(r33));	
	-- Third Row
	C(2)(0) <= M20(int(ED))(int(r00)) xor M21(int(ED))(int(r10)) xor M22(int(ED))(int(r20)) xor M23(int(ED))(int(r30));
	C(2)(1) <= M20(int(ED))(int(r01)) xor M21(int(ED))(int(r11)) xor M22(int(ED))(int(r21)) xor M23(int(ED))(int(r31));
	C(2)(2) <= M20(int(ED))(int(r02)) xor M21(int(ED))(int(r12)) xor M22(int(ED))(int(r22)) xor M23(int(ED))(int(r32));
	C(2)(3) <= M20(int(ED))(int(r03)) xor M21(int(ED))(int(r13)) xor M22(int(ED))(int(r23)) xor M23(int(ED))(int(r33));
	-- Fourth Row
	C(3)(0) <= M30(int(ED))(int(r00)) xor M31(int(ED))(int(r10)) xor M32(int(ED))(int(r20)) xor M33(int(ED))(int(r30));
	C(3)(1) <= M30(int(ED))(int(r01)) xor M31(int(ED))(int(r11)) xor M32(int(ED))(int(r21)) xor M33(int(ED))(int(r31));
	C(3)(2) <= M30(int(ED))(int(r02)) xor M31(int(ED))(int(r12)) xor M32(int(ED))(int(r22)) xor M33(int(ED))(int(r32));
	C(3)(3) <= M30(int(ED))(int(r03)) xor M31(int(ED))(int(r13)) xor M32(int(ED))(int(r23)) xor M33(int(ED))(int(r33));
end architecture;