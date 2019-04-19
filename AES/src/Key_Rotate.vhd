library ieee;
use ieee.std_logic_1164.all;

entity key_rotate is
	port(
		data: in std_logic_vector(31 downto 0);
		sdata: out std_logic_vector(31 downto 0)
		);
end entity;

architecture dataflow of key_rotate is
begin
	sdata <= data(23 downto 0) & data(31 downto 24);
end architecture;