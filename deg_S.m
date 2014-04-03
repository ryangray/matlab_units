%% Unit deg_S (degrees latitude South)
% Represents degrees South latitude (equal to -deg)
% This is so you can be clear in lat/lon expressions such as:
%      a = lla2v(32*deg_S,60*deg_W);
% and not have to use negative constants.
%
% See also: deg_N, deg_E, deg_W, deg

function deg_S = unit 

deg_S = -deg;
