% Unit mebibyte 2^20 (MEga BInary byte - megabytes is 10^6 bytes)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: MEBI, BYTE, MEGABYTE

function mebibyte = unit 

mebibyte = mebi * byte; % 1024 * kibibyte; 
