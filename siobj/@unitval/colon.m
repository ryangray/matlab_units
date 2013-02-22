% colon  Implement colon operator for unitvals.

function r = colon (a, d, b)

if nargin < 3

    b = d;
    d = 1;
    
end

if isa(a,'unitval') && isa(b,'unitval')

    if sameDimensions(a,b)
        
        d = checkStep(d, a);
        
    else
        error('Values do not have the same units dimensions.');
    end
    
    r = unitval(double(a):d:double(b), a);
    
elseif isa(a,'unitval')

    if isa(b,'double') && b == 0
        
        d = checkStep(d, a);

        r = unitval(double(a):d:b, a);

    else
        
        error('End value is non-zero and has no units.');
    end
    
elseif isa(b,'unitval')

    if isa(a,'double') && a == 0
        
        d = checkStep(d, b);

        r = unitval(a:d:double(b), b);
        
    else
        
        error('Start value is non-zero and has no units.');
    end
    
end

end

function d2 = checkStep (d1, s)

    if isa(d1,'unitval')

        if sameDimensions(s,d1)

            d2 = double(d1);
        else
            error('Step unit dimensions are not the same as the start and end.');
        end

    else
        
        error('Colon operator with unitval must specify an increment with units.');
        
    end
end
