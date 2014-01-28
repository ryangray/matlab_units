%% Check if units have the same physical dimensionality
% This is not a test of value equivalence; use == for that.
% For unitval objects, you can use the method sameDimensions, but this
% function lets you make a transparent check whether using unitval units or
% regular double units since when not using unitval objects, you can't call
% the sameDimensions method.
%
% Usage
%  same = unitsSameDimensions(u1, u2)
%  same = unitsSameDimensions(u1, u2, u3, ...)
%  unitsSameDimensions(...);
%
% Values can be given as strings, which are interpreted via units() to
% convert them to values.
%
% Without a return value used, then it is an assertion that will print a
% warning if the units do not match. For example:
%
%  unitsSameDimensions(speed,'m/s')
%
% See also: unitval/sameDimensions

function same = unitsSameDimensions (u1, varargin)

if ischar(u1)
    
    u1 = units(u1);
    
end

if ~isa(u1, 'unitval')
    
    % Make 1st value a unitval so we can call the sameDimensions method
    % which will handle if the value it is compared to is a unitval or not.
    
    u1 = unitval(u1);
    
end

same = sameDimensions(u1, varargin{:});

if nargout == 0 && ~same
    
    warning('Unit dimensions do not agree');
    
end
