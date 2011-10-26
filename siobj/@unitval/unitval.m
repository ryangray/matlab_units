function u = unitval (a, varargin)

% unitval class constructor.
%   u = unitval(a) creates a unitval object from the number a with no units
%   dimensions
%   u = unitval    creates a unitval object with no units and a value of 0
%   u = unitval(uv) creates a unitval object as a copy of the uv unitval
%   object

u.length = 0;
u.mass = 0;
u.time = 0;
u.amount = 0;
u.angle_plane = 0;
u.angle_solid = 0;
u.current = 0;
u.info = 0;
u.luminance = 0;
u.tempurature = 0;

if nargin == 0 % zero value

    u.value = 0;
    
    u = class(u,'unitval');
    
elseif isa(a, 'unitval') % copy object

    u = a;
    
else
    
    u.value = a;
    for i=1:2:length(varargin)
        u.(varargin{i}) = varargin{i+1};
    end
    u = class(u,'unitval');
    
end
