library ieee; 
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package std_int is
	function int(X: std_logic_vector) return integer;
	function int(X: std_logic) return integer;
end std_int;

package body std_int is
	function int(X: std_logic_vector) 
		return integer is	   
		variable Y : integer;
	begin
		Y := to_integer(unsigned(X));
		return Y;
	end int;
	
	function int(X: std_logic) 
		return integer is	   
		variable Y : integer;
	begin
		if(X = '1') then 
			Y := 1;
		else
			Y := 0;
		end if;
		return Y;
	end int;
end std_int;