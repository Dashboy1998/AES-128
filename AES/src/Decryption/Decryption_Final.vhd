library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity decryption_final is -- Used for decryption rounds 1 to N-1
	port(
		data: in std_logic_vector(127 downto 0);
		key: in std_logic_vector(127 downto 0);
		Xout: out std_logic_vector(127 downto 0)
		);
end entity decryption_final;

architecture dataflow of decryption_final is
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
	signal sboxed: std_logic_vector(127 downto 0);
	signal rotated: AWord;
	signal rVect: std_logic_vector(127 downto 0); 
begin
	S: Esbox port map(data, sboxed, ED);
	R: EDRotate port map(sboxed, rotated, ED);
	rVect <= to_stdvect(rotated);
	Xout <= rVect xor key;	
end architecture;