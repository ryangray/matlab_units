% prefix pebi = 2^50 (PEta BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: peta, kibi, mebi, gibi, tebi, exbi, zebi, yobi

function pebi = prefix 

pebi = unit_MAKE(2^50,'pebi','Pi');
