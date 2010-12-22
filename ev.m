% Unit ev (electron Volt)
% Converts number to internal units by multplying by it 
% Converts number into eV by dividing value in internal units by it. 
% Source: CODATA 2006 via NIST
% Uncertainty = 0.000 000 040 x 10-19 J
% See also: kev, joule, constElectronVolt

function ev = unit

ev = 1.602176487e-19 * joule;
