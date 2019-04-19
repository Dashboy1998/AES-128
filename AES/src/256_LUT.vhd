library ieee;
use ieee.std_logic_1164.all;

package LUT_array is
	type array_256 is array (0 to 255) of std_logic_vector(7 downto 0);
end LUT_array;