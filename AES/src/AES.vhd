library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity AES is
	port(
		data: in std_logic_vector(127 downto 0);
		key: in std_logic_vector(127 downto 0);
		ED: in std_logic;
		Xout: out std_logic_vector(127 downto 0)
		);
end entity AES;

architecture dataflow of AES is
	component KExpansion is
		port(
			iKey: in std_logic_vector(127 downto 0);
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
	signal Keys: ARounds;
begin
	K: KExpansion port map(key, Keys);
	C: cryptionRounds port map(data, Keys, ED, Xout);
end architecture;