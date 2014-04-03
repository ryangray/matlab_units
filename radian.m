%% Unit radian (plane angle)
%
% Angle is not strictly a unit dimension. It produces a dimensionless unit
% value, but it still appeals to the base unit_ANGLE_PLANE.m in order to
% allow its value to be replaced in a different base system. For this
% reason, you should explicitly convert angles to radians when doing angle
% math such as angle times radius to get arc length:
%
%  radius = 50 * cm;
%  arc = 2 * cm;
%  angle = (arc / radius) * radians; % assures it is in the base angle unit
%  arc = angle/radians * radius; % Assures you have a radian value for this
%
% See also: deg, steradian

function radian = unit 

radian = unit_ANGLE_PLANE;
