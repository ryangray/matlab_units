% prefix tebi = 2^40 (TEra BInary)
% Converts number to internal units by multplying by it 
% Converts number into this unit by dividing value in internal units by it. 
% See also: tera, kibi, mebi, gibi, tebi, pebi, exbi, zebi, yobi

function tebi = prefix 

tebi = unit_MAKE(2^40,'tebi','Ti');
