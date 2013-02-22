%% Make a base unit value (non-object version)
% Non-object version just assigns the value.
% Object version creates a unitval and sets the name and symbol.

function unit = unit_MAKE(val, ~, ~, ~)

unit = val;
