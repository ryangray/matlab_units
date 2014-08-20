%% Render a number with units to a string including the unit
%
% This will also run the unit string through unitsSymbols.
%
%% Usage
%
%  str = unit2str(val, unitstr)
%  str = unit2str(val, unitstr, format)
%
% The number is converted to the units specified with unitstr and then to a
% string with num2str(). If format is specified, then it is passed to
% num2str().
%
% If val is an array, a 1xN array will produce a single string of values
% with one unit at the end, and an Nx1 array will produce a cell array of
% strings with N rows and the unit repeated at the end of each row.
%
% You can give the units string with the units surrounded by parend or
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

function str = unit2str (value, unitstr, format)

val = units(unitstr, value, 'to'); % convert value

ustr = [' ' unitsSymbols(unitstr)];

if ischar(value)
    
    nstr = value;
    ustr = '';
    
elseif nargin < 3
    
    nstr = num2str(val);
    
else
    
    nstr = num2str(val, format);
    
end

if size(nstr,1) > 1
    nstr = cellstr(nstr);
end

nstr = regexprep(nstr, ',?\s*$',''); % remove a trailing comma and spaces

% Attach units to every row of values

str = strcat(nstr, repmat(ustr, size(nstr,1), 1));
