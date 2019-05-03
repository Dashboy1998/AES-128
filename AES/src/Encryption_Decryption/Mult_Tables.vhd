--Package to hold multiplication tables & Mix Matrices
use work.data_types.all;

package mult_x is
	--Mix Matrices
	constant forwardMix: AAByte := (
	(X"02", X"03", X"01", X"01"),
	(X"01", X"02", X"03", X"01"),
	(X"01", X"01", X"02", X"03"),
	(X"03", X"01", X"01", X"02")
	);
	constant inverseMix : AAByte := (
	(X"0E", X"0B", X"0D", X"09"),	  
	(X"09", X"0E", X"0B", X"0D"),
	(X"0D", X"09", X"0E", X"0B"),
	(X"0B", X"0D", X"09", X"0E")
	);
end mult_x;