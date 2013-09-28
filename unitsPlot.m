%% A simple plot starter using units
% It does a plot() with an xlabel() and ylabel(), converting the x and y
% values with the unit strings given and also composing the axes labels
% with the units strings. It also runs the units string through
% unitsSymbols to make nicer labels of them.
%
%% Usage
%
%  h = unitsPlot(x, xunits, xlbl, y, yunits, ylbl, varargin)
%
% The xunits and yunits are unit strings that will be used to both label
% the axes as well as convert the x and y values. The xlbl and ylbl strings
% will be used to label the axes with the unit strings appended in
% brackets.
%
% The additional arguments are passed to plot(), so can include a plot spec
% (as the first one) such as '-k' or also parameter,value pairs such as:
% 'parent',ax. The plot is made in the current axes unless a 'parent',ax
% option is included.
%
% By default, the units are surrounded by square brackets. You can put
% parens around the units to have them display that way instead:
%
%  unitsPlot(x,'(km)','Downrange', y,'(kft)','Altitude')
%
% See also: units, plot, unitsSymbols

function h = unitsPlot (x, xunits, xlbl, y, yunits, ylbl, varargin)

[xlb, xrb, xu] = unitsLabel(xunits);
[ylb, yrb, yu] = unitsLabel(yunits);

h = plot(units(xu, x, 'to'), units(yu, y, 'to'), varargin{:});

ax = get(h,'parent');

xlabel(ax, [xlbl ' ' xlb unitsSymbols(xu) xrb]);
ylabel(ax, [ylbl ' ' ylb unitsSymbols(yu) yrb]);

end

function [lb, rb, ustr] = unitsLabel (ustr)

    lb = '[';
    rb = ']';

    [~,~,itok] = regexp(ustr,'^\s*\[(.+)\]\s*$','once');

    if ~isempty(itok)

        ustr = ustr(itok(1,1):itok(1,2));

    else
        [~,~,itok] = regexp(ustr,'^\s*\((.+)\)\s*$','once');

        if ~isempty(itok)
            lb = '(';
            rb = ')';
            ustr = ustr(itok(1,1):itok(1,2));
        end
    end

end
