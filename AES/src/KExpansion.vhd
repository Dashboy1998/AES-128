library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity KExpansion is -- Entity for doing all key expansions
	port(
		iKey: in std_logic_vector(127 downto 0);
		nKey: out ARounds
		);
end KExpansion;

architecture dataflow of KExpansion is
	component KRound is
	port(
		iKey: in std_logic_vector(127 downto 0);
		nKey: out std_logic_vector(127 downto 0);
		round: in nRound
		); 
	end component KRound;
begin
	nKey(0) <= iKey;
	GEN_KEYs: for i in 1 to numRounds generate
		Key2: if i = 1 generate
			K2: KRound port map(iKey, nKey(i), i);
		end generate Key2;
			
		KeyJ: if i > 1 generate
			KJ: KRound port map(nKey(i-1), nKey(i), i); 
		end generate KeyJ;
	end generate GEN_KEYs;
end dataflow;