%% Unit newton (N)
%
% See also: kg, meter, second

function N = newton

N = unit_MAKE(kg * meter / second^2, 'Newton', 'N');
