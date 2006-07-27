% Unit Volt
% Converts number to internal units by multplying by it 
% Converts number into volt by dividing value in internal units by it. 
% See also: WATT, AMPERE

function volt = unit 

volt = watt / ampere;
