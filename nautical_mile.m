% Unit nautical_mile
% Converts number to internal units by multplying by it 
% Converts number into nmiles by dividing value in internal units by it. 
% See also: NMILE, NMILES

function nautical_mile = unit 

nautical_mile = 1852 * meter; % International Nautical Mile, NIST
