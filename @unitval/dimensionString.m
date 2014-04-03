% dimensionString  Returns string of dimensions

function udim = dimensionString (u)

% Generate units dimensions string

udim = '';

d = unit_MASS_info;
sym = d.symbol;
if u.mass == 1
    udim = [udim ' ' sym];
elseif u.mass ~= 0
    udim = [udim ' ' sym '^' num2str(u.mass)];
end

d = unit_LENGTH_info;
sym = d.symbol;
if u.length == 1
    udim = [udim ' ' sym];
elseif u.length ~= 0
    udim = [udim ' ' sym '^' num2str(u.length)];
end

d = unit_TIME_info;
sym = d.symbol;
if u.time == 1
    udim = [udim ' ' sym];
elseif u.time ~= 0
    udim = [udim ' ' sym '^' num2str(u.time)];
end

d = unit_CURRENT_info;
sym = d.symbol;
if u.current == 1
    udim = [udim ' ' sym];
elseif u.current ~= 0
    udim = [udim ' ' sym '^' num2str(u.current)];
end

d = unit_LUMINANCE_info;
sym = d.symbol;
if u.luminance == 1
    udim = [udim ' ' sym];
elseif u.luminance ~= 0
    udim = [udim ' ' sym '^' num2str(u.luminance)];
end

d = unit_AMOUNT_info;
sym = d.symbol;
if u.amount == 1
    udim = [udim ' ' sym];
elseif u.amount ~= 0
    udim = [udim ' ' sym '^' num2str(u.amount)];
end

d = unit_TEMPERATURE_info;
sym = d.symbol;
if u.temperature == 1
    udim = [udim ' ' sym];
elseif u.temperature ~= 0
    udim = [udim ' ' sym '^' num2str(u.temperature)];
end

d = unit_INFORMATION_info;
sym = d.symbol;
if u.info == 1
    udim = [udim ' ' sym];
elseif u.info ~= 0
    udim = [udim ' ' sym '^' num2str(u.info)];
end
if isempty(udim)
    udim = '(unitless';
else
    udim(1) = '(';
end

udim = [udim ')'];
