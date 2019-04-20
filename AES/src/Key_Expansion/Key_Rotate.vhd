library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity key_rotate is
	port(
		data: in word;
		sdata: out word
		);
end entity;

architecture dataflow of key_rotate is
begin
	sdata <= data(23 downto 0) & data(31 downto 24);
end architecture;