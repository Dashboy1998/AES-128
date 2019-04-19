library ieee;
use ieee.std_logic_1164.all; 
use work.rcon_table.all;
use work.data_types.all;

entity XKey is
	port(
		data: in std_logic_vector(127 downto 0); -- W0, W1, W2, W3
		sdata: out std_logic_vector(127 downto 0); -- W4, W5, W6, W7
		T: in word
		);
end entity;

architecture dataflow of XKey is  
	signal nKey: std_logic_vector(127 downto 0);
begin
	nKey( 31 downto  0) <= data( 31 downto  0) xor nKey( 63 downto 32); -- W7
	nKey( 63 downto 32) <= data( 63 downto 32) xor nKey( 95 downto 64); -- W6
	nKey( 95 downto 64) <= data( 95 downto 64) xor nKey(127 downto 96); -- W5
	nKey(127 downto 96) <= data(127 downto 96) xor T; -- W4
end architecture;