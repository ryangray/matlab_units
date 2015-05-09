%% fprintf  Implement fprintf for unitvals.
%
% This just casts any unitval parameters to double and passes the arguments 
% on to fprintf.
%
% See also: unitval/sprintf

function varargout = fprintf (varargin)

N = nargin;

for ii = 1:N
    
    if isa(varargin{ii},'unitval')
        
        varargin{ii} = double(varargin{ii});
    end
end

if nargout == 0
    
    varargout = {};
    fprintf(varargin{:});
    
else
    
    varargout{1} = fprintf(varargin{:});
end
