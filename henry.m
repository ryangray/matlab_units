%% Unit henry (H), SI unit of inductance
% For a rate of change of current in a circuit of one ampere per second,
% where the resulting electromotive force is one volt, the inductance of
% the circuit is one henry.
%
% Note: unit('H') is supported.
%
% See also: henries, volt, second, ampere

function H = henry

H = unit_MAKE(volt * second / ampere, 'henry', 'H');
