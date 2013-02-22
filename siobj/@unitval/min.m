%% min  Implement min(p,q) for unitvals.
% Two unitvals must have the same unit dimensions. You can also compare a
% unitval to a double zero or a unitless unitval to a double.
%
% See also: unitval/max

function r = min (p, q, dim)

if nargin == 1
    
    r = unitval(min(double(p)), p);
        
elseif isempty(q)

    r = unitval(min(double(p), [], dim), p);

else % min(p,q)
    
    if isa(p,'unitval') && isa(q,'unitval')

        if sameDimensions(p,q)
            r =unitval(min(double(p), double(q)), p);
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
