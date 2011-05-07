% Unit tonne (metric ton, t)
% Converts number to internal units by multplying by it 
% Converts number to it by dividing value in internal units by it. 
%
% Do not confuse with tonne_force, which is sometimes just referred to as
% tonne (t) like in rocket thrust.
%
% See also: kg, tonne_force

function tonne = unit 

tonne = 1000 * kg;
