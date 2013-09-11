%% Check if units have the same physical dimensionality
% This is not a test of value equivalence; use == for that.
% For unitval objects, you can use the method sameDimensions, but this
% function lets you make a transparent check whether using unitval units or
% regular double units since when not using unitval objects, you can't call
% the sameDimensions method.

function r = unitsSameDimensions (u1, varargin)

if ischar(u1)
    
    u1 = units(u1);
    
end

if ~isa(u1, 'unitval')
    
    % Make 1st value a unitval so we can call the sameDimensions method
    % which will handle if the value it is compared to is a unitval or not.
    
    u1 = unitval(u1);
    
end

r = sameDimensions(u1, varargin{:});
