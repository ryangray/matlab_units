%% Turn a units expression in to a pretty symbol version
%
% The output can contain TeX formatting, such as "\mu" for "micro", with
% the intent that you can use it in a text label. These are also supported
% by the units.m function for evaluating to a units value.
%
%% Usage
%  unitsSymbols(units_expression_string)
%  unitsSymbols(units_expression_string, tex)
%  unitsSymbols(units_expression_string, tex, env)
%
% The tex option is either 'tex' or 'latex' and defaults to 'tex'. If
% 'latex' is specified, then the result is wrapped in '\mathrm{...}' to
% appear upright when interpreted and some transforms are done differently.
% The env option (defaults to 'mathrm') lets you choose another wrapper or 
% to specify '' for no wrapper for the 'latex' option.
%
% See also: units

function pstr = unitsSymbols (pstr, tex, env)

if nargin < 2
    tex = 'tex';
end
if nargin < 3
    env = 'mathrm'; % \mbox and \text won't work with escaped characters like \mu, etc.
end
latex = strcmpi(tex,'latex');
if latex
    if ~isempty(env)
        tl = ['\\' env '{'];
        tr = '}';
    else
        tl = '';
        tr = '';
    end
else
    tl = '';
    tr = '';
end

pstr = regexprep(pstr,'\<unitless\>', '');
pstr = regexprep(pstr,'\<seconds*\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<sec\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<meters*\>', [tl 'm' tr]);
pstr = regexprep(pstr,'\<[jJ]oules*\>', [tl 'J' tr]);
pstr = regexprep(pstr,'\<[wW]atts*\>', [tl 'W' tr]);
pstr = regexprep(pstr,'\<[nN]ewtons*\>', [tl 'N' tr]);
pstr = regexprep(pstr,'\<[pP]ascals*\>', [tl 'Pa' tr]);
pstr = regexprep(pstr,'\<pa\>', [tl 'Pa' tr]);
pstr = regexprep(pstr,'\<[aA]mps*\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<[aA]mperes*\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<bits*\>', [tl 'b' tr]);
pstr = regexprep(pstr,'\<bytes*\>', [tl 'B' tr]);
pstr = regexprep(pstr,'\<btus*\>', [tl 'BTU' tr]);
pstr = regexprep(pstr,'\<calories*\>', [tl 'cal' tr]);
pstr = regexprep(pstr,'\<[cC]andelas*\>', [tl 'Cd' tr]);
pstr = regexprep(pstr,'\<[hH]enry\>', [tl 'H' tr]);
pstr = regexprep(pstr,'\<[hH]enries\>', [tl 'H' tr]);
pstr = regexprep(pstr,'\<[fF]arads*\>', [tl 'F' tr]);
if latex
    pstr = regexprep(pstr,'\<degs*\>', [tl '^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<degrees*\>', [tl '^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Kdegs*\>', [tl 'K^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Cdegs*\>', [tl 'C^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Fdegs*\>', [tl 'F^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Rdegs*\>', [tl 'R^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<degK*\>', [tl '^{\\circ}K' tr]);
    pstr = regexprep(pstr,'\<degC*\>', [tl '^{\\circ}C' tr]);
    pstr = regexprep(pstr,'\<degR*\>', [tl '^{\\circ}R' tr]);
    pstr = regexprep(pstr,'\<degF*\>', [tl '^{\\circ}F' tr]);
    pstr = regexprep(pstr,'\<percent\>', [tl '\\%' tr]);
    pstr = regexprep(pstr,'\<%\>', [tl '\\%' tr]);
else
    pstr = regexprep(pstr,'\<degs*\>', '{\\circ}');
    pstr = regexprep(pstr,'\<degrees*\>', '{\\circ}');
    pstr = regexprep(pstr,'\<Kdegs*\>', 'K{\\circ}');
    pstr = regexprep(pstr,'\<Cdegs*\>', 'C{\\circ}');
    pstr = regexprep(pstr,'\<Fdegs*\>', 'F{\\circ}');
    pstr = regexprep(pstr,'\<degK*\>', 'K');
    pstr = regexprep(pstr,'\<degC*\>', '{\\circ}C');
    pstr = regexprep(pstr,'\<degR*\>', '{\\circ}R');
    pstr = regexprep(pstr,'\<degF*\>', '{\\circ}F');
    pstr = regexprep(pstr,'\<percent\>', '%');
end
pstr = regexprep(pstr,'\<Rdegs*\>', [tl 'R' tr]);
pstr = regexprep(pstr,'\<Kdegs*\>', [tl 'K' tr]);
pstr = regexprep(pstr,'\<[cC]oulombs*\>', [tl 'C' tr]);
pstr = regexprep(pstr,'\<[vV]olts*\>', [tl 'V' tr]);
pstr = regexprep(pstr,'\<ev\>', [tl 'eV' tr]);
pstr = regexprep(pstr,'\<[fF]arads*\>', [tl 'F' tr]);
pstr = regexprep(pstr,'\<feet\>', [tl 'ft' tr]);
pstr = regexprep(pstr,'\<foot\>', [tl 'ft' tr]);
pstr = regexprep(pstr,'\<grams*\>', [tl 'g' tr]);
pstr = regexprep(pstr,'\<liters*\>', [tl 'L' tr]);
pstr = regexprep(pstr,'\<inch\>', [tl 'in' tr]);
pstr = regexprep(pstr,'\<inches\>', [tl 'in' tr]);
pstr = regexprep(pstr,'\<[hH]ertz\>', [tl 'Hz' tr]);
pstr = regexprep(pstr,'\<miles*\>', [tl 'mi' tr]);
pstr = regexprep(pstr,'\<nautical_miles*\>', [tl 'nmi' tr]);
pstr = regexprep(pstr,'\<ohms*\>', [tl '{\\Omega}' tr]);

% Now replace prefixes

pstr = regexprep(pstr,'deci\*',  [tl 'd' tr]);
pstr = regexprep(pstr,'deca\*',  [tl 'D' tr]);
pstr = regexprep(pstr,'centi\*', [tl 'c' tr]);
pstr = regexprep(pstr,'hecto\*', [tl 'h' tr]);
pstr = regexprep(pstr,'milli\*', [tl 'm' tr]);
pstr = regexprep(pstr,'kilo\*',  [tl 'k' tr]);
pstr = regexprep(pstr,'micro\*', [tl '{\\mu}' tr]);
pstr = regexprep(pstr,'mega\*',  [tl 'M' tr]);
pstr = regexprep(pstr,'nano\*',  [tl 'n' tr]);
pstr = regexprep(pstr,'giga\*',  [tl 'G' tr]);
pstr = regexprep(pstr,'pico\*',  [tl 'p' tr]);
pstr = regexprep(pstr,'tera\*',  [tl 'T' tr]);
pstr = regexprep(pstr,'femto\*', [tl 'f' tr]);
pstr = regexprep(pstr,'peta\*',  [tl 'P' tr]);
pstr = regexprep(pstr,'atto\*',  [tl 'a' tr]);
pstr = regexprep(pstr,'exa\*',   [tl 'e' tr]);
pstr = regexprep(pstr,'zepto\*', [tl 'z' tr]);
pstr = regexprep(pstr,'zetta\*', [tl 'Z' tr]);
pstr = regexprep(pstr,'yocto\*', [tl 'y' tr]);
pstr = regexprep(pstr,'yetta\*', [tl 'Y' tr]);

pstr = regexprep(pstr,'kibi\*', [tl 'ki' tr]);

% Other special cases

pstr = regexprep(pstr,'\<um\>', [tl '{\\mu}m' tr]);
pstr = regexprep(pstr,'\<urad(s*)\>', [tl '{\\mu}rad$1' tr]);

% Replacements only for LaTeX (in order to wrap recognized units in \mathrm{})

if latex
    pstr = regexprep(pstr,'\<radian\>', [tl 'radian' tr]);
    pstr = regexprep(pstr,'\<radians\>', [tl 'radians' tr]);
    pstr = regexprep(pstr,'\<cm\>', [tl 'cm' tr]);
    pstr = regexprep(pstr,'\<km\>', [tl 'km' tr]);
    pstr = regexprep(pstr,'\<mole\>', [tl 'mole' tr]);
    pstr = regexprep(pstr,'\<kj\>', [tl 'kJ' tr]);
    pstr = regexprep(pstr,'\<kw\>', [tl 'kW' tr]);
end

end
