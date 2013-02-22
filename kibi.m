% prefix kibi = 2^10 (KIlo BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: mebi, gibi, tebi, pebi, exbi, zebi, yobi

function kibi = prefix 

kibi = unit_MAKE(2^10,'kibi','ki');
