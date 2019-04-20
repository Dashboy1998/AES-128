library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Sbox_Transformation.all; 
use work.std_int.all; 
use work.data_types.all;

entity sbox is
	port(
		data: in word;
		sdata: out word
		);
end entity;

architecture dataflow of sbox is
begin
	sdata( 7 downto    0) <= sbox_LUT(int(data(  7 downto   0)));
	sdata( 15 downto   8) <= sbox_LUT(int(data( 15 downto   8)));
	sdata( 23 downto  16) <= sbox_LUT(int(data( 23 downto  16)));
	sdata( 31 downto  24) <= sbox_LUT(int(data( 31 downto  24)));
end architecture;