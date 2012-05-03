%% Turn a units expression in to a pretty symbol version
%
% The output can contain TeX formatting, such as "\mu" for "micro", with
% the intent that you can use it in a text label. These are also supported
% by the units.m function for evaluating to a units value.
%
%% Usage
%  unitsSymbols(units_expression_string)
%  unitsSymbols(units_expression_string, tex)
%
% The tex option is either 'tex' or 'latex' and defaults to 'tex'. If
% 'latex' is specified, then the result is wrapped in '\mbox{...}' to
% appear upright when interpreted.

function pstr = unitsSymbols (pstr, tex)

if nargin < 2
    tex = 'tex';
end
latex = strcmpi(tex,'latex');
if latex
    tl = '\\mbox{';
    tr = '}';
else
    tl = '';
    tr = '';
end

pstr = regexprep(pstr,'\<seconds*\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<sec\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<meters*\>', [tl 'm' tr]);
pstr = regexprep(pstr,'\<[jJ]oules*\>', [tl 'J' tr]);
pstr = regexprep(pstr,'\<[wW]atts*\>', [tl 'W' tr]);
pstr = regexprep(pstr,'\<[nN]ewtons*\>', [tl 'N' tr]);
pstr = regexprep(pstr,'\<[aA]mps*\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<[aA]mperes*\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<bits*\>', [tl 'b' tr]);
pstr = regexprep(pstr,'\<bytes*\>', [tl 'B' tr]);
pstr = regexprep(pstr,'\<btus*\>', [tl 'BTU' tr]);
pstr = regexprep(pstr,'\<calories*\>', [tl 'cal' tr]);
pstr = regexprep(pstr,'\<[cC]andelas*\>', [tl 'Cd' tr]);
pstr = regexprep(pstr,'\<[hH]enry\>', [tl 'H' tr]);
pstr = regexprep(pstr,'\<[hH]enries\>', [tl 'H' tr]);
if latex
    pstr = regexprep(pstr,'\<degs*\>', [tl '^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<degrees*\>', [tl '^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Cdegs*\>', [tl 'C^{\\circ}' tr]);
    pstr = regexprep(pstr,'\<Fdegs*\>', [tl 'F^{\\circ}' tr]);
else
    pstr = regexprep(pstr,'\<degs*\>', '\\circ');
    pstr = regexprep(pstr,'\<degrees*\>', '\\circ');
    pstr = regexprep(pstr,'\<Cdegs*\>', 'C\\circ');
    pstr = regexprep(pstr,'\<Fdegs*\>', 'F\\circ');
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
pstr = regexprep(pstr,'\<ohms*\>', [tl '\\Omega' tr]);

% Now replace prefixes

pstr = regexprep(pstr,'deci\*',  [tl 'd' tr]);
pstr = regexprep(pstr,'deca\*',  [tl 'D' tr]);
pstr = regexprep(pstr,'centi\*', [tl 'c' tr]);
pstr = regexprep(pstr,'hecto\*', [tl 'h' tr]);
pstr = regexprep(pstr,'milli\*', [tl 'm' tr]);
pstr = regexprep(pstr,'kilo\*',  [tl 'k' tr]);
pstr = regexprep(pstr,'micro\*', [tl '\\mu' tr]);
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

end
