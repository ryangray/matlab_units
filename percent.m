%% Unit percent (%)
% This is just the constant 1/100. The unit function does support '%' and
% can handle things such as: unit('53%')

function percent = unit 

percent = unit_MAKE(1.e-2, 'percent', '%'); 
