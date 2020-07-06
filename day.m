%% Unit day (mean solar day)
%
% See also: sidereal_day, hour

function dy = day

dy = unit_MAKE(24.0 * hour, 'mean_solar_day', 'day');
