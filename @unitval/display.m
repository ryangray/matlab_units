% display  Display unitval object value with unit dimensions.

function display (u)

% Probably need some adjustments here for user prefs like loose/tight?
disp(' ');
disp([inputname(1),' = '])
disp(' ');

% if isempty(u.value)
%     disp(['     [] ' udim ')']);
% else
%     disp(['     ' num2str(u.value) ' ' udim ')']);
% end

disp(double(u));
disp(u.dimensionString);

disp(' ');
