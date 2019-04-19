library ieee;
use work.rcon_table.all;
use ieee.std_logic_1164.all;
use work.Sbox_Transformation.all;

entity KeyExpansion is -- Entity for doing round 1 - 12 of key expansion
	port(
		iKey: in std_logic_vector(127 downto 0);
		nKey: out std_logic_vector(127 downto 0);
		round: in integer
		);
end KeyExpansion;

architecture dataflow of KeyExpansion is
	component key_rotate is
		port(
			data: in std_logic_vector(31 downto 0);
			sdata: out std_logic_vector(31 downto 0)
			);
	end component key_rotate;
	-- Sbox
	
	component XRCON is
		port(
			data: in std_logic_vector(31 downto 0);
			sdata: out std_logic_vector(31 downto 0);
			round: in integer
			);
	end component XRCON;
	component XKey is
		port(
			data: in std_logic_vector(31 downto 0);
			sdata: out std_logic_vector(31 downto 0);
			T: in std_logic_vector(31 downto 0)
			); 
	end component XKey;
	signal W3: std_logic_vector(31 downto 0);
	signal rW3: std_logic_vector(31 downto 0);
	signal sW3: std_logic_vector(31 downto 0);
	signal T: std_logic_vector(31 downto 0);
begin  
	W3 <= iKey(31 downto 0);
	R: key_rotate port map(W3, rW3);
	-- Sbox
	X: XRCON port map(sW3, T, round);
	-- XKey
	
end dataflow;