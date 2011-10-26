function r = times (p,q)

% unitval/times  Implement p .* q for unitvals.
% unitval * unitval = value fields multiply, unit fields add.
% unitval * double  = value field times double with same units
% double * unitval = same as above

if isa(p,'unitval') && isa(q,'unitval')

    dims = unitval.dimensions;
    N = length(dims);
    
    if numel(p) == 1
    
        r = q;
        
        for ii = 1:numel(q)
            
            r(ii).value = p.value .* q(ii).value;
        
            for jj = 1:N
                r(ii).(dims{jj}) = p.(dims{jj}) + q(ii).(dims{jj});
            end
        end
        
    elseif numel(q) == 1
        
        r = p;
        
        for ii = 1:numel(p)
            
            r(ii).value = p(ii).value .* q.value;
        
            for jj = 1:N
                r(ii).(dims{jj}) = p(ii).(dims{jj}) + q.(dims{jj});
            end
        end
        
    elseif numel(p) ~= numel(q)

        error('Number of elements are different');
        
    else
        
        r = p;
        
        for ii = 1:numel(p)
            
            r(ii).value = p(ii).value .* q(ii).value;
        
            for jj = 1:N
                r(ii).(dims{jj}) = p(ii).(dims{jj}) + q(ii).(dims{jj});
            end
        end
    end
    
elseif isa(p,'unitval')
    
    r = p;
    r.value = r.value * q;
    
elseif isa(q,'unitval')
    
    r = q;
    r.value = r.value * p;
    
end
