%% sprintf  Implement sprintf for unitvals.
%
% Like fprintf, this just casts any unitval parameters to double and passes
% the arguments on to sprintf.
%
% See also: unitval/fprintf

function varargout = sprintf (varargin)

N = nargin;

for ii = 1:N
    
    if isa(varargin{ii},'unitval')
        
        varargin{ii} = double(varargin{ii});
    end
end

[varargout{1:nargout}] = sprintf(varargin{:});
