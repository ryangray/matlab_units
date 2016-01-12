%% Unit poise (P) = 1 g/(cm*s)
% Unit of dynamic viscosity in the cgs system. SI uses pascal*second.
% unit_ALIASES aliases this as 'P'.
% See also: cP, Pa

function poise = unit 

poise = unit_MAKE(0.1*kg/m/s, 'poise', 'P');
