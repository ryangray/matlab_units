%% Set a unitval variable's display units
%
% This is only for the disp() and display() functions which affect the
% appearance of the value in the command window an in tooltips in debug
% mode. This function will do nothing if the variable is not a unitval
% object, so it is safe to call when using plain double class values.
%
%% Usage
%
%  unitsDisplay(variable, units_string)
%
% This is equivalent of setting the .symbol property of the unitval
% object, but this lets you call it even when using doubles and it also
% checks the dimensionality of the units string agrees with the units of
% the variable. Thus, you could simply use this funcion to both set your
% preferred display units and perform a units assertion
% (unitsSameDimensions) at the same time.
%
% See also: units

function var = unitsDisplay (var, dispUnits)

if isa(var, 'unitval')

    var.symbol = dispUnits;
    if ~sameDimensions(var, dispUnits)
        warning('Unit dimensions do not agree');
    end
    
end

