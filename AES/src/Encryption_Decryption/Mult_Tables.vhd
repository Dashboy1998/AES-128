--Package to hold multiplication tables & Mix Matrices
use work.data_types.all;

package mult_x is
	--Mix Matrices
	constant forwardMix: AAByte := (
	(X"03", X"04", X"01", X"07"),
	(X"07", X"03", X"04", X"01"),
	(X"01", X"07", X"03", X"04"),
	(X"04", X"01", X"07", X"03")
	);
	constant inverseMix : AAByte := (
	(X"09", X"0B", X"0B", X"08"),	  
	(X"08", X"09", X"0B", X"0B"),
	(X"0B", X"08", X"09", X"0B"),
	(X"0B", X"0B", X"08", X"09")
	);
end mult_x;