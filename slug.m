% Unit slug
% Converts number to internal units by multplying by it 
% Converts number into slug by dividing value in internal units by it. 
% See also: LBM, KG, LBF.

function slug = unit 

slug = lbf / (foot/second^2); % f = m*a, (1 lbf) = (1 slug) * (1 ft/sec^2)
