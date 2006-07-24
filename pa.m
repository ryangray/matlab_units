% Unit pa (Pascal)
% Converts number to internal units by multplying by it 
% Converts number into Pa by dividing value in internal units by it. 
% Note: There is no pascal.m in the units library because of the 
% Matlab Pascal matric function.
% See also: KPA

function pa = unit 

pa = newton / meter^2;
