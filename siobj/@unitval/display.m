function display (u)

% unitval/display
% displays unitval class.

if numel(u) > 1
    
    disp(u);
    return
    
end

% Generate units dimensions string
udim = '';
if u.mass == 1
    udim = [udim ' kg'];
elseif u.mass ~= 0
    udim = [udim ' kg^' num2str(u.mass)];
end
if u.length == 1
    udim = [udim ' m'];
elseif u.length ~= 0
    udim = [udim ' m^' num2str(u.length)];
end
if u.time == 1
    udim = [udim ' s'];
elseif u.time ~= 0
    udim = [udim ' s^' num2str(u.time)];
end
if u.current == 1
    udim = [udim ' amp'];
elseif u.current ~= 0
    udim = [udim ' amp^' num2str(u.current)];
end
if u.luminance == 1
    udim = [udim ' cd'];
elseif u.luminance ~= 0
    udim = [udim ' cd^' num2str(u.luminance)];
end
if u.amount == 1
    udim = [udim ' mol'];
elseif u.amount ~= 0
    udim = [udim ' mol^' num2str(u.amount)];
end
if u.tempurature == 1
    udim = [udim ' Kdeg'];
elseif u.tempurature ~= 0
    udim = [udim ' Kdeg^' num2str(u.tempurature)];
end
if u.angle_plane == 1
    udim = [udim ' rad'];
elseif u.angle_plane ~= 0
    udim = [udim ' rad^' num2str(u.angle_plane)];
end
if u.angle_solid == 1
    udim = [udim ' srad'];
elseif u.angle_solid ~= 0
    udim = [udim ' srad^' num2str(u.angle_solid)];
end
if u.info == 1
    udim = [udim ' bit'];
elseif u.info ~= 0
    udim = [udim ' bit^' num2str(u.info)];
end
if isempty(udim)
    udim = '(unitless';
else
    udim(1) = '(';
end

% Probably need some adjustments here for user prefs like loose/tight?
disp(' ');
disp([inputname(1),' = '])
disp(' ');
%disp(['   ' char(u)])

if isempty(u.value)
    disp(['     [] ' udim ')']);
else
    disp(['     ' num2str(u.value) ' ' udim ')']);
end

disp(' ');
