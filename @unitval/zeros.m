%% zeros  Implement zeros for unitval objects

function z = zeros (varargin)

% Not called with an existing or empty unitval obj parameter.

ii = find(cellfun(@ischar, varargin));
if isempty(ii)
    z = unitval(zeros(varargin{:})); % Shouldn't get called this way
else
    z = unitval(zeros(varargin{1:ii-1}), varargin{ii+1}); % Inherit
    % dimensionality of 'like' unitval object
end
