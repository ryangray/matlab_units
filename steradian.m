%% Unit steradian (sr, solid angle)
%
% Solid angle is not strictly a unit dimension. It produces a dimensionless
% unit value, but it still appeals to the base unit_ANGLE_SOLID.m in order
% to allow its value to be replaced in a different base system.
%
% See also: radian

function sr = steradian

sr = unit_MAKE(unit_ANGLE_SOLID, 'steradian', 'sr');
