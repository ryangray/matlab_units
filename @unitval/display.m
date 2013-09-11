% display  Display unitval object value with unit dimensions.

function display (u)

% Probably need some adjustments here for user prefs like loose/tight?
disp(' ');
disp([inputname(1),' = '])
disp(' ');

if isempty(double(u))
    disp(['     []']);
else
    disp(double(u));
end

disp(u.dimensionString);

disp(' ');
