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
	signal tKey: std_logic_vector(127 downto 0);
begin  
	nKey <= tKey;
	tKey( 31 downto  0) <= key( 31 downto  0) xor tKey( 63 downto 32); -- W7
	tKey( 63 downto 32) <= key( 63 downto 32) xor tKey( 95 downto 64); -- W6
	tKey( 95 downto 64) <= key( 95 downto 64) xor tKey(127 downto 96); -- W5
	tKey(127 downto 96) <= key(127 downto 96) xor T; -- W4
end architecture;