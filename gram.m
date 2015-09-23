%% Unit gram (g)
%
% The unit function supports 'g' which is NOT g0
%
% See also: kilogram

function gram = unit 

gram = unit_MAKE(milli * kg, 'gram', 'g');
