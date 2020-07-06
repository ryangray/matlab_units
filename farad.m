%% Unit farad (F) = coulomb / volt
%
% Note: unit('F') is supported.
%
% See also: coulomb, volt

function F = farad

F = unit_MAKE(coulomb / volt, 'farad', 'F');
