% Unit bytes 
% Converts number to internal units by multplying by it 
% Converts number into bytes by dividing value in internal units by it. 
% See also: byte

function bytes = unit (b)

if nargin == 0
    
    bytes = byte;
    
else
    
    if mod(b,8*bits) ~= 0
        
        s = b/bit;
        u = 'bits';
        
    elseif b < kb
        
        s = b/byte;
        u = 'bytes';
        
    elseif b < mb
        
        s = b / kb;
        u = 'kB';
        
    elseif b < gb
        
        s = b / mb;
        u = 'MB';
        
    elseif b < tb
        
        s = b / gb;
        u = 'GB';

    else
        
        s = b / tb;
        u = 'TB';
        
    end
    
    bytes = sprintf('%g %s', s, u);

end
