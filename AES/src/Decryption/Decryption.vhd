library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity decryption is -- Used for decryption rounds 1 to N-1
	port(
		data: in std_logic_vector(127 downto 0);
		key: in std_logic_vector(127 downto 0);
		Xout: out std_logic_vector(127 downto 0)
		);
end entity decryption;

architecture dataflow of decryption is
	constant ED: std_logic:= '1';
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
	signal KR: std_logic_vector(127 downto 0);
	signal rVect: std_logic_vector(127 downto 0); 
	signal KRAWord: Aword;
begin
	S: Esbox port map(data, sboxed, ED);
	R: EDRotate port map(sboxed, rotated, ED);
	rVect <= to_stdvect(rotated);
	K: KR <= rVect xor key;	
	KRAWord <= to_AWord(KR);
	M: MixColumns port map(KRAWord, Xout, ED);
end architecture;