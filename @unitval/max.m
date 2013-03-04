%% max  Implement max(p,q) for unitvals.
% Two unitvals must have the same unit dimensions. You can also compare a
% unitval to a double zero or a unitless unitval to a double.
%
% See also: unitval/min

function r = max (p, q, dim)

if nargin == 1
    
    r = unitval(max(double(p)), p);
        
elseif isempty(q)

    r = unitval(max(double(p), [], dim), p);

else % max(p,q)
    
    if isa(p,'unitval') && isa(q,'unitval')

        if sameDimensions(p,q)
            r =unitval(max(double(p), double(q)), p);
        else
            error('Values do not have the same units dimensions.');
        end

    elseif isa(p,'unitval')

        if isa(q,'double') && ~any(q(:))

            r = unitval(max(double(p), 0), p);

        elseif isunitless(p)

            r = max(double(p), q);

        else

            error('Right-hand side has no units');
        end

    elseif isa(q,'unitval')

        if isa(p,'double') && ~any(p(:))

            r = unitval(max(0, double(q)), q);

        elseif isunitless(q)

            r = max(p, double(q));

        else

            error('Left-hand side has no units');
        end

    end

end
