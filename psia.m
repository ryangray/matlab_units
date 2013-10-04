%% psia (pounds force per square inch absolute [gauge + local atmospheric]) = lbf / inch^2
%% Unit of pressure
% We use "psia" rather than "psi" to not conflict with the MATLAB function.
%
% See also: pascal, kPa, Pa, atm, mmHg, torr

function psia = unit

psia = lbf / inch^2;
