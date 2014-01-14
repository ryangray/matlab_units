% prefix exbi = 2^60 (EXa BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: exa, kibi, mebi, gibi, tebi, pebi, zebi, yobi

function exbi = prefix 

exbi = unit_MAKE(2^60,'exbi','Ei');
