library ieee;
use ieee.std_logic_1164.all;

entity and_2 is
	port(
	A: in std_logic;
	B: in std_logic;
	Z: out std_logic
	);
end entity and_2;

architecture dataflow of and_2 is
begin
	Z <= A and B;
end architecture dataflow;