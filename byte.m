%% Unit byte (B) 8 bits
%
% 'B' is supported by unit_ALIASES.
%
% See also: bit, nibble, kibibyte, mebibyte, gibibyte, tebibyte, pebibyte, exbibyte, zebibyte, yobibyte

function B = byte

B = unit_MAKE(8 * bit, 'byte', 'B'); 
