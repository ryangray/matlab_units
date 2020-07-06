%% Unit Kdegree (Kelvin degree)
%
% The size of a Kelvin degree is the same as Celcius degree. This is
% a change in temperature rather than a temperature which uses the same
% size degrees. Use degK for specifying a temperature in Kelvin.
%
% See also: Kdeg, Cdegree, Rdegree, Fdegree, degK

function K = Kdegree

K = unit_MAKE(unit_TEMPERATURE, 'kelvin', 'K');
