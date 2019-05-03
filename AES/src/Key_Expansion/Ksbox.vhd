library ieee;
library Sbox;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.std_int.all;
use work.data_types.all;
use Sbox.all;

entity Ksbox is
	port(
		data: in word;
		sdata: out word
		);
end entity;

architecture dataflow of Ksbox is
	component Sbox 
		port(
			B: in Byte;
			I: in std_logic;
			S: out Byte
			);
	end component Sbox;
begin
	SB: for i in 0 to 3 generate
		SBi: Sbox port map(data((i+1)*8-1 downto i*8), '0', sdata((i+1)*8-1 downto i*8));	
	end generate SB;
end architecture;