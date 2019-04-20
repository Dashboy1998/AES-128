library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity cryption is -- Used for encryption and decryption rounds 1 to N-1
	generic(round: nRound);
	port(
		data: in std_logic_vector(127 downto 0);
		key: in std_logic_vector(127 downto 0);
		ED: in std_logic;
		Xout: out std_logic_vector(127 downto 0)
		);
end entity cryption;

architecture dataflow of cryption is
component Esbox is
	port(
		data: in std_logic_vector(127 downto 0);
		sdata: out std_logic_vector(127 downto 0);
		ED: in std_logic
		);
end component Esbox;
component EDRotate is
	port(
		s: in std_logic_vector(127 downto 0);
		r: out AWord;
		ED: in std_logic
		);
end component EDRotate;
component MixColumns is
port(
	r: in AWord;
	nR: out std_logic_vector(127 downto 0);
	ED: in std_logic
	);
end component MixColumns;
signal sboxed: std_logic_vector(127 downto 0);
signal rotated: AWord;
signal mixed: std_logic_vector(127 downto 0);
begin
	S: Esbox port map(data, sboxed, ED);
	R: EDRotate port map(sboxed, rotated, ED);
	M: MixColumns port map(rotated, mixed, ED);	
	Xout <= mixed xor key;
end architecture;