% Unit Pa (Pascal)
% Converts number to internal units by multplying by it 
% Converts number into Pa by dividing value in internal units by it. 
% Note: There is no pascal.m in the units library because of the 
% Matlab Pascal matric function.
% See also: KPA

function Pa = unit 

Pa = Newton / meter^2;
