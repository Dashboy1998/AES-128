library ieee;
use ieee.std_logic_1164.all; 
use work.data_types.all;

entity EDRotate is
	port(
		s: in std_logic_vector(127 downto 0);
		r: out AAByte(0 to 3)(0 to 3);
		ED: in std_logic
		);
end entity EDRotate;

architecture dataflow of EDRotate is
	signal forward: std_logic_vector(127 downto 0);
	signal inverse: std_logic_vector(127 downto 0);	
	signal tempR: AAByte(0 to 3)(0 to 3); 
begin
	tempR <= to_AAByte(s);
	process(tempR, ED)
	begin
		r(0) <= tempR(0);
		for j in 1 to 3 loop -- Rows
			if(ED = '0') then -- Rotate left
				
			else -- Rotate right
				
			end if;
		end loop;	
	end process;
end architecture;