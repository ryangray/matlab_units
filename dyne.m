%% Unit dyne (dyn) = cm*g/s^2
%
% The CGS unit of force.
%
% See also: newton, cm, gram, second

function d = dyne

d = unit_MAKE(gram * cm / second^2, 'dyne', 'dyn');
