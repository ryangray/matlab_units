% prefix yobi = 2^80 (YOtta BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: yotta, kibi, mebi, gibi, tebi, pebi, exbi, zebi

function yobi = prefix 

yobi = unit_MAKE(2^80,'yobi','Yi');
