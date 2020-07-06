%% Unit mAh (milliamp-hour)
%
% See also: amp, hour

function m = mAh

m = unit_MAKE(milli * amp * hour, 'milliamp_hour', 'mAh');
