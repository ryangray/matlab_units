%% Unit farad (F) = coulomb / volt
%
% Note: unit('F') is supported.
%
% See also: coulomb, volt

function farad = unit 

farad = unit_MAKE(coulomb / volt, 'farad', 'F');
