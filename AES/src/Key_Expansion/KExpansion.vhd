library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;

entity KExpansion is -- Entity for doing all key expansions
	port(
		iKey: in std_logic_vector(127 downto 0);
		ED: std_logic;
		nKey: out ARounds
		);
end KExpansion;

architecture dataflow of KExpansion is
	component KRound is
		generic( round: nRound );
		port(
			iKey: in std_logic_vector(127 downto 0);
			nKey: out std_logic_vector(127 downto 0)
			); 
	end component KRound;
	component MixColumns is
		port(
			r: in AWord;
			nR: out std_logic_vector(127 downto 0);
			ED: in std_logic
			);
	end component MixColumns;
	signal tKey: ARounds;
	signal dKey: ARounds; -- Decryption Keys
begin
	nKey <= tKey when ED = '0' else dKey; 
	tKey(0) <= iKey;
	GEN_KEYs: for i in 1 to numRounds generate
		Key2: if i = 1 generate
			K2: KRound generic map(round => i) port map(iKey, tKey(i));
		end generate Key2;
		
		KeyJ: if i > 1 generate
			KJ: KRound generic map(round => i) port map(tKey(i-1), tKey(i)); 
		end generate KeyJ;
	end generate GEN_KEYs;
	-- For Decryption Key
	dKey(0) <= tKey(numRounds);
	dKey(numRounds) <= tKey(0);
	GEN_INVKEYs: for i in 1 to numRounds - 1 generate
		M: MixColumns port map(to_AWord(tKey(numRounds-i)), dKey(i), '1');
	end generate GEN_INVKEYs;
	
end dataflow;