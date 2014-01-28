%% min  Implement min(p,q) for unitvals.
% Two unitvals must have the same unit dimensions. You can also compare a
% unitval to a double zero or a unitless unitval to a double.
%
% See also: unitval/max

function [r, varargout] = min (p, q, dim)

if nargin == 1
    
    [mp, ir] = min(double(p));
    r = unitval(mp, p);
        
elseif isempty(q)

    [mp, ir] = min(double(p), [], dim);
    r = unitval(mp, p);

else % min(p,q)
    
    if nargout > 1
        [r,ir] = min(double(p), double(q)); % will generare an error
    end
    
    if isa(p,'unitval') && isa(q,'unitval')

        if sameDimensions(p,q)
            r = unitval(min(double(p), double(q)), p);
        else
            error('Values do not have the same units dimensions.');
        end

    elseif isa(p,'unitval')

        if isa(q,'double') && ~any(q(:))

            r = unitval(min(double(p), 0), p);

        elseif isunitless(p)

            r = min(double(p), q);

        else

            error('Right-hand side has no units');
        end

    elseif isa(q,'unitval')

        if isa(p,'double') && ~any(p(:))

            r = unitval(min(0, double(q)), q);

        elseif isunitless(q)

            r = min(p, double(q));

        else

            error('Left-hand side has no units');
        end

    end

end

if nargout > 1
    
    varargout = {ir};
end
