%% Unit eV (electron Volt)
%
% Source: CODATA 2006 via NIST
% Uncertainty = 0.000 000 040 x 10-19 J
%
% See also: kev, joule

function eV = unit

eV = unit_MAKE(1.602176487e-19 * joule, 'electron_volt', 'eV');
