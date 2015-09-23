%% Unit kWh (kilowatt-hour)
%
% See also: watt, hour

function kWh = unit

kWh = unit_MAKE(kilo * watt * hour, 'kilowatt_hour', 'kWh');
