% Unit thermochemical calorie
% Converts number to internal units by multplying by it 
% Converts number into calorie by dividing value in internal units by it. 
% The common nutritional calorie is really the kilo Table calorie
% See also: CALORIE, KCAL, JOULE, TABLE_CALORIE

function thermo_calorie = unit 

thermo_calorie =  4.184 * joule; % International thermochemical calorie from The Fifth International Conference on the Properties of Steam (London, July 1956)

