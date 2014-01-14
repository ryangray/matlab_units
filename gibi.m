% prefix gibi = 2^30 (GIga BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: giga, kibi, mebi, tebi, pebi, exbi, zebi, yobi

function gibi = prefix 

gibi = unit_MAKE(2^30,'gibi','Gi');
