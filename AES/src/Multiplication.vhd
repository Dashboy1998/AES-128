library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity multGF8 is
	port(
	A: in Byte;
	B: in Byte;
	Z: out Byte
	);
end entity multGF8;	

architecture dataflow of multGF8 is
	component stdVect_and_std
	port(
		A: in std_logic_vector;
		B: in std_logic;
		Z: out std_logic_vector
		);
	end component stdVect_and_std;
	signal C: Abyte (0 to 6);
	signal AB: Abyte (0 to 7);
	signal PC: Abyte (0 to 6);
begin
	AandB: for i in AB'range generate
		ABi: stdVect_and_std port map(A, B(i), AB(i));
	end generate AandB;
	PandC: for i in PC'range generate
		PCi: stdVect_and_std port map(P, C(i)(7), PC(i));
	end generate PandC;
	C(0) <= AB(7);
	C(1) <= (C(0)(6 downto 0) & C(0)(7)) xor PC(0) xor AB(6);
	C(2) <= (C(1)(6 downto 0) & C(1)(7)) xor PC(1) xor AB(5);
	C(3) <= (C(2)(6 downto 0) & C(2)(7)) xor PC(2) xor AB(4);
	C(4) <= (C(3)(6 downto 0) & C(3)(7)) xor PC(3) xor AB(3);
	C(5) <= (C(4)(6 downto 0) & C(4)(7)) xor PC(4) xor AB(2);
	C(6) <= (C(5)(6 downto 0) & C(5)(7)) xor PC(5) xor AB(1);
	Z <= (C(6)(6 downto 0) & C(6)(7)) xor PC(6) xor AB(0);
end architecture dataflow;