library ieee;
use work.rcon_table.all;
use ieee.std_logic_1164.all;
use work.Sbox_Transformation.all;
use work.data_types.all;

entity KRound is -- Entity for doing round of key expansion
	generic( round: nRound );
	port(
		iKey: in std_logic_vector(127 downto 0);
		nKey: out std_logic_vector(127 downto 0)
		);
end KRound;

architecture dataflow of KRound is
	component key_rotate is
		port(
			data: in word;
			sdata: out word
			);
	end component key_rotate;
	component sbox is
		port(
			data: in word;
			sdata: out word
			);
	end component;
	component XRCON is
		generic( round: nRound);
		port(
			data: in word;
			sdata: out word
			);
	end component XRCON;
	component XKey is
		port(
			key: in std_logic_vector(127 downto 0);
			nKey: out std_logic_vector(127 downto 0);
			T: in word
			); 
	end component XKey;
	signal W3: word;
	signal rW3: word;
	signal sW3: word;
	signal T: word;
begin  
	W3 <= iKey(31 downto 0);
	R: key_rotate port map(W3, rW3);	
	S: sbox port map(rW3, sW3);
	X: XRCON generic map(round => round) port map(sW3, T);
	K: XKey port map(iKey, nKey, T); 
end dataflow;