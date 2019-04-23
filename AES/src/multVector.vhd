library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity multVector is
	port(
		A: in AByte;
		B: in AByte;
		Z: out Byte
		);
end entity multVector;

architecture dataflow of multVector is
	component multGF8 is
		port(
			A: in Byte;
			B: in Byte;
			Z: out Byte
			);
	end component multGF8;
	signal PP: AByte(0 to 3); -- Partial Products 
begin
	MP: for i in 0 to 3 generate
		PPi: multGF8 port map(A(i), B(i), PP(i));	
	end generate;
	
	Z <= PP(0) xor PP(1) xor PP(2) xor PP(3);
end architecture dataflow;
