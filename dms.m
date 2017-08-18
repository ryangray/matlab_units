%% Convert angle to or from dms form
% Usage: a = dms(dd.mmss)                     % Convert from DMS with m & s encoded in the decimal to radians.
%        a = dms(degrees, minutes)            % Convert from degrees & minutes (0 seconds) to radians.
%        a = dms(degrees, minutes, seconds)   % Convert from degrees, minutes and seconds to radians.
% The first three forms are for the "d" angle values in degrees, not radians.
% The following form is for converting a radians angle to DMS form.
%        [d,m,s] = dms(a)   % return DMS components separately
%        [d,m,s,D] = dms(a) % D output is in the d.mmss form.
% Negative angles produce negative values for d, m, s, and D (unless some are
% 0). For d, m, and s inputs, a negative value should have consistent sign
% (not including zero values), but this is not checked.

% Future extensions could be to accept string forms of DMS like:
%   dd.mmss or dd°mm'ss"

function [angle, varargout] = dms (d, varargin)

sgn = sign(d);
sgn(sgn == 0) = 1;
d = abs(d);

if nargout >= 3
    
    % Convert radian angle input d to degrees, minutes and seconds outputs
    
    dg = d / deg;
    angle = floor(dg);
    mn = 60 * (dg - angle);
    sc = 60 * (mn - floor(mn));
    mn = floor(mn);
    angle = sgn * angle;
    
    if nargout > 3
        % Add d.mmss output
        D = sgn * (angle + mn / 100 + sc / 10000);
        varargout = {sgn * mn, sgn * sc, D};
    else
        varargout = {sgn * mn, sgn * sc};
    end
    
else
    
    % If more than one input, then first was just dd and the other were mm,ss
    
    if ~isempty(varargin)

        mn = varargin{1};
        angle = (sgn * d + mn / 60) * deg;

        if length(varargin) > 1

            sc = varargin{2};
            angle = angle + sc / 3600 * deg;

        end

    else
        
        % Decode dd.mmss in first argument

        ms = d - floor(d);
        mn = floor(ms * 100);
        sc = (ms * 100 - mn) * 100;

        angle = sgn * (floor(d) + mn / 60 + sc / 3600) * deg;

    end

end
