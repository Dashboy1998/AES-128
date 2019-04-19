library ieee;
use ieee.std_logic_1164.all; 
use work.rcon_table.all;
use work.data_types.all;

entity XKey is
	port(
		key: in std_logic_vector(127 downto 0); -- W0, W1, W2, W3
		nKey: out std_logic_vector(127 downto 0); -- W4, W5, W6, W7
		T: in word
		);
end entity;

architecture dataflow of XKey is  
begin
	nKey( 31 downto  0) <= key( 31 downto  0) xor nKey( 63 downto 32); -- W7
	nKey( 63 downto 32) <= key( 63 downto 32) xor nKey( 95 downto 64); -- W6
	nKey( 95 downto 64) <= key( 95 downto 64) xor nKey(127 downto 96); -- W5
	nKey(127 downto 96) <= key(127 downto 96) xor T; -- W4
end architecture;