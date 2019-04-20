library ieee;
use ieee.std_logic_1164.all;

package data_types is  
	constant numRounds: natural range 1 to natural'high := 12; -- Change this to modify the number of roads
	type array_256 is array (0 to 255) of std_logic_vector(7 downto 0);
	type array_512 is array (0 to 1) of array_256;
	subtype word is std_logic_vector(31 downto 0);
	subtype nRound is natural range 1 to numRounds;
	type ARounds is array (1 to numRounds) of std_logic_vector(127 downto 0);
end data_types;	   
