%% Unit candela (cd) SI unit of luminance
% There isn't a units function 'cd', but the unit function does support it,
% e.g., you can use unit('cd').

function candela = unit 

candela = unit_MAKE(unit_LUMINANCE, 'candela', 'cd');
