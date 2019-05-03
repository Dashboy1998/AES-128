library ieee;
use ieee.std_logic_1164.all;
use work.S_DataTypes.all;

entity mult_GF4 is
	port(
		A: in hByte;	 
		B: in hByte;
		Z: out hByte
		);
end entity mult_GF4;

architecture dataflow of mult_GF4 is  
	component mult_GF2
		port(
			A: in std_logic_vector(1 downto 0);	 
			B: in std_logic_vector(1 downto 0);
			Z: out std_logic_vector(1 downto 0)
			);
	end component mult_GF2;	
	component mult_Const_GF2
		port(
			A: in std_logic_vector(1 downto 0);
			Z: out std_logic_vector(1 downto 0)
			);
	end component mult_Const_GF2;
	alias upperA: std_logic_vector(1 downto 0) is A(3 downto 2);
	alias lowerA: std_logic_vector(1 downto 0) is A(1 downto 0);
	alias upperB: std_logic_vector(1 downto 0) is B(3 downto 2);
	alias lowerB: std_logic_vector(1 downto 0) is B(1 downto 0); 
	alias upperZ: std_logic_vector(1 downto 0) is Z(3 downto 2);
	alias lowerZ: std_logic_vector(1 downto 0) is Z(1 downto 0);  
	signal Ax, Bx, sumU, sumL, sumX, MC: std_logic_vector(1 downto 0);
begin
	Ax <= upperA xor lowerA;
	Bx <= upperB xor lowerB;
	-- Sum of each upper hByte
	SH: mult_GF2 port map(upperA, upperB, sumU); 
	-- Sum of Ax and Bx
	SX: mult_GF2 port map(Ax, Bx, sumX); 
	-- Sum of each lower hByte
	SL: mult_GF2 port map(lowerA, lowerB, sumL); 
	-- Mult by constant
	PC: mult_Const_GF2 port map(sumU, MC);  
	upperZ <= sumL xor sumX;
	lowerZ <= sumL xor MC;
end architecture dataflow;