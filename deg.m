%% Unit deg (degree, plane angle)
%
% See also: radian, degree

function d = deg

d = unit_MAKE(pi / 180 * radian, 'degree', '°'); % char(176) doesn't work in Octave
