%% Unit lux (lx = lm/m^2) SI unit of illuminance
%
% Illuminance or luminous emittance ($E_v$) is luminous flux per unit area.
% It is analogous to the radiometric unit watts per square metre, but with
% the power at each wavelength weighted according to the luminosity
% function, a standardized model of human visual brightness perception.
%
% See also: lumen, candela

function lux = unit 

lux = unit_MAKE(lumen / meter^2, 'lux', 'lux');
