library ieee;
use ieee.std_logic_1164.all; 
use work.rcon_table.all;
use work.data_types.all;

entity XKey is
	port(
		data: in word; -- W0, W1, W2, W3
		sdata: out word; -- W4, W5, W6, W7
		T: in word
		);
end entity;

architecture dataflow of XKey is  
	signal nKey: word;
begin
	nKey( 7 downto  0) <= data( 7 downto  0) xor nKey(15 downto  8); -- W7
	nKey(15 downto  8) <= data(15 downto  8) xor nKey(23 downto 16); -- W6
	nKey(23 downto 16) <= data(23 downto 16) xor nKey(31 downto 24); -- W5
	nKey(31 downto 24) <= data(31 downto 24) xor T; -- W4
end architecture;