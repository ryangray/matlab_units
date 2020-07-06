%% Unit inch (in)
%
% Note: unit('in') is supported.
%
% See also: foot, inches

function in = inch

in = unit_MAKE(foot / 12.0, 'inch', 'in');
