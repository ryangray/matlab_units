%% Unit gallons_us 
%
% Due to confusion with imperial gallon, the symbol "gal" is not included
% which would also require gal.m, which is also not included. "gal" is also
% not aliased in units_ALIASES, so units('gal') will not resolve either as
% it is not specific enough.
%
% See also: quart, gallon, gallon_imperial

function gallon_us = unit 

gallon_us = unit_MAKE(4 * quart, 'US_gallon');
