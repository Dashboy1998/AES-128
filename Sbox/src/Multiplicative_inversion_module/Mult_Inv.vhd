library ieee;
use ieee.std_logic_1164.all;
use work.S_DataTypes.all;

entity mult_inv is
	port(
		B: in Byte;
		S: out Byte
		);
end entity mult_inv;				

architecture dataflow of mult_inv is
	component Isomorpic_Map_GF8
		port(
			A: in byte;	
			Z: out byte
			);
	end component Isomorpic_Map_GF8;   
	component Squarer_GF4
		port(
			A: in hByte;
			Z: out hByte
			);
	end component Squarer_GF4;
	component Mult_Const_GF4
		port(
			A: in hByte;
			Z: out hByte
			);
	end component Mult_Const_GF4;
	component mult_GF4
		port(
			A: in hByte;	 
			B: in hByte;
			Z: out hByte
			);
	end component mult_GF4;
	component mult_Inverse_GF4
		port(
			A: in hByte;
			Z: out hByte
			);
	end component mult_Inverse_GF4;
	component Inv_Isomorpic_Map_GF8 
		port(
			A: in byte;	
			Z: out byte
			);
	end component Inv_Isomorpic_Map_GF8;
	signal Iso, Mul: Byte;
	signal IsoX, Sq, MC, Mul1, XM, Mul2, Mul3, Inv: hByte; 
	alias uIso: hByte is Iso(7 downto 4);
	alias lIso: hByte is Iso(3 downto 0); 
	alias uMul: hByte is Mul(7 downto 4);
	alias lMul: hByte is Mul(3 downto 0);
	--alias lowerZ: std_logic_vector(1 downto 0) is Z(1 downto 0); 
begin
	Morp: Isomorpic_Map_GF8 port map(B, Iso);
	S2: Squarer_GF4 port map(uIso, Sq);
	MbC: Mult_Const_GF4 port map(Sq, MC);
	IsoX <= uIso xor lIso; -- XOR
	M1: mult_GF4 port map(IsoX, lIso, Mul1); -- Mul1
	XM <= Mul1 xor MC; -- XOR
	I: mult_Inverse_GF4 port map(XM, Inv); -- Inverse
	M2: mult_GF4 port map(uIso, Inv, uMul);-- Mul2
	M3: mult_GF4 port map(IsoX, Inv, lMul);-- Mul3
	IV: Inv_Isomorpic_Map_GF8 port map(Mul, S); -- InvIso
end architecture dataflow;