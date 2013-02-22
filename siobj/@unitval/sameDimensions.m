%% sameDimensions  Returns true if all unitval objects have the same physical dimensions.
% Does not compare the values.
%
% Usage
%  sameDimensions(u1, u2)
%  sameDimensions(u1, u2, u3, ...)
%
% See also: UNITVAL/EQ

% TODO: implement for where p and/or q are arrays (help support times/mtimes

function same = sameDimensions (varargin)

dims = unitval.dimensions;
Nd = length(dims);
same = true;

p = varargin{1};

if ~isa(p,'unitval')
    p = unitval(p);
end
iv = 2;
Nv = length(varargin);

while same && iv <= Nv
    
    q = varargin{iv};
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
