% Unit joule 
% Converts number to internal units by multplying by it 
% Converts number into joule by dividing value in internal units by it. 
% E (Joules) = m (kg) * c (m/s)^2

function joule = unit 

joule = newton * meter; % = kg*(m/s)^2
