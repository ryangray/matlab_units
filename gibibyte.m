% Unit gibibyte = 2^30 (GIga BInary byte - gigabytes is 10^9 bytes)
% Converts number to internal units by multplying by it 
% Converts number into it by dividing value in internal units by it. 
% See also: GB, byte, gibi, gigabyte

function gibibyte = unit 

gibibyte = gibi * byte; % 1024 * mebibyte; 
