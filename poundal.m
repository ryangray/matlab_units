% Unit poundal
% Converts number to internal units by multplying by it 
% Converts number into lbm by dividing value in internal units by it. 
% See also: SLUG, LBM, LBF, FOOT, SECOND

function poundal = unit 

poundal = lbm * foot / second^2;
