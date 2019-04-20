library ieee;
use ieee.std_logic_1164.all;

package data_types is
	-- AES-128 has 10 rounds, if you wish for more security you may increase it
	constant numRounds: natural range 10 to natural'high := 12; -- Change this to modify the number of roads
	subtype byte is std_logic_vector(7 downto 0);
	type AByte is array (natural range<>) of byte;
	type AAByte is array (natural range<>) of AByte;
	subtype word is std_logic_vector(31 downto 0);
	subtype nRound is natural range 0 to numRounds;
	type ARounds is array (0 to numRounds) of std_logic_vector(127 downto 0);
	function to_AAByte(X: std_logic_vector(127 downto 0)) return AAByte;
end data_types;	   	 

package body data_types is
	function to_AAByte(X: std_logic_vector(127 downto 0)) 
	return AAByte is
	variable Y: AAByte(0 to 3)(0 to 3);
	begin
		Column: for j in 0 to 3 loop -- Columns
			Row: for i in 0 to 3 loop -- Rows
				Y(i)(j) := X((127-(j*8)-(i*32)) downto (120-(j*8)-(i*32)));
			end loop Row;
		end loop Column;
		return Y;
	end to_AAByte; 
end package body data_types;
