% dms
% Convert degrees, minutes, seconds of arc to a decimal angle in radians
% Usage: dms(degrees)
%        dms(degrees, minutes)
%        dms(degrees, minutes, seconds)

function angle = dms (d, varargin)

angle = d * degrees;

if length(varargin) > 0
    
    angle = angle + varargin{1} / 60 * degrees;
    
end

if length(varargin) > 1
    
    angle = angle + varargin{2} / 3600 * degrees;
    
end

