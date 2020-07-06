%% Unit psia (pounds force per square inch absolute [gauge + local atmospheric])
%
% We use "psia" rather than "psi" to not conflict with the MATLAB function.
%
% See also: pascal, kPa, Pa, atm, mmHg, torr

function p = psia

p = unit_MAKE(lbf / inch^2, 'psi','psi');
