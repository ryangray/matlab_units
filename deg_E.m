%% Unit deg_E (degrees longitude East)
% Represents degrees East longitude (equal to deg)
% This is so you can be clear in lat/lon expressions such as:
%      a = lla2v(32*deg_S,60*deg_W);
% and not have to use negative constants.
%
% See also: deg_N, deg_W, deg_S, deg

function d = deg_E

d = deg;
