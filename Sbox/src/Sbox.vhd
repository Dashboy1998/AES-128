library ieee;
use ieee.std_logic_1164.all;
use work.S_DataTypes.all;

entity Sbox is
	port(
		B: in Byte;
		I: in std_logic;
		S: out Byte
		);
end entity Sbox;

architecture dataflow of Sbox is
	component Inv_Affine
		port(
			A: in Byte;
			Z: out Byte
			);
	end component Inv_Affine;
	component mult_inv
		port(
			B: in Byte;
			S: out Byte
			);
	end component mult_inv;	
	component Affine
		port(
			A: in Byte;
			Z: out Byte
			);
	end component Affine;
	signal from_invAT, to_invMult, from_invMult, from_AT: Byte;
begin
	iAT: Inv_Affine port map(B, from_invAT);
	to_invMult <= B when I = '0' else from_invAT;
	iMult: mult_inv port map(to_invMult, from_invMult);
	AT: Affine port map(from_invMult, from_AT);
	S <= from_AT when I = '0' else from_invMult;
end architecture dataflow;