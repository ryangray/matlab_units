% Unit newton 
% Converts number to internal units by multplying by it 
% Converts number into Newton by dividing value in internal units by it. 
% See also: KG, METER, SECOND

function newton = unit 

newton = kg * meter / second^2;
