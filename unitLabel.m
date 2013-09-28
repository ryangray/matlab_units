%% Prep a unit string to append with parens around the unit using unitsSmbols
%
% If the unit is a unitless equivalent, then this returns an empty string.
%
% For example:
%
%  xlabel(['Irradiance' unitlabel('watts/cm^2')])
%
% Produces the string: 'Irradiance (W/cm^2)'
%
% A more useful example:
%
%  xustr = 'watts/cm^2'; % These might come from the user via inputload, etc.
%  yustr = 'degC';
%  figure
%  plot(units(xustr,I,'to'), units(yustr,T,'to'));
%  xlabel(['Irradiance' unitlabel(xustr)])
%  ylabel(['Temperature' unitlabel(xustr)])
%
% Here, the temperature label becomes 'Temperature ({\circ}C)'.
%
% This function is really equivalent to [' (' unitsSymbols(unitstr) ')'],
% except that an empty string is returned if the units are unitless
% equivalents per unitsSymbols.
%
%% Usage
%
%  str = unitlabel(unitstr)
%  str = unitlabel(unitstr, tex)
%  str = unitlabel(unitstr, tex, env)
%
% For the tex options, see unitsSymbols.
%
% See also: unit2str, units, unitsSymbols

function str = unitlabel (unitstr, varargin)

str = unitsSymbols(unitstr, varargin{:});

if ~isempty(str)
    
    str = [' (' str ')'];
end
