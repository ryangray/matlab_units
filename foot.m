% Unit foot 
% Converts number to internal units by multplying by it 
% Converts number into foot by dividing value in internal units by it. 

function x = unit()

x = 0.3048 * meter; % Clark's tables (exact value from 1 yard = 0.9144 m)

% x = meters / 3.2808399; % CRC Chem. & Phys., 64th Ed.
