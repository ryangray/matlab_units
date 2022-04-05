%% times  Implement p .* q for unitvals.
% unitval .* unitval = value fields multiply, unit fields add.
% unitval .* double  = value field times double with same units
% double  .* unitval = same as above

function r = times (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    dims = unitval.dimensions;
    N = length(dims);

    if isunitless(p)
        
        r = unitval(double(p) .* double(q), q); % Make like q

        if ~isempty(p.name)
        
            % Use p.name as prefix
            r.name = [p.name q.name];
            r.symbol = [p.symbol q.symbol];            
        end
    
    elseif isunitless(q)
    
        r = unitval(double(p) .* double(q), p); % Make like p  

    else % Both have unit dimensions
      
        r = unitval(double(p) .* double(q)); % Make unitless
        % Merge unit dimensions
        for jj = 1:N
            r.(dims{jj}) = p.(dims{jj}) + q.(dims{jj});
        end
        
    end
    
elseif isa(p,'unitval')
    
    r = unitval(double(p) .* q, p);
    
elseif isa(q,'unitval')
    
    r = unitval(p .* double(q), q);
    
end
