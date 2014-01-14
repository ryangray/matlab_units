% Unit byte 
% Converts number to internal units by multplying by it 
% Converts number into byte by dividing value in internal units by it. 
% See also: bit, nibble, kibibyte, mebibyte, gibibyte, tebibyte, pebibyte, exbibyte, zebibyte, yobibyte

function byte = unit 

byte = unit_MAKE(8 * bit, 'byte', 'B'); 
