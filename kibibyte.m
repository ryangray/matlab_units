% Unit kibibyte = 2^10 (KIlo BInary byte - kilobyte = 1000 bytes)
% Converts number to internal units by multplying by it 
% Converts number into byte by dividing value in internal units by it. 
% See also: kB, kibi, byte, kilobyte

function kibibyte = unit 

kibibyte = kibi * byte; % 1024 * byte; 
