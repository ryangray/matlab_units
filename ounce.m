%% Unit ounce (oz) = 28.349523125 g
%
% Exact definition by international yard and pound agreement of 1959.
%
% See also: fluid_ounce, ounces

function oz = ounce

oz = unit_MAKE(28.349523125 * gram, 'international_avoirdupois_ounce', 'oz');
