library ieee;
use ieee.std_logic_1164.all; 
use work.rcon_table.all;
use work.data_types.all;

entity XRCON is
	port(
		data: in word;
		sdata: out word;
		round: in nRound
		);
end entity;

architecture dataflow of XRCON is
begin
	sdata <= (rcon_LUT(round) xor data(31 downto 24)) & data(23 downto 0);
end architecture;