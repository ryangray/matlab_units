% Unit deg_N 
% Represents degrees North latitude (equal to deg)
% This is so you can be clear in lat/lon expressions such as:
%      a = lla2v(32*deg_N,60*deg_W);
% Converts number to internal units by multplying by it 
% Converts number into deg by dividing value in internal units by it. 
% See also: DEG_S, DEG_E, DEG_W, DEG

function deg_N  = unit 

deg_N  = deg;
