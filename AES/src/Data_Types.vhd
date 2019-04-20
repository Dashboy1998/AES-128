library ieee;
use ieee.std_logic_1164.all;

package data_types is
	-- AES-128 has 10 rounds, if you wish for more security you may increase it
	constant numRounds: natural range 10 to natural'high := 12; -- Change this to modify the number of roads
	subtype byte is std_logic_vector(7 downto 0);
	type AByte is array (natural range<>) of byte;
	type AAByte is array (natural range<>) of AByte;
	subtype word is std_logic_vector(31 downto 0);
	type AWord is array (0 to 3) of word;
	subtype nRound is natural range 0 to numRounds;
	type ARounds is array (0 to numRounds) of std_logic_vector(127 downto 0);
	function to_AWord(X: std_logic_vector(127 downto 0)) return AWord;
	function to_stdvect(X: AWord) return std_logic_vector;
end data_types;	   	 

package body data_types is
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
	
	function to_stdvect(X: AWord) 
	return std_logic_vector is
		variable Y: std_logic_vector(127 downto 0);
		alias S00 is X(0)(31 downto 24);
		alias S01 is X(1)(31 downto 24);
		alias S02 is X(2)(31 downto 24);
		alias S03 is X(3)(31 downto 24);
		alias S04 is X(0)(23 downto 16);
		alias S05 is X(1)(23 downto 16);
		alias S06 is X(2)(23 downto 16);
		alias S07 is X(3)(23 downto 16);
		alias S08 is X(0)(15 downto  8);
		alias S09 is X(1)(15 downto  8);
		alias S10 is X(2)(15 downto  8);
		alias S11 is X(3)(15 downto  8);
		alias S12 is X(0)( 7 downto  0);
		alias S13 is X(1)( 7 downto  0);
		alias S14 is X(2)( 7 downto  0);
		alias S15 is X(3)( 7 downto  0);
	begin
		Y := S00 & S01 & S02 & S03 & S04 & S05 & S06 & S07 & S08 & S09 & S10 & S11 & S12 & S13 & S14 & S15;
		return Y;
	end to_stdvect;
end package body data_types;
