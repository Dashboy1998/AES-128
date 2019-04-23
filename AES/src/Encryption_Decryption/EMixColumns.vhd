library ieee;
use ieee.std_logic_1164.all; 
use work.data_types.all;
use work.mult_x.all;
use work.std_int.all; 
use work.mult_x.all;

entity MixColumns is
	port(
		r: in AWord;
		nR: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity MixColumns;

architecture dataflow of MixColumns is
	component multVector is
		port(
			A: in AByte;
			B: in AByte;
			Z: out Byte
			);
	end component multVector;
	signal rM: AAByte(0 to 3)(0 to 3);
	signal PP: AAByte(0 to 3)(0 to 3);
	signal Mix: AAByte(0 to 3)(0 to 3);
begin 
	Mix <= forwardMix when ED = '0' else inverseMix;
	rM <= to_AAByte(colMajorWord(r));
	Row: for i in 0 to 3 generate
		Column: for j in 0 to 3 generate
			Zij: multVector port map(Mix(i), rM(j), PP(i)(j));		
		end generate;
	end generate;
	nR <= 	  PP(0)(0) & PP(1)(0) & PP(2)(0) & PP(3)(0) 
			& PP(0)(1) & PP(1)(1) & PP(2)(1) & PP(3)(1) 
			& PP(0)(2) & PP(1)(2) & PP(2)(2) & PP(3)(2) 
			& PP(0)(3) & PP(1)(3) & PP(2)(3) & PP(3)(3);
end architecture;