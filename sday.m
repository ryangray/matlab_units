% Unit sday (sidereal day)
% Converts number to internal units by multplying by it 
% Converts number into day by dividing value in internal units by it. 

function x = unit 

% x = 23*hours + 56*minutes + 4.09074*seconds; 

x = day / (1 + 1 / 365.2425);
