%% sameDimensions  Check if unitval objects have the same physical dimensions.
% Does not compare the values. Non-unitval values are considered unitless.
%
% Usage
%  same = sameDimensions(u1, u2)
%  same = sameDimensions(u1, u2, u3, ...)
%  sameDimensions(...);
%
% Without a return value used, then it is an assertion that will print a
% warning if the units do not match.
%
% See also: unitval/eq, unitsSameDimensions

% TODO: implement for where p and/or q are arrays (to help support
% times/mtimes).

function same = sameDimensions (varargin)

dims = unitval.dimensions;
Nd = length(dims);
same = true;

p = varargin{1};

if ischar(p)
    p = units(p);
end

if ~isa(p,'unitval')
    p = unitval(p);
end
iv = 2;
Nv = length(varargin);

while same && iv <= Nv
    
    q = varargin{iv};
    if ischar(q)
        q = units(q);
    end
    if ~isa(q,'unitval')
        q = unitval(q);
    end
    ii = 1;
    while same && ii <= Nd
        same = same && (p.(dims{ii}) == q.(dims{ii}));
        ii = ii + 1;
    end
    iv = iv + 1;
end

if nargout == 0 && ~same
    
    warning('Unit dimensions do not agree');
    
end
