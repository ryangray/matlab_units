%% num2str for unitvals.
% This just casts the unitval to double, which really should be unitless or
% else you are assuming the base units since that's what teh value will
% appear as if you don't convert it.
%
%  s = num2str(x/km);
%
% See also: num2str

function s = num2str (p, varargin)

s = num2str(double(p), varargin{:});
