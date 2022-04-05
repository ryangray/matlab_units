%% ones  Implement ones for unitval objects

function o = ones (varargin)

% Not called with an existing or empty unitval obj parameter.

ii = find(cellfun(@ischar, varargin));
if isempty(ii)
    o = unitval(ones(varargin{:})); % Shouldn't get called this way
else
    o = unitval(ones(varargin{1:ii-1}), varargin{ii+1}); % Inherit
    % dimensionality of 'like' unitval object
end
