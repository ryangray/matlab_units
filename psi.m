% Unit psi (Pounds-force per square inch)
% Converts number to internal units by multplying by it 
% Converts number into psi by dividing value in internal units by it. 
% See also: KPA, PA, ATM, MMHG

function psi = unit 

psi = lbf / inch^2;

