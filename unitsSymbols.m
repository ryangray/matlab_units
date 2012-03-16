%% Turn a units expression in to a pretty symbol version
%
% The output can contain TeX formatting, such as "\mu" for "micro", with
% the intent that you can use it in a text label. These are also supported
% by the units.m function for evaluating to a units value.
%
%% Usage
%  unitsSymbols(units_expression_string)

function pstr = unitsSymbols (pstr)

pstr = regexprep(pstr,'\<seconds*\>', 's');
pstr = regexprep(pstr,'\<sec\>', 's');
pstr = regexprep(pstr,'\<meters*\>', 'm');
pstr = regexprep(pstr,'\<[jJ]oules*\>', 'J');
pstr = regexprep(pstr,'\<[wW]atts*\>', 'W');
pstr = regexprep(pstr,'\<[nN]ewtons*\>', 'N');
pstr = regexprep(pstr,'\<[aA]mps*\>', 'A');
pstr = regexprep(pstr,'\<[aA]mperes*\>', 'A');
pstr = regexprep(pstr,'\<bits*\>', 'b');
pstr = regexprep(pstr,'\<bytes*\>', 'B');
pstr = regexprep(pstr,'\<btus*\>', 'BTU');
pstr = regexprep(pstr,'\<calories*\>', 'cal');
pstr = regexprep(pstr,'\<[cC]andelas*\>', 'Cd');
pstr = regexprep(pstr,'\<degs*\>', '\\circ'); % LaTeX: '^\\circ'
pstr = regexprep(pstr,'\<degrees*\>', '\\circ');
pstr = regexprep(pstr,'\<Cdeg*\>', 'C\\circ');
pstr = regexprep(pstr,'\<Fdeg*\>', 'F\\circ');
pstr = regexprep(pstr,'\<Rdeg*\>', 'R');
pstr = regexprep(pstr,'\<Kdeg*\>', 'K');
pstr = regexprep(pstr,'\<[cC]oulombs*\>', 'C');
pstr = regexprep(pstr,'\<[vV]olts*\>', 'V');
pstr = regexprep(pstr,'\<ev\>', 'eV');
pstr = regexprep(pstr,'\<[fF]arads*\>', 'F');
pstr = regexprep(pstr,'\<feet\>', 'ft');
pstr = regexprep(pstr,'\<foot\>', 'ft');
pstr = regexprep(pstr,'\<grams*\>', 'g');
pstr = regexprep(pstr,'\<liters*\>', 'L');
pstr = regexprep(pstr,'\<inch\>', 'in');
pstr = regexprep(pstr,'\<inches\>', 'in');
pstr = regexprep(pstr,'\<[hH]ertz\>', 'Hz');
pstr = regexprep(pstr,'\<miles*\>', 'mi');
pstr = regexprep(pstr,'\<nautical_miles*\>', 'nmi');
pstr = regexprep(pstr,'\<ohms*\>', '\\Omega');

% Now replace prefixes

pstr = regexprep(pstr,'deci\*', 'd');
pstr = regexprep(pstr,'deca\*', 'D');
pstr = regexprep(pstr,'centi\*', 'c');
pstr = regexprep(pstr,'hecto\*', 'h');
pstr = regexprep(pstr,'milli\*', 'm');
pstr = regexprep(pstr,'kilo\*', 'k');
pstr = regexprep(pstr,'micro\*', '\\mu');
pstr = regexprep(pstr,'mega\*', 'M');
pstr = regexprep(pstr,'nano\*', 'n');
pstr = regexprep(pstr,'giga\*', 'G');
pstr = regexprep(pstr,'pico\*', 'p');
pstr = regexprep(pstr,'tera\*', 'T');
pstr = regexprep(pstr,'femto\*', 'f');
pstr = regexprep(pstr,'peta\*', 'P');
pstr = regexprep(pstr,'atto\*', 'a');
pstr = regexprep(pstr,'exa\*', 'e');
pstr = regexprep(pstr,'zepto\*', 'z');
pstr = regexprep(pstr,'zetta\*', 'Z');
pstr = regexprep(pstr,'yocto\*', 'y');
pstr = regexprep(pstr,'yetta\*', 'Y');

pstr = regexprep(pstr,'kibi\*', 'ki');
