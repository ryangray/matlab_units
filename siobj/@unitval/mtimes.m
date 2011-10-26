function r = mtimes (p,q)

% unitval/mtimes  Implement p * q for unitvals.
% unitval * unitval = value fields multiply, unit fields add.
% unitval * double  = value field times double with same units
% double * unitval = same as above

if isa(p,'unitval') && isa(q,'unitval')

    dims = {'length','time','mass','tempurature','amount','angle_plane', ...
            'angle_solid','current','info','luminance'};
    r = unitval(p.value * q.value);
    for i = 1:length(dims)
        r.(dims{i}) = p.(dims{i}) + q.(dims{i});
    end
    
elseif isa(p,'unitval')
    
    r = p;
    r.value = r.value * q;
    
elseif isa(q,'unitval')
    
    r = q;
    r.value = r.value * p;
    
end

