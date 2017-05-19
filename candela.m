%% Unit candela (cd) SI base unit of luminous intensity
%
% Luminous power per unit solid angle emitted by a point light source in a
% particular direction ($I_v$). There isn't a units function 'cd', but the
% unit function does support it, e.g., you can use unit('cd').
%
% See also: nits, lumen, lux

function candela = unit 

candela = unit_MAKE(unit_LUMINANCE, 'candela', 'cd');
