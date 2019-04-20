library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Sbox_Transformation.all; 
use work.std_int.all;

entity Esbox is
	port(
		data: in std_logic_vector(127 downto 0);
		sdata: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity;

architecture dataflow of Esbox is
begin
	sdata( 7 downto    0) <= sbox_and_Inv(int(ED))(int(data(  7 downto   0)));
	sdata( 15 downto   8) <= sbox_and_Inv(int(ED))(int(data( 15 downto   8)));
	sdata( 23 downto  16) <= sbox_and_Inv(int(ED))(int(data( 23 downto  16)));
	sdata( 31 downto  24) <= sbox_and_Inv(int(ED))(int(data( 31 downto  24)));
	sdata( 39 downto  32) <= sbox_and_Inv(int(ED))(int(data( 39 downto  32)));
	sdata( 47 downto  40) <= sbox_and_Inv(int(ED))(int(data( 47 downto  40)));
	sdata( 55 downto  48) <= sbox_and_Inv(int(ED))(int(data( 55 downto  48)));
	sdata( 63 downto  56) <= sbox_and_Inv(int(ED))(int(data( 63 downto  56)));
	sdata( 71 downto  64) <= sbox_and_Inv(int(ED))(int(data( 71 downto  64)));
	sdata( 79 downto  72) <= sbox_and_Inv(int(ED))(int(data( 79 downto  72)));
	sdata( 87 downto  80) <= sbox_and_Inv(int(ED))(int(data( 87 downto  80)));
	sdata( 95 downto  88) <= sbox_and_Inv(int(ED))(int(data( 95 downto  88)));
	sdata(103 downto  96) <= sbox_and_Inv(int(ED))(int(data(103 downto  96)));
	sdata(111 downto 104) <= sbox_and_Inv(int(ED))(int(data(111 downto 104)));
	sdata(119 downto 112) <= sbox_and_Inv(int(ED))(int(data(119 downto 112)));
	sdata(127 downto 120) <= sbox_and_Inv(int(ED))(int(data(127 downto 120)));
end architecture;