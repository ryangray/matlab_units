function r = plus (p,q)

% unitval/plus  Implement p + q for unitvals.

if isa(p,'unitval') && isa(q,'unitval')

    dims = {'length','time','mass','tempurature','amount','angle_plane', ...
            'angle_solid','current','info','luminance'};
    failed = false;
    for i = 1:length(dims)
        if p.(dims{i}) ~= q.(dims{i})
            failed = true;
        end
    end
    if failed
        error('Values do not have the same units dimensions.');
    else
        r = p;
        r.value = p.value + q.value;
    end
    
elseif isa(p,'unitval')
    
    error('Right-hand side is not a units value');
    
elseif isa(q,'unitval')
    
    error('Left-hand side is not a units value');
    
end

