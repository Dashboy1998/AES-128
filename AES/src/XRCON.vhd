library ieee;
use ieee.std_logic_1164.all; 
use work.rcon_table.all;

entity XRCON is
	port(
		data: in std_logic_vector(31 downto 0);
		sdata: out std_logic_vector(31 downto 0);
		round: in integer
		);
end entity;

architecture dataflow of XRCON is
begin
	sdata <= (rcon_LUT(round) xor data(31 downto 24)) & data(23 downto 0);
end architecture;