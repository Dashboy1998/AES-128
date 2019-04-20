SetActiveLib -work
comp -include "$dsn\src\Data_Types.vhd" 
comp -include "$dsn\src\Key_Expansion\Rcon_Table.vhd" 
comp -include "$dsn\src\Sbox_Transformation.vhd" 
comp -include "$dsn\src\int.vhd" 
comp -include "$dsn\src\Encryption_Decryption\Mult_Tables.vhd" 
comp -include "$dsn\src\Encryption_Decryption\EDRotate.vhd" 
comp -include "$dsn\src\Encryption_Decryption\Esbox.vhd" 
comp -include "$dsn\src\Encryption_Decryption\EMixColumns.vhd"  
comp -include "$dsn\src\Encryption_Decryption\Cryption.vhd" 
comp -include "$dsn\src\Encryption_Decryption\Cryption_Final.vhd" 
comp -include "$dsn\src\Key_Expansion\XKey.vhd" 
comp -include "$dsn\src\Key_Expansion\XRCON.vhd" 
comp -include "$dsn\src\Key_Expansion\sbox.vhd" 
comp -include "$dsn\src\Key_Expansion\Key_Rotate.vhd" 
comp -include "$dsn\src\Key_Expansion\KRound.vhd"  
comp -include "$dsn\src\Encryption_Decryption\CryptionRounds.vhd" 
comp -include "$dsn\src\Key_Expansion\KExpansion.vhd" 
comp -include "$dsn\src\AES.vhd" 
comp -include "$dsn\src\TestBench\aes_TB.vhd" 
asim +access +r TESTBENCH_FOR_aes 
wave 
wave -noreg data
wave -noreg key
wave -noreg ED
wave -noreg Xout
wave -noreg correct
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\aes_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_aes 
