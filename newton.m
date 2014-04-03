%% Unit newton (N)
%
% See also: kg, meter, second

function newton = unit 

newton = unit_MAKE(kg * meter / second^2, 'Newton', 'N');
