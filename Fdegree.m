%% Unit Fdegree (Fahrenheit degree)
%
% The size of a Fahrenheit degree is the same as a Rankine degree. This is
% a change in temperature rather than a temperature which uses the same
% size degrees. Use degF for specifying a temperature in Fahrenheit.
%
% See also: Fdeg, Cdegree, Rdegree, Kdegree, degF

function F = Fdegree

F = unit_MAKE(5 / 9 * Cdegree, 'Fahrenheit degree', 'F°');
