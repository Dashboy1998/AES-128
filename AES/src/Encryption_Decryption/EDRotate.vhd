library ieee;
use ieee.std_logic_1164.all; 
use work.data_types.all;

entity EDRotate is
	port(
		s: in std_logic_vector(127 downto 0);
		r: out AWord;
		ED: in std_logic
		);
end entity EDRotate;

architecture dataflow of EDRotate is
	signal matrix: AWord; 
begin
	matrix <= to_AWord(s);
	process(matrix, ED)
	begin 
		for i in 0 to 3 loop -- Rows
			if(ED = '0') then -- Rotate left
				r(i) <= rol_Bytes(matrix(i), i);
			else -- Rotate right
				r(i) <= ror_Bytes(matrix(i), i);
			end if;
		end loop;	
	end process;
end architecture;