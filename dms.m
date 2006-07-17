% Convert dms to or from seconds
% Convert degrees, minutes, seconds of arc to a decimal angle in radians
% Usage: r = dms(dd.mmss)                     % if m & s are encoded in the decimal
%        r = dms(degrees, minutes)
%        r = dms(degrees, minutes, seconds)
% The first three forms are for angle values in degrees, not radians.
% The following form is for converting a radians ange to DMS form.
%        [d,m,s] = dms(r)   % return DMS components separately
% Future extensions could be to accept string forms of DMS like:
%   dd.mmss or dd°mm'ss"

function [angle, varargout] = dms (d, varargin)

if nargout == 3
    
    % Convert radian angle to d, m and s outputs
    
    dg = d / deg;
    angle = floor(dg);
    mn = 60 * (dg - angle);
    sc = 60 * (mn - floor(mn));
    varargout = {floor(mn), sc};
    
    
else
    
    % Decode dd.mmss in first argument
    
    ms = d - floor(d);
    mn = floor(ms * 100);
    sc = (ms * 100 - mn) * 100;
    
    angle = floor(d) * degrees + mn / 60 * deg + sc / 3600 * deg;

    % If more than one input, then first was just dd and the other were mm,ss
    
    if length(varargin) > 0

        angle = angle + varargin{1} / 60 * deg;

    end

    if length(varargin) > 1

        angle = angle + varargin{2} / 3600 * deg;

    end

end
