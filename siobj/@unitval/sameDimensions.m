function same = sameDimensions (p, q)

% Returns true if two unitval objects have the same physical dimensions.
% Does not compare the values.
%
% See also: eq

% TODO: implement for where p and/or q are arrays (help support times/mtimes

dims = unitval.dimensions;
same = true;
for ii = 1:length(dims)
    same = same && (p.(dims{ii}) == q.(dims{ii}));
end
