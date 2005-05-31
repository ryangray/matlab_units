% Unit lbf (pounds-force)
% Converts number to internal units by multplying by it 
% Converts number into lbf by dividing value in internal units by it. 
% See also: LBM, SLUG, LBF, KGF, KGM

function lbf = unit 

lbf = 0.45359237 * kgf; % Exact from NIST
