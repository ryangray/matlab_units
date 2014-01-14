% prefix zebi = 2^70 (ZEtta BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: zetta, kibi, mebi, gibi, tebi, pebi, exbi, yobi

function zebi = prefix

zebi = unit_MAKE(2^70,'zebi','Zi');
