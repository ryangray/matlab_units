%% Unit slug (mass) = lbf/(ft/s^2)
%
% See also: lbm, kg, lbf

function s = slug

s = unit_MAKE(lbf / (foot/second^2), 'slug', 'slug'); % m = f/a, (1 lbf) = (1 slug) * (1 ft/sec^2)
