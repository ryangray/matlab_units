% Unit slug
% Converts number to internal units by multplying by it 
% Converts number into slug by dividing value in internal units by it. 

function x = unit 

x = lbf / (foot/second^2); % f = m*a, (1 lbf) = (1 slug) * (1 ft/sec^2)

