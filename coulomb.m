%% Unit coulomb (C)
% The unit function supports the letter symbol 'C' for this.
%
% See also: ampere, second

function C = coulomb

C = unit_MAKE(ampere * second, 'coulomb', 'C'); 
