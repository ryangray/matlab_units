% Unit kgf (kilograms-force)
% Converts number to internal units by multplying by it 
% Converts number into kgf by dividing value in internal units by it. 
% The familiar conversion of kg = lb * 2.2 is actually kgf = lbf * 2.2
% kgf is the common usage of kilogram when speaking of weights, such as
% the fruit "weighs" 1 kilogram, but that really means that at 1g, 
% you have 1 kg mass of fruit that weighs 9.80665 Newtons.
% See also: KG, LBM, SLUG, LBF, KGM

function kgf = unit 

kgf = kg * g0; % f=m*a, or f=mg (standard g = g0)
