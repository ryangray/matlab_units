%% Render a number with units to a string including the unit
%
% This will also run the unit string through unitsSymbols.
%
%% Usage
%
%  str = unit2str(val, unitstr)
%  str = unit2str(val, unitstr, format)
%  str = unit2str(val, unitstr, format, tex)
%
% The number is converted to the units specified with unitstr and then to a
% string with num2str(). If a format string is specified, then it is passed to
% num2str(). If format is a function handle, then it is called instead of 
% num2str, passing the converted val to it. If tex is given, it is passed as the
% tex option to unitsSymbols.
%
% If val is an array, a 1xN array will produce a single string of values
% with one unit at the end, and an Nx1 array will produce a cell array of
% strings with N rows and the unit repeated at the end of each row.
%
% You can give the units string with the units surrounded by parens or
% brackets if you want them to appear after the value that way:
%
%  unit2str(x, '(km)')
%
% If you want multiple values to be separated by a comma, specify the
% format with a comma trailing the value (the last one will be removed):
%
%  unit2str(x, '(km)', '%g, ')
% 
% See also: units, unitsSymbols

function str = unit2str (value, unitstr, format, tex)

val = units(unitstr, value, 'to'); % convert value

if nargin < 4
    sym = unitsSymbols(unitstr);
else
    sym = unitsSymbols(unitstr, tex);
end
if ismember(sym, {'{\circ}', '^{\circ}'})
    ustr = sym; % No space between
else
    ustr = [' ' sym];
end

if ischar(value)
    
    nstr = value;
    ustr = '';
    
elseif nargin < 3 || isempty(format)
    
    nstr = num2str(val);
    
elseif isa(format, 'function_handle')

    nstr = format(val);
else
    nstr = num2str(val, format);
    
end

if size(nstr,1) > 1
    nstr = cellstr(nstr);
end

nstr = regexprep(nstr, ',?\s*$',''); % remove a trailing comma and spaces

% Attach units to every row of values

str = strcat(nstr, repmat(ustr, size(nstr,1), 1));
