%% Unit kWh (kilowatt-hour)
%
% See also: watt, hour

function k = kWh

k = unit_MAKE(kilo * watt * hour, 'kilowatt_hour', 'kWh');
