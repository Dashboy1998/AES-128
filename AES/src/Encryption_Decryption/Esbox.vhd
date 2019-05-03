library ieee;
library Sbox;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.std_int.all; 
use work.data_types.all;
use Sbox.all;

entity Esbox is
	port(
		data: in std_logic_vector(127 downto 0);
		sdata: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity;

architecture dataflow of Esbox is
component Sbox
	port(
		B: in Byte;
		I: in std_logic;
		S: out Byte
		);
end component Sbox;
begin
	SB: for i in 0 to 15 generate
		SBi: Sbox port map(data((i+1)*8-1 downto i*8), ED, sdata((i+1)*8-1 downto i*8));	
	end generate SB;
end architecture;