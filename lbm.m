% Unit lbm (pounds-mass)
% Converts number to internal units by multplying by it 
% Converts number into lbm by dividing value in internal units by it. 
% The pound-mass is the mass that weighs 1 pound-force at 1g, and it
% is numericlly the same amount as the pound-force. 1 lbf = 1 lbm * 1g
% The proper english mass unit is the slug: 32.174 lbf = 1 slug * 32.174 ft/s/s

function x = unit 

%fprintf('Warning: you should probably be using slugs.\n');

%x = slug / 32.174;

x = lbf / g0; % m = f/a,  1 lbf = 1 lbm * g0
