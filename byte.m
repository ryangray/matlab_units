% Unit byte 
% Converts number to internal units by multplying by it 
% Converts number into byte by dividing value in internal units by it. 
% See also: BIT, NIBBLE, KIBIBYTE, MEBIBYTE, GIBIBYTE, TEBIBYTE, PEBIBYTE, EXBIBYTE, ZEBIBYTE, YOBIBYTE

function byte = unit 

byte = 8 * bit; 
