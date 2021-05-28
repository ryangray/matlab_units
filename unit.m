%% Convert a value to base units
%
% This is the same as multiplying the value by a units function expression,
% like 32*km, except that temperature values are converted correctly and
% unit aliases are resolved. You can also convert temperature values
% directly with the temperature functions.
%
% This is most useful for when the units are not known to the code but come
% from user input or a file.
%
%% Usage
%
%  uval = unit(val, unit_string)
%  uval = unit(unit_string)
%
% This is intended to replace calling units.m as:
%  units(unit_string)
%  units(unit_string, val)
% to leave units.m to be used for its functions other than converting, like
% changing the base or class, or installing.
% 
%% Examples
%
%  d = unit(32,'km'); % same as 32*km
%  T = unit(32,'degF'); % same as degF(32)
%  a = unit(32,'ft/s^2');
%
% See also: convert, units

function uval = unit (val, unitstr)

persistent unitsdir

if isempty(unitsdir)
    unitsdir = fileparts(which(mfilename));
end

tempunits = {'degK','degR','degC','degF'};

if nargin == 1
    unitstr = val;
    val = 1;
end

if ischar(unitstr)
    
    % Eval a units expression, handling special cases or conversions

    switch lower(unitstr)
        
        case 'string'

            if nargin == 1

                uval = '';

            elseif ischar(val)

                uval = val;

            else

                uval = char(val);
            end

        case 'function'

            if nargin == 1

                uval = []; 

            elseif ischar(val)

                uval = str2func(val);

            else

                uval = val;

            end

        otherwise % regular declaration

            ue = unit_ALIASES(unitstr);

            if ismember(ue, tempunits) && nargin > 1

                % Handle temperature conversions, but only if a value is given,
                % otherwise, it is just the degree scale factor.

                uval = feval(ue, val);

            else

                if exist(ue,'file') && strcmpi(unitsdir, fileparts(which(ue)))
                    s = warning('off','MATLAB:dispatcher:InexactMatch'); % Older warning message ID
                    warning('off','MATLAB:dispatcher:InexactCaseMatch'); % Newer warning message ID
                    uval = str2num(ue); %#ok<ST2NM> % Need str2num (rather than str2double) to evaluate units functions, but lighter than eval.
                    warning(s);
                    if isa(uval,'double')
                        uval = val * uval;
                    else
                        uval = [];
                    end
                else
                    uval = [];
                end

            end
    end

else % unit value rather than a string
    
    uval = val * unitstr;
    
end
