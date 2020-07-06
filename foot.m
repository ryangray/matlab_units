%% Unit foot (ft)
%
% Base unit of length in the english system.
%
% See also: meter, inch, mile

function ft = foot

ft = unit_MAKE(0.3048 * meter, 'foot', 'ft'); % Clark's tables (exact value from 1 yard = 0.9144 m)
