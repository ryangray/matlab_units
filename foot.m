% Unit foot 
% Converts number to internal units by multplying by it 
% Converts number into foot by dividing value in internal units by it. 
% See also: METER

function foot = unit

foot = 0.3048 * meter; % Clark's tables (exact value from 1 yard = 0.9144 m)

% foot = meter / 3.2808399; % CRC Chem. & Phys., 64th Ed.
