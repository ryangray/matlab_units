%% Convert Converts a value from base units to specified unit
%
% If the units base class is unitval object, then the result is a double
% rather than a unitless unitval object which is convenient for plotting or
% passing converted values to functions that will not cast them to double
% automatically.
%
%% Usage
%
%  convert(value, units_string)
%
% This converts the value to the units given. It is equivalent to
% value/units(units_expression), except for temperature, where it is like
% adding the 'to' parameter to the temperature unit function (deg?), for
% example: degC(0,'to').
%
%  convert(value, units_value)
%
% This is equivalent to value/units_value, and you would call it with a
% numerical units value rather than a units string:
%
%  convert(x, km)
%
% The difference is that when using a units_value rather than a units
% string, it can't do temperature conversion involving a shift. So, you are
% limited to degree size conversions and degK to degR or degR to degK
% conversions.
%
% There is no difference in using convert() with [double] classed units
% versus dividing by the unit value, except that temperature conversions
% are handled properly. When using [unitval] classed units, this will
% differ from using division in that the result with convert() produces a
% double, whereas the division will result in a unitless unitval object
% which may or may not be automatically cast to double depending on how you
% use the value. So, it is good practice to use the convert function to
% explicitly be converting to have temperature treated correctly and have
% unitval units turned into doubles. 
% 
% This does require that you use unit strings to do the conversion. This is
% useful for when you don't know what they actualy are, like when they come
% from user input. If you know the units, you can use division. You would
% just need to possibly cast the result to double for when using unitval
% units, and you can use the temperature functions directly to convert.
%
% See also: units, unitsPlot, unit2str, unitval

function cval = convert (uval, unitstr)

tempunits = {'degK','degR','degC','degF'};

% Eval a units expression, handling special cases or conversions

if strcmpi(unitstr,'string') || strcmpi(unitstr,'function')

    if ischar(uval) || iscellstr(uval)

        cval = uval;
        
    elseif isa(uval,'function_handle')
        
        cval = func2str(uval);
    else
        cval = mat2str(uval);

    end

elseif ischar(unitstr)

    ue = unit_ALIASES(unitstr);

    if ismember(ue, tempunits)

        % Handle temperature conversions for single units with
        % value as second arg.
        cval = feval(ue, uval, 'to');

    else

        uv = str2num(ue); %#ok<ST2NM> % Need str2num (rather than str2double) to evaluate units functions, but lighter than eval.
        if isempty(uv)
            if strcmp(ue, unitstr)
                error('Invalid units expression: %s', ue);
            else
                error('Invalid units expression: %s (given as: %s)', ue, unitstr);
            end
        else
            cval = uval / uv;
        end
        
    end
    
else
    
    cval = uval / unitstr;
    
end            

if isa(cval, 'unitval') 
    
    if ~isunitless(cval)
    
        warning('Attempt to convert a unitval to a unit of different dimensionality');
    end
    
    cval = double(cval);
    
end
