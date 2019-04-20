library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity AES is
	port(
		data: in std_logic_vector(127 downto 0);
		key: in std_logic_vector(127 downto 0);
		ED: in std_logic;
		Xout: out std_logic_vector(127 downto 0);
		Yout: out std_logic_vector(127 downto 0) -- Plain text
		);
end entity AES;

architecture dataflow of AES is
	component KExpansion is
		port(
			iKey: in std_logic_vector(127 downto 0);
			ED: in std_logic;
			nKey: out ARounds
			);
	end component KExpansion;
	component cryptionRounds is
		port(
			data: in std_logic_vector(127 downto 0);
			EKeys: in ARounds;
			ED: in std_logic;
			Xout: out std_logic_vector(127 downto 0)
			);
	end component cryptionRounds;
	component decryptionRounds is
		port(
			data: in std_logic_vector(127 downto 0);
			EKeys: in ARounds; 
			Xout: out std_logic_vector(127 downto 0)
			);
	end component decryptionRounds;
	signal Keys: ARounds;
begin
	K: KExpansion port map(key, ED, Keys);
	C: cryptionRounds port map(data, Keys, ED, Xout);
	D: decryptionRounds port map(data, Keys, Yout);
end architecture;