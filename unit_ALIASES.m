%% Resolve some unit aliases in a unit string
%
% This allows some unit strings that are otherwise difficult or not
% allowable:
%
% * Existing MATLAB functions (like 'sec' or 'pascal')
% * Allow unit strings to have some TeX ('\mu' -> 'micro*')
% * Single-letter units like A, F, g, etc.
% * Handle special units such as 'string', 'int', etc.
%
% This produces a new string that should resolve with str2num() as the
% alises have been replaced with names of appropriate units functions.
%
% This does not handle units that are already aliased with separate
% functions, e.g., it will replace 'm' with 'meter', but not replace
% 'meters' with meter. This is so it does as few replacements as possible.
%
% Special units, like 'string', are translated to unitless or removed. The
% intention is that those are handled already and this result is going to
% get converted to a unit value. The case of mixed special units like
% 'logical*km' are not really defined, but most may at least not cause an
% error.
%
% Aliases, this allows are:
%
% * Single letter units that don't have *.m files for them ('m', 's', etc.).
% * '\mu' -> 'micro*', so '\mum' -> 'micro*meter'
% * '\Omega' -> 'ohm'
% * '{\circ}' -> 'deg' and '\circK' -> 'degK', etc.
% * 'c' -> 'c0' (speed of light in c0.m)
% * 'cd' -> 'candela'
% * 's', 'sec' -> 'second'
% * 'min' -> 'minute'
% * 'psi' -> 'psia'
% * 'pascal' -> 'pascals'
% * 'bar' -> 'bars'
% * 'knot' -> 'knots'
% * 'logical', 'int' -> 'unitless'
% * 'string', 'include', 'function' -> ''
% * '%' -> 'percent'
% * 'in' -> 'inch'
% * Words ending with '2' or '3' to be a square or cube ('cm2'->'cm^2')
%
% See also: unit, convert

function ue = unit_ALIASES(ue)

isOct = (exist ('OCTAVE_VERSION', 'builtin') > 0); % Check if under Octave

% These translate various strings taken in a units context

ue = strtrim(ue);
ue = regexprep(ue,'([\w\d])( +|\-)([\w\d])','$1*$3'); % multiply

% TeX aliases so you can use these in a units string and in a label.
% Do these substitutions before others that operate on whole words.

ue = regexprep(ue,'\\mu','micro*'); % \mu
ue = regexprep(ue,'\\Omega\>','ohms'); % \Omega
%ue = strrep(ue,char(937),'ohms'); % Octave doesn't like 16-bit char
ue = regexprep(ue,'\{\\circ\}','\\circ'); % {\circ} -> \circ for the following
ue = regexprep(ue, char([194 176]), 'deg'); % degree character -> deg in UTF-8
if ~isOct
    ue = regexprep(ue, char(176), 'deg'); % degree character -> deg in MATLAB
end
ue = regexprep(ue,'\\circ([CFRK])\>','deg$1'); % \circC, \circF, etc.
ue = regexprep(ue,'\<([CFRK])\\circ\>','$1deg'); % C\circ, etc.
ue = regexprep(ue,'\<\\circ\>','deg'); % \circ

% Degree for Octave since it uses \circ as TeX does and \deg for the degree symbol, whereas MATLAB uses \circ for the degree symbol.
ue = regexprep(ue,'\{\\deg\}','\\deg'); % {\deg} -> \deg for the following
ue = regexprep(ue,'\\deg([CFRK])\>','deg$1'); % \degC, \degF, etc.
ue = regexprep(ue,'\<([CFRK])\\deg\>','$1deg'); % C\deg, etc.
ue = regexprep(ue,'\<\\deg\>','deg'); % \deg

% Case aliases

% Single letters
% We don't have single letter functions

ue = regexprep(ue,'\<A\>','ampere');
ue = regexprep(ue,'\<b\>','bit');
ue = regexprep(ue,'\<B\>','byte');
ue = regexprep(ue,'\<C\>','coulomb');
ue = regexprep(ue,'\<F\>','farad');
ue = regexprep(ue,'\<gram\>','grams'); % To avoid a conflict with gram.m in controls toolbox,
ue = regexprep(ue,'\<g\>','grams'); % change these to "grams", and grams.m will not reference gram.m
ue = regexprep(ue,'\<H\>','henry');
ue = regexprep(ue,'\<J\>','joule');
ue = regexprep(ue,'\<K\>','degK');
ue = regexprep(ue,'\<[lL]\>','liter');
ue = regexprep(ue,'\<m\>','meter');
ue = regexprep(ue,'\<N\>','newton');
ue = regexprep(ue,'\<P\>','poise');
ue = regexprep(ue,'\<S\>','seimen');
ue = regexprep(ue,'\<s\>','second');
ue = regexprep(ue,'\<T\>','tesla');
ue = regexprep(ue,'\<t\>','tonne');
ue = regexprep(ue,'\<V\>','volt');
ue = regexprep(ue,'\<W\>','watt');
ue = regexprep(ue,'\<c\>','c0');

% Handle single-letter prefix with single letter unit
% Have some of these like kg, cm, etc., but this makes all combos valid.
% Other prefixed units are not handled. Could look for prefixes then try the
% suffix word as a valid unit.
pre1 = ['pnumcdhkMGT'];
pre2 = {'pico','nano','micro','milli','centi','deci','hecto','kilo','mega','giga','tera'};
base1 = 'AbCFgHJKLlmNPSsTtVW';
base2 = {'ampere','bit','coulomb','farad','grams','henry','joule','degK','liter','liter','meter','newton','poise','seimen','second','tesla','tonne','volt','watt'};

[istart, iend, tok] = regexp(ue,'\<(p|n|u|m|c|d|h|k|M|G|T)(A|b|C|F|g|H|J|K|L|l|m|N|P|S|s|T|t|V|W)\>','start','end','tokens');
for ii = length(tok):-1:1
    i1 = strfind(pre1, tok{ii}{1});
    i2 = strfind(base1, tok{ii}{2});
    ue = [ue(1:istart(ii)-1) '(' pre2{i1} '*' base2{i2} ')' ue(iend(ii)+1:end)];
end

% Existing function dodges

ue = regexprep(ue,'\<cd\>','candela');
ue = regexprep(ue,'\<sec\>','second');
ue = regexprep(ue,'\<seconds\>','second'); % New conflict with timefun/seconds
ue = regexprep(ue,'\<minutes\>','minute'); % New conflict with timefun/minutes
ue = regexprep(ue,'\<hours\>','hour'); % New conflict with timefun/hours
ue = regexprep(ue,'\<days\>','day'); % New conflict with timefun/days
ue = regexprep(ue,'\<years\>','year'); % New conflict with timefun/years
ue = regexprep(ue,'\<min\>','minute'); 
ue = regexprep(ue,'\<psi\>','psia');
ue = regexprep(ue,'\<pascal\>','pascals');
ue = regexprep(ue,'\<bar\>','bars');
ue = regexprep(ue,'\<knot\>','knots');
ue = regexprep(ue,'\<lb\>','lbf'); % Grumble


% Special

ue = regexprep(ue,'\<logical\>','unitless');
ue = regexprep(ue,'\<int(eger)?\>','unitless');
ue = regexprep(ue,'\<factor\>','unitless');
ue = regexprep(ue,'\<string\>','');
ue = regexprep(ue,'\<include\>','');
ue = regexprep(ue,'\<function\>','');
ue = regexprep(ue,'(.)%$','$1*percent');
ue = regexprep(ue,'^%$','percent');
ue = regexprep(ue,'\<in\>','inch');
ue = regexprep(ue,'\<([a-zA-Z_]+)([23])\>','$1^$2'); % e.g., cm2 -> cm^2 or m3 -> m^3
if ~isOct
    ue = regexprep(ue,['\<' char(937) '\>'],'ohm'); % Capital Omega symbol in MATLAB
    ue = regexprep(ue,['\<' char(197) '\>'],'angstrom'); % Circle-topped capital A in MATLAB
end
ue = regexprep(ue,['\<' char([206 169]) '\>'],'ohm'); % Capital Omega symbol in UTF-8
ue = regexprep(ue,['\<' char([195 133]) '\>'],'angstrom'); % Circle-topped capital A in UTF-8
% Octave is not liking the high code char

% legacy
ue = regexprep(ue,'\<(u|n|m)rads\>','$1rad');
