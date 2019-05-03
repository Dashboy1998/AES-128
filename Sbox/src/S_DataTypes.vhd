library ieee;
use ieee.std_logic_1164.all;

package S_DataTypes is	  
	subtype byte is std_logic_vector(7 downto 0);
	subtype hByte is std_logic_vector(3 downto 0);
end package S_DataTypes;
