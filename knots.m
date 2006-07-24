% Unit knots (there is no 'knot' unit as it conflicts with a Matlab demo)
% Converts number to internal units by multplying by it 
% Converts number into knots by dividing value in internal units by it. 

function knots = unit 

knots = nmiles / hour;
