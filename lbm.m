%% Unit lbm (pound mass) = 0.45359237 * kg (exact)
%
% The pound-mass is the mass that weighs 1 pound-force at 1g, and it
% is numericlly the same amount as the pound-force. 1 lbf = 1 lbm * 1g
% The proper english mass unit is the slug: 
%         1 lbf = 1 slug *      1 ft/s/s
% or      1 lbf = 1 lbm  * 32.174 ft/s/s
% This means that to get slugs from lbm, you have to multiply by the
% magnitude of g0 (without units) since:
%    1 lbf      = 1 slug * 1 ft/s/s
%    1 lbm * 1g = 1 slug * 1 ft/s/s
%    1 slug     = 1 lbm  * 1g / (1 ft/s/s)
%    1 slug     = 1 lbm  * (32.174 ft/s/s) / (1 ft/s/s)
%    1 slug     = 1 lbm  * 32.174
%
% See also: slug, kg, lbf, kgf, kgm

% However, if we implemented it as "x = slug/32.174", we would have to
% divide by the literal english magnitude of g0 (32.174...) to the
% precision needed to match the definition in g0.m, i.e., g0/(ft/s/s). So,
% here we use a different definition so we don't use a hard constant so
% things remain consistent.

function lbm = unit 

lbm = 0.45359237 * kg; % Exact
