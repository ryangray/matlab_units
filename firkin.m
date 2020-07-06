%% Unit firkin (90 lbm)
%
% Base unit of mass in the FFF system.
% <http://en.wikipedia.org/wiki/FFF_system FFF System - Wikipedia>
%
% See also: days, furlong, fortnight

function fir = firkin

fir = unit_MAKE(90 * lbm, 'firkin', 'fir');
