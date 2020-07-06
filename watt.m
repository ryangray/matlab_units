%% Unit watt (W), SI unit of radiant flux
% watt = joule / s
% See also: joule

function W = watt

W = unit_MAKE(joule / second, 'watt', 'W');
