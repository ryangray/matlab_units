% Unit pound 
% Converts number to internal units by multplying by it 
% Converts number into pound by dividing value in internal units by it. 

function pound = unit 

warning('you should use lbf, lbm or slug to specify force or mass. Defaulting to pound-force.');

pound = lbf;
