library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity cryptionRounds is -- Used for encryption and decryption rounds 1 to N-1
	port(
		data: in std_logic_vector(127 downto 0);
		Keys: in ARounds; -- In order for encryption
		ED: in std_logic;
		Xout: out std_logic_vector(127 downto 0)
		);
end entity cryptionRounds;

architecture dataflow of cryptionRounds is
	component cryption is
		port(
			data: in std_logic_vector(127 downto 0);
			key: in std_logic_vector(127 downto 0);
			ED: in std_logic;
			Xout: out std_logic_vector(127 downto 0)
			);
	end component cryption;
	component cryption_final is
		port(
			data: in std_logic_vector(127 downto 0);
			key: in std_logic_vector(127 downto 0);
			ED: in std_logic;
			Xout: out std_logic_vector(127 downto 0)
			);
	end component cryption_final;
	signal R: ARounds;
begin
	R(0) <= data xor Keys(0);
	
	Gen_R: for i in 1 to (numRounds - 1) generate
		C: cryption port map(R(i-1), Keys(i), ED, R(i)); 	
	end generate;
	
	F: cryption_final port map(R(numRounds-1), Keys(numRounds), ED, R(numRounds));
	Xout <= R(numRounds);
end architecture;