%% mtimes  Implement p * q for unitval objects
% unitval * unitval = value fields multiply, unit fields add.
% unitval * double  = value field times double with same units
% double  * unitval = same as above

function r = mtimes (p, q)

if isa(p,'unitval') && isa(q,'unitval')

    dims = unitval.dimensions;
    N = length(dims);

    if isunitless(p)
        
        r = unitval(double(p) * double(q), q); % Make like q
    
        if isunitless(p) && ~isempty(p.symbol) && p.symbol(1) == ' '
            
            % Prefix
        
            r.name = [p.name q.name];
            r.symbol = [strtrim(p.symbol) q.symbol];
            if ~unitExists(r.symbol) % Not working with ms, us, etc.
                r.symbol = q.symbol;
            end

        else
            if ~isempty(p.name) && ~isempty(q.name)
                r.name = [p.name '*' q.name];
            end
            if ~isempty(p.symbol) && ~isempty(q.symbol)
                r.symbol = [p.symbol '*' q.symbol];
            end
        end
    
    elseif isunitless(q)
    
        r = unitval(double(p) * double(q), p); % Make like p  

    else % Both have unit dimensions
    
        r = unitval(double(p) * double(q)); % Make unitless
        % Merge unit dimensions
        for jj = 1:N
            r.(dims{jj}) = p.(dims{jj}) + q.(dims{jj});
        end 
    end
    
elseif isa(p,'unitval')
    
    r = unitval(double(p) * q, p);
    
else % q is a unitval
    
    r = unitval(p * double(q), q);
    
end
