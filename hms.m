% hms
% Usage: hms(time)
% Prints a time in hours, minutes, seconds as:
%     hh:mm:ss.sss
% If larger than one day, it is modded with 24*hours
%
% Usage: string = hms(time)
% Returns a string of the time it would print as above
%
% Usage: [h,m,s] = hms(time)
% Returns the time given broken into hours, minutes and seconds
% in the return variables.

function varargout = hms(time)

t = mod(time, day);

h = floor(t/hour);

t = mod(t, hour);

m = floor(t/minute);

t = mod(t, minute);

s = t;

hmsstring = sprintf('%02d:%02d:%06.3f', h, m, s);

if nargout == 0
    
    fprintf('%s\n', hmsstring);

elseif nargout == 1
    
    varargout{1} = hmsstring;
    
else
    
    varargout{1} = h;
    varargout{2} = m;
    varargout{3} = s;
    
end
