%% Render a number with units to a string including the unit
%
% This will also run the unit string through unitsSymbols.
%
%% Usage
%
%  str = unit2str(val, unitstr)
%  str = unit2str(val, unitstr, format)
%
% The number is converted to a string with num2str(). If format is
% specified, then it is passed to num2str().
%
% If val is an array, it works as num2str does: 1xN will produce a single
% string of values with one unit at the end, and an Nx1 array will produce
% a character array with N rows and the unit repeated at the end of each
% row which you can then run through cellstr() or cellstr(strtrim()) if you
% like as you might do with num2str().
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

% Attach units to every row of values

str = [nstr repmat(ustr, size(nstr,1), 1)];
