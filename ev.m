% Unit eV (electron Volt)
% Converts number to internal units by multplying by it 
% Converts number into eV by dividing value in internal units by it. 
% Note this is the approximate value given by NIST. The real value must be
% determined by experiment.

function eV = unit()

eV =  1.602177E-19 * joule;
