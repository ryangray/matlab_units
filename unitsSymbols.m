%% Turn a units expression in to a pretty symbol version
%
% The output can contain TeX formatting, such as "\mu" for "micro", if the tex 
% option is 'none' with the intent that you can use it in a text label.
%
% Units of 'string', 'int', and 'unitless' are returned as an empty string.
%
%% Usage
%  unitsSymbols(units_expression_string)
%  unitsSymbols(units_expression_string, tex)
%  unitsSymbols(units_expression_string, tex, env)
%
% The tex option can be: 'none' (or empty), 'tex' (default) or 'latex'.
% If 'latex' is specified, then the result is wrapped in '\mathrm{...}' to
% appear upright when interpreted and some transforms are done differently.
% The env option (defaults to 'mathrm') lets you choose another wrapper or
% to specify '' for no wrapper for the 'latex' option. Using 'none' is for
% plain text output such as to a file..
%
% Note: this is designed for a string is in a units context, meaning that other
% text that matches a units will be treated as a unit, so you should try to
% separate other text first.
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
notex = isempty(tex) || strcmpi(tex,'none');
tl = '';
tr = '';
TL = '';
if latex && ~isempty(env)
    TL = ['\' env '{'];
    tl = ['\\' env '{'];
    tr = '}';
end

pre = '([yzafpnumcdhkMGTPEZY]|da)';

if latex && ~isempty(tl) % latex format with wrapper
    
    % Wrap things that are already symbols if there is a wrapper
    % First group are those that require a scale prefix.
    bases = {'m','g','s','J','W','N','A','cal','cd','F','V','Pa','Hz'};
    for ii = 1:length(bases)
        pstr = regexprep(pstr,['\<' pre '{1}' bases{ii} '\>'], [tl '$1' bases{ii} tr]);
    end
    % Those that have no scale prefix
    bases = {'m','g','s','J','W','N','A','cal','cd','F','V','Pa','Hz','mol','BTU'};
    for ii = 1:length(bases)
        pstr = regexprep(pstr,['\<' bases{ii} '\>'], [tl bases{ii} tr]);
    end
end
    
pstr = regexprep(pstr,'\<unitless\>', '');
pstr = regexprep(pstr,'\<int\>', '');
pstr = regexprep(pstr,'\<string\>', '');
pstr = regexprep(pstr,'\<seconds?\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<sec\>', [tl 's' tr]);
pstr = regexprep(pstr,'\<meters?\>', [tl 'm' tr]);
pstr = regexprep(pstr,'\<joules?\>', [tl 'J' tr]);
pstr = regexprep(pstr,'\<watts?\>', [tl 'W' tr]);
pstr = regexprep(pstr,'\<newtons?\>', [tl 'N' tr]);
pstr = regexprep(pstr,'\<pascals?\>', [tl 'Pa' tr]);
pstr = regexprep(pstr,'\<amps?\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<amperes?\>', [tl 'A' tr]);
pstr = regexprep(pstr,'\<bits?\>', [tl 'b' tr]);
pstr = regexprep(pstr,'\<bytes?\>', [tl 'B' tr]);
pstr = regexprep(pstr,'\<btus?\>', [tl 'BTU' tr]);
pstr = regexprep(pstr,'\<calories?\>', [tl 'cal' tr]);
pstr = regexprep(pstr,'\<candelas?\>', [tl 'cd' tr]);
pstr = regexprep(pstr,'\<henry\>', [tl 'H' tr]);
pstr = regexprep(pstr,'\<henries\>', [tl 'H' tr]);
pstr = regexprep(pstr,'\<farads?\>', [tl 'F' tr]);
pstr = regexprep(pstr,'\<c0\>', [tl 'c' tr]);
pstr = regexprep(pstr,'\<mole\>', [tl 'mol' tr]);

pstr = regexprep(pstr,'\<degs?\>', '^{\\circ}');
pstr = regexprep(pstr,'\<degrees?\>', '^{\\circ}');
if latex
    pstr = regexprep(pstr,'\<Kdegs?\>', [tl 'K' tr '^{\\circ}']); % If env is mathrm, then \circ inside can cause problems
    pstr = regexprep(pstr,'\<Cdegs?\>', [tl 'C' tr '^{\\circ}']);
    pstr = regexprep(pstr,'\<Fdegs?\>', [tl 'F' tr '^{\\circ}']);
    pstr = regexprep(pstr,'\<Rdegs?\>', [tl 'R' tr '^{\\circ}']);
    pstr = regexprep(pstr,'\<degK\>', [tl 'K' tr]);
    pstr = regexprep(pstr,'\<degC\>', ['^{\\circ}' tl 'C' tr]);
    pstr = regexprep(pstr,'\<degR\>', ['^{\\circ}' tl 'R' tr]);
    pstr = regexprep(pstr,'\<degF\>', ['^{\\circ}' tl 'F' tr]);
    pstr = regexprep(pstr,'\<%\>', [tl '\\%' tr]); % Do this before replacing 'percent' with '%'
    pstr = regexprep(pstr,'\<percent\>', [tl '\\%' tr]);
elseif ~notex
    pstr = regexprep(pstr,'\<Kdegs?\>', 'K^{\\circ}');
    pstr = regexprep(pstr,'\<Cdegs?\>', 'C^{\\circ}');
    pstr = regexprep(pstr,'\<Fdegs?\>', 'F^{\\circ}');
    pstr = regexprep(pstr,'\<degK\>', 'K');
    pstr = regexprep(pstr,'\<degC\>', '^{\\circ}C');
    pstr = regexprep(pstr,'\<degR\>', '^{\\circ}R');
    pstr = regexprep(pstr,'\<degF\>', '^{\\circ}F');
    pstr = regexprep(pstr,'\<percent\>', '%');
else
    pstr = regexprep(pstr,'\<degK\>', 'K');
end
pstr = regexprep(pstr,'\<Rdegs?\>', [tl 'R' tr]);
pstr = regexprep(pstr,'\<Kdegs?\>', [tl 'K' tr]);
pstr = regexprep(pstr,'\<coulombs?\>', [tl 'C' tr]);
pstr = regexprep(pstr,'\<volts?\>', [tl 'V' tr]);
pstr = regexprep(pstr,'\<feet\>', [tl 'ft' tr]);
pstr = regexprep(pstr,'\<foot\>', [tl 'ft' tr]);
pstr = regexprep(pstr,'\<grams?\>', [tl 'g' tr]);
pstr = regexprep(pstr,'\<liters?\>', [tl 'L' tr]);
pstr = regexprep(pstr,'\<inch\>', [tl 'in' tr]);
pstr = regexprep(pstr,'\<inches\>', [tl 'in' tr]);
pstr = regexprep(pstr,'\<hertz\>', [tl 'Hz' tr]);
pstr = regexprep(pstr,'\<miles?\>', [tl 'mi' tr]);
pstr = regexprep(pstr,'\<statute_miles?\>', [tl 'mi' tr]);
pstr = regexprep(pstr,'\<nautical_miles?\>', [tl 'nmi' tr]);
pstr = regexprep(pstr,'\<radians?\>', [tl 'rad' tr]);
pstr = regexprep(pstr,'\<steradians?\>', [tl 'sr' tr]);
if ~notex
    pstr = regexprep(pstr,'\<ohms?\>', '{\\Omega}'); % not inside tl/tr
end

% Now replace prefixes

pstr = regexprep(pstr,'deci\*',  [tl 'd' tr]);
pstr = regexprep(pstr,'deca\*',  [tl 'da' tr]);
pstr = regexprep(pstr,'centi\*', [tl 'c' tr]);
pstr = regexprep(pstr,'hecto\*', [tl 'h' tr]);
pstr = regexprep(pstr,'milli\*', [tl 'm' tr]);
pstr = regexprep(pstr,'kilo\*',  [tl 'k' tr]);
if notex
    pstr = regexprep(pstr,'micro\*', 'u');
else
    pstr = regexprep(pstr,'micro\*', '{\\mu}'); % Not inside tl/tr
end
pstr = regexprep(pstr,'mega\*',  [tl 'M' tr]);
pstr = regexprep(pstr,'nano\*',  [tl 'n' tr]);
pstr = regexprep(pstr,'giga\*',  [tl 'G' tr]);
pstr = regexprep(pstr,'pico\*',  [tl 'p' tr]);
pstr = regexprep(pstr,'tera\*',  [tl 'T' tr]);
pstr = regexprep(pstr,'femto\*', [tl 'f' tr]);
pstr = regexprep(pstr,'peta\*',  [tl 'P' tr]);
pstr = regexprep(pstr,'atto\*',  [tl 'a' tr]);
pstr = regexprep(pstr,'exa\*',   [tl 'E' tr]);
pstr = regexprep(pstr,'zepto\*', [tl 'z' tr]);
pstr = regexprep(pstr,'zetta\*', [tl 'Z' tr]);
pstr = regexprep(pstr,'yocto\*', [tl 'y' tr]);
pstr = regexprep(pstr,'yotta\*', [tl 'Y' tr]);

pstr = regexprep(pstr,'kibi\*', [tl 'ki' tr]);

% Other special cases

pstr = regexprep(pstr,['\<' pre 'sec\>'], [tl '$1s' tr]);
pstr = regexprep(pstr,['\<' pre 'rads\>'], [tl '$1rad' tr]);

if ~notex
    
    pstr = regexprep(pstr, '\*', '{\\cdot}');
    
    % Turn 'u' prefix into {\mu} on a valid unit
    
    rex = ['\<u(.+)\>'];
    [istart, iend, itok] = regexp(pstr, rex, 'once');
    i0 = 0;

    while ~isempty(istart)

        istart = istart + i0;
        iend = iend + i0;
        itok = itok + i0;

        ustr = pstr(itok(1,1):itok(1,2));
        if ~isempty(units(ustr))
            % Got a valid unit
            pstr = [pstr(1:istart-1) '{\mu}' TL ustr tr pstr(iend+1:end)];
            i0 = istart + 5;
        else
            i0 = iend + 1;
        end
        [istart, iend, itok] = regexp(pstr(i0+1:end), rex, 'once');

    end

    % For tex/latex, change parens to curly braces after ^ so that the whole 
    % exponent appears as superscript. Hopefully no nested parens in the exponent.
    pstr = regexprep(pstr, '\^\(([^)]+)\)', '^{$1}');
    
end

end
