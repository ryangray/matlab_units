%% Unit candela (cd) SI unit of luminance
% There isn't a units function 'cd' because of the existing cd command. 
% However, the unit_ALIASES function does support it, so you can use unit('cd').

function cd = candela

cd = unit_MAKE(unit_LUMINANCE, 'candela', 'cd');
