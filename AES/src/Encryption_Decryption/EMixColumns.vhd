library ieee;
use ieee.std_logic_1164.all; 
use work.data_types.all;

entity MixColumns is
	port(
		s: in AWord;
		r: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end entity MixColumns;

architecture dataflow of MixColumns is
begin
	
end architecture;