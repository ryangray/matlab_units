%% Unit eV (electron Volt)
%
% Source: CODATA 2018 via <https://physics.nist.gov/cgi-bin/cuu/Value?evj NIST>
% eV = 1.602 176 634 x 10-19 J (exact)
%
% See also: keV, joule

function e = eV

e = unit_MAKE(1.602176634e-19 * joule, 'electron_volt', 'eV');
