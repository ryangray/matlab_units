% Unit kPa (kilo Pascals)
% Converts number to internal units by multplying by it 
% Converts number into kPa by dividing value in internal units by it. 
% Note: There is no pascal.m in the units library because of the 
% Matlab Pascal matric function.
% See also: PA

function kPa = unit 

kPa = kilo * Pa;
