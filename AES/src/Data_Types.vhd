library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

package data_types is 
	-- AES-128 has 10 rounds
	constant numRounds: natural range 10 to natural'high := 10; -- Change this to modify the number of roads
	-- Irreducible Polynomial
	constant irrP: std_logic_vector(8 downto 0):= "100011011";	-- x^8 + x^7 + x^6 + x^5 + x^4 + x^3 + x^2 + x + 1
	constant P: std_logic_vector(7 downto 0):= irrP(7 downto 1) & "0"; -- x^7 + x^6 + x^5 + x^4 + x^3 + x^2 + x
	subtype byte is std_logic_vector(7 downto 0);
	type AByte is array (natural range<>) of byte;
	type AAByte is array (natural range<>) of AByte;
	subtype word is std_logic_vector(31 downto 0);
	type AWord is array (0 to 3) of word;
	subtype nRound is natural range 0 to numRounds;
	type ARounds is array (0 to numRounds) of std_logic_vector(127 downto 0);
	function flip(X: ARounds) return ARounds;
	function to_AWord(X: std_logic_vector(127 downto 0)) return AWord;
	function to_stdvect(r: AAByte) return std_logic_vector;
	function to_stdvect(r: AWord) return std_logic_vector;
	function rol_Bytes(X: word; r: natural) return word;
	function ror_Bytes(X: word; r: natural) return word;
	function colMajorWord(r: AWord) return AWord;
	function to_AAByte(r: AWord) return AAByte;
	function "and"(X: std_logic_vector; Y: std_logic) return std_logic_vector;
end data_types;	   	 

package body data_types is
	function flip(X: ARounds) 
		return ARounds is
		variable Y: ARounds;
	begin
		for i in X'range loop
			Y(X'right - i):= X(i);
		end loop;
		return Y;
	end flip;
	
	function to_AWord(X: std_logic_vector(127 downto 0))
		return AWord is
		variable Y: AWord;
		alias S00 is X(127 downto 120);
		alias S01 is X(119 downto 112);
		alias S02 is X(111 downto 104);
		alias S03 is X(103 downto  96);
		alias S04 is X( 95 downto  88);
		alias S05 is X( 87 downto  80);
		alias S06 is X( 79 downto  72);
		alias S07 is X( 71 downto  64);
		alias S08 is X( 63 downto  56);
		alias S09 is X( 55 downto  48);
		alias S10 is X( 47 downto  40);
		alias S11 is X( 39 downto  32);
		alias S12 is X( 31 downto  24);
		alias S13 is X( 23 downto  16);
		alias S14 is X( 15 downto   8);
		alias S15 is X(  7 downto   0);
	begin
		Y(0) := S00 & S04 & S08 & S12;
		Y(1) := S01 & S05 & S09 & S13;
		Y(2) := S02 & S06 & S10 & S14;
		Y(3) := S03 & S07 & S11 & S15;
		return Y;
	end to_AWord;
	
	function to_stdvect(r: AAByte) 
		return std_logic_vector is
		variable Y: std_logic_vector(127 downto 0);
		alias r00 is r(0)(0);
		alias r10 is r(1)(0);
		alias r20 is r(2)(0);
		alias r30 is r(3)(0);
		alias r01 is r(0)(1);
		alias r11 is r(1)(1);
		alias r21 is r(2)(1);
		alias r31 is r(3)(1);
		alias r02 is r(0)(2);
		alias r12 is r(1)(2);
		alias r22 is r(2)(2);
		alias r32 is r(3)(2);
		alias r03 is r(0)(3);
		alias r13 is r(1)(3);
		alias r23 is r(2)(3);
		alias r33 is r(3)(3);
	begin
		Y := r00 & r10 & r20 & r30 & r01 & r11 & r21 & r31 & r02 & r12 & r22 & r32 & r03 & r13 & r23 & r33;
		return Y;
	end to_stdvect;
	
	function to_stdvect(r: AWord) 
		return std_logic_vector is
		variable Y: std_logic_vector(127 downto 0);
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
	begin
		Y := r00 & r10 & r20 & r30 & r01 & r11 & r21 & r31 & r02 & r12 & r22 & r32 & r03 & r13 & r23 & r33;
		return Y;
	end to_stdvect;
	
	function rol_Bytes(X: word; r: natural) 
		return word is
	begin
		return std_logic_vector(unsigned(X) rol (r * 8));
	end rol_Bytes;
	
	function ror_Bytes(X: word; r: natural) 
		return word is
	begin
		return std_logic_vector(unsigned(X) ror (r * 8));
	end ror_Bytes;
	
	function colMajorWord(r: AWord) 
		return AWord is 
		variable Z: AWord;
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
	begin
		Z(0) := r00 & r10 & r20 & r30;
		Z(1) := r01 & r11 & r21 & r31;
		Z(2) := r02 & r12 & r22 & r32;
		Z(3) := r03 & r13 & r23 & r33;
		return Z;
	end colMajorWord; 
	
	function to_AAByte(r: AWord) 
		return AAByte is
		variable Z: AAByte(0 to 3)(0 to 3);
	begin
		Z(0)(0) := r(0)(31 downto 24);
		Z(1)(0) := r(1)(31 downto 24);
		Z(2)(0) := r(2)(31 downto 24);
		Z(3)(0) := r(3)(31 downto 24);
		Z(0)(1) := r(0)(23 downto 16);
		Z(1)(1) := r(1)(23 downto 16);
		Z(2)(1) := r(2)(23 downto 16);
		Z(3)(1) := r(3)(23 downto 16);
		Z(0)(2) := r(0)(15 downto  8);
		Z(1)(2) := r(1)(15 downto  8);
		Z(2)(2) := r(2)(15 downto  8);
		Z(3)(2) := r(3)(15 downto  8);
		Z(0)(3) := r(0)( 7 downto  0);
		Z(1)(3) := r(1)( 7 downto  0);
		Z(2)(3) := r(2)( 7 downto  0);
		Z(3)(3) := r(3)( 7 downto  0);
		return Z;
	end to_AAByte;
	function "and"(X: std_logic_vector; Y: std_logic) 
		return std_logic_vector	is
		variable Z: std_logic_vector(X'range);
	begin		 
		for i in X'range loop
			Z(i) := X(i) and Y;
		end loop;
		return Z;
	end "and";
end package body data_types;
