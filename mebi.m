% prefix mebi = 2^20 (MEga BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: mega, kibi, gibi, tebi, pebi, exbi, zebi, yobi

function mebi = prefix 

mebi = unit_MAKE(2^20,'mebi','Mi');
