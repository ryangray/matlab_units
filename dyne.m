% Unit dyne
% Converts number to internal units by multplying by it 
% Converts number into foot by dividing value in internal units by it. 
% See also: CM, GRAM, SECOND

function dyne = unit

dyne = cm * gram / second^2;
