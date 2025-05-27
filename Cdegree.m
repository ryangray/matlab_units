%% Unit Cdegree (Celcius degree)
%
% The size of a Celcius degree is the same as Kelvin degree. This is
% a change in temperature rather than a temperature which uses the same
% size degrees. Use degC for specifying a temperature in Celcius.
%
% See also: Cdeg, Rdegree, Kdegree, Fdegree, degC

function C = Cdegree

C = unit_MAKE(Kdegree, 'Celcius degree', 'C°');
