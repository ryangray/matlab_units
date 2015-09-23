%% Unit poundal (pdl) = lbm * ft/s^2
%
% See also: newton, lbm, lbf, foot, second

function poundal = unit 

poundal = unit_MAKE(lbm * foot / second^2, 'poundal', 'poundal');
