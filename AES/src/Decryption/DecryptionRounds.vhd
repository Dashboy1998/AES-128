library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity decryptionRounds is -- Used for decryption rounds 1 to N-1
	port(
		data: in std_logic_vector(127 downto 0);
		EKeys: in ARounds; -- In order for encryption
		Xout: out std_logic_vector(127 downto 0)
		);
end entity decryptionRounds;

architecture dataflow of decryptionRounds is
	constant ED: std_logic:= '1';
	component decryption is
		port(
			data: in std_logic_vector(127 downto 0);
			key: in std_logic_vector(127 downto 0);
			Xout: out std_logic_vector(127 downto 0)
			);
	end component decryption;
	component decryption_final is
		port(
			data: in std_logic_vector(127 downto 0);
			key: in std_logic_vector(127 downto 0);
			Xout: out std_logic_vector(127 downto 0)
			);
	end component decryption_final;
	signal R: ARounds;
	signal Keys: ARounds; -- In order needed
begin
	Keys <= flip(EKeys);
	R(0) <= data xor Keys(0);
	
	Gen_R: for i in 1 to (numRounds - 1) generate
		C: decryption port map(R(i-1), Keys(i), R(i)); 	
	end generate;
	
	F: decryption_final port map(R(numRounds-1), Keys(numRounds), R(numRounds));
	Xout <= R(numRounds);
end architecture;