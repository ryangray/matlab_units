%% Unit sidereal year (yr_sd)
%
% From the mean longitude referred to the mean ecliptic and the equinox
% J2000 given in Simon et al., 1994, Astron. Astrophys., 282, 663
%
% See also: sidereal_day

function sidereal_year = unit

sidereal_year = unit_MAKE(365.256363004 * day, 'sidereal_year', 'yr_sd');

