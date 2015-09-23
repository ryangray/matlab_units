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
% * 'know' -> 'knots'
% * 'logical', 'int' -> 'unitless'
% * 'string', 'include', 'function' -> ''
% * '%' -> 'percent'
% * 'in' -> 'inch'
% * Words ending with '2' or '3' to be a square or cube ('cm2'->'cm^2')
%
% See also: unit, convert

function ue = unit_ALIASES(ue)

% These translate various strings taken in a units context

% TeX aliases so you can use these in a units string and in a label.
% Do these substitutions before others that operate on whole words.

ue = regexprep(ue,'\\mu','micro*'); % \mu
ue = regexprep(ue,'\\Omega\>','ohms'); % \Omega
ue = regexprep(ue,'\{\\circ\}','\\circ'); % {\circ} -> \circ for the following
ue = regexprep(ue, char(176), 'deg'); % ° -> deg
ue = regexprep(ue,'\\circ([CFRK])\>','deg$1'); % \circC, \circF, etc.
ue = regexprep(ue,'\<([CFRK])\\circ\>','$1deg'); % C\circ, etc.
ue = regexprep(ue,'\<\\circ\>','deg'); % \circ

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
ue = regexprep(ue,'\<S\>','seimen');
ue = regexprep(ue,'\<s\>','second');
ue = regexprep(ue,'\<T\>','tesla');
ue = regexprep(ue,'\<t\>','tonne');
ue = regexprep(ue,'\<V\>','volt');
ue = regexprep(ue,'\<W\>','watt');
ue = regexprep(ue,'\<c\>','c0');

% Existing function dodges

ue = regexprep(ue,'\<cd\>','candela');
ue = regexprep(ue,'\<sec\>','second');
ue = regexprep(ue,'\<seconds\>','second'); % New conflict with timefun/seconds
ue = regexprep(ue,'\<minutes\>','minute'); % New conflict with timefun/minutes
ue = regexprep(ue,'\<days\>','day'); % New conflict with timefun/days
ue = regexprep(ue,'\<years\>','year'); % New conflict with timefun/years
ue = regexprep(ue,'\<min\>','minute'); 
ue = regexprep(ue,'\<psi\>','psia');
ue = regexprep(ue,'\<pascal\>','pascals');
ue = regexprep(ue,'\<bar\>','bars');
ue = regexprep(ue,'\<knot\>','knots');

% Special

ue = regexprep(ue,'\<logical\>','unitless');
ue = regexprep(ue,'\<int\>','unitless');
ue = regexprep(ue,'\<string\>','');
ue = regexprep(ue,'\<include\>','');
ue = regexprep(ue,'\<function\>','');
ue = regexprep(ue,'(.)%$','$1*percent');
ue = regexprep(ue,'^%$','percent');
ue = regexprep(ue,'\<in\>','inch');
ue = regexprep(ue,'\<([a-zA-Z_]+)([23])\>','$1^$2'); % e.g., cm2 -> cm^2 or m3 -> m^3
ue = regexprep(ue,['\<' char(197) '\>'],'angstrom'); % Circle-topped capital A
ue = regexprep(ue,['\<' char(937) '\>'],'ohm'); % Capital Omega symbol
