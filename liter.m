% Unit liter 
% Converts number to internal units by multplying by it 
% Converts number into liter by dividing value in internal units by it. 
% One cubic decimeter. Originally, the volume of 1kg of water at standard
% temperature and pressure, but now no longer part of SI, although accepted
% for use with SI. -- Wikipedia

function liter = unit 

liter = 1e-3 * meter^3; % exact definition
