%% Unit bytes (B)
%
% This function can also be used to obtain a string for displaying a value
% sensibly given its magnitude, e.g., if the value is >= 1MB and < 1GB, the
% value is displayed in MB.
%
% See also: byte

function by = bytes (b)

if nargin == 0
    
    by = byte;
    
else
    
    if b < byte
        
        s = b/bit;
        u = 'bits';
        
    elseif b < kibibyte
        
        s = b/byte;
        u = 'bytes';
        
    elseif b < mebibyte
        
        s = b / kibibyte;
        u = 'kiB';
        
    elseif b < gibibyte
        
        s = b / mebibyte;
        u = 'MiB';
        
    elseif b < tebibyte
        
        s = b / gibibyte;
        u = 'GiB';

    else
        
        s = b / tebibyte;
        u = 'TiB';
        
    end
    
    by = sprintf('%g %s', double(s), u);

end
