library aes;
library ieee;
use ieee.std_logic_1164.all;
use aes.data_types.all;
use aes128Test.all;

	-- Add your library and packages declaration here ...

entity aes_tb is
end aes_tb;

architecture TB_ARCHITECTURE of aes_tb is
	-- Component declaration of the tested unit
	component aes
	port(
		data : in STD_LOGIC_VECTOR(127 downto 0);
		key : in STD_LOGIC_VECTOR(127 downto 0);
		ED : in STD_LOGIC;
		Xout : out STD_LOGIC_VECTOR(127 downto 0)
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal data : STD_LOGIC_VECTOR(127 downto 0);
	signal key : STD_LOGIC_VECTOR(127 downto 0);
	signal ED : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Xout : STD_LOGIC_VECTOR(127 downto 0);

	-- Add your code here ...
	signal correct: boolean;
begin

	-- Unit Under Test port map
	UUT : aes
		port map (
			data => data,
			key => key,
			ED => ED,
			Xout => Xout
		);

	-- Add your stimulus here ...
	process
	begin
		for i in tests'range loop -- Nth test
			key <= tests(i).key;
			-- Encryption
			ED <= '0';
			data <= tests(i).plain;
			wait for 10ns;
			correct <= (tests(i).expected = Xout);
			-- Decryption
			ED <= '1';
			data <= tests(i).expected;
			wait for 10ns;
			correct <= (tests(i).plain = Xout);
		end loop;
		wait for 10ns;
				assert false
		report "End of testing"
		severity failure;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_aes of aes_tb is
	for TB_ARCHITECTURE
		for UUT : aes
			use entity work.aes(dataflow);
		end for;
	end for;
end TESTBENCH_FOR_aes;

