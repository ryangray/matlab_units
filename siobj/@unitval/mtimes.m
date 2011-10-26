function r = mtimes (p, q)

% unitval/mtimes  Implement p * q for unitvals.
% unitval * unitval = value fields multiply, unit fields add.
% unitval * double  = value field times double with same units
% double * unitval = same as above

if isa(p,'unitval') && isa(q,'unitval')

    % Check that dimensions of all elements are the same
    
    dims = unitval.dimensions;
    same = true;
    for i = 1:length(dims)
        same = same && all([p.(dims{i})] == [q.(dims{i})]);
    end

    % Check matrix dimensions for multiply compatibility
    
    a = reshape([p.value], size(p));
    b = reshape([q.value], size(q));
    v = a * b;
    r = repmat(p(1), size(v));
    V = num2cell(v);
    [r.value] = V{:};
    
else
    
    error('Both sides of * must be unitval objects');
    
end
