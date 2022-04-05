%% reshape  Implement reshape for unitval objects

function r = reshape (obj, varargin)

% Cast to double to get values, call reshape and pass args to it, then pass the
% result to construct a new unitval object like the old one.

r = unitval(reshape@double(double(obj), varargin{:}), obj);
