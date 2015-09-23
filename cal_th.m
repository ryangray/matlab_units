%% Unit thermochemical calorie (cal_th)
% The common nutritional calorie is really kilo*cal_IT
% See also: calorie, kcal, joule, cal_IT

function cal_th = unit 

cal_th = unit_MAKE(4.184 * joule, 'thermo calorie', 'cal_th');
