% Unit psia = pounds force per square inch absolute (gauge + local atmospheric)
% Converts number to internal units by multplying by it 
% Converts number into mmhg by dividing value in internal units by it. 
% See also: LBF, INCH, PASCAL, TORR

function psia = unit

psia = lbf / inch^2;
