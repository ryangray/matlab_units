%% Unit Rdegree (Rankine degree)
%
% The size of a Rankine degree is the same as Fahrenheit degree. This is
% a change in temperature rather than a temperature which uses the same
% size degrees. Use degR for specifying a temperature in Rankine.
%
% See also: Rdeg, Cdegree, Kdegree, Fdegree, degR

function R = Rdegree

R = unit_MAKE(Fdegree, 'Rankine degree', 'R');

