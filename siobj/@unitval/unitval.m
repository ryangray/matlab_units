%% Units class
%
% This isn't designed to be used directly, but through the units system as
% a base unit module for the existing units system. This allows it to use
% all the existing unit definitions and to be switched in and out. It
% subclasses the MATLAB double class, so ordinary functions will operate on
% the base double class and return doubles.
%
%% Names:
% Carrying name and symbol fields. We can define rules for when names are
% set or removed and how they could combine. Ideally, prefixes would
% combine as expected with simple units. However, we could limit such
% things to the definition files. For example, in cm.m, you combine centi
% and meter, which wipes out the name, but you then give the result a new
% name and symbol.
%
%% Conversion
% Will make a method for conversion that will do the division, assert the
% result is unitless and set the name to that given. A similar method for
% converting to a string with given units for printing or display. 
%
%% Unitless/dimensionless
% We could have a valid form where the unitval is dimensionless, but has a
% name. This would support radians and steradians. With no name, such a
% value would then be labeled 'unitless'.
%
%% Prefixes
% Trying out a new base unit function 'unit_PREFIX' that the prefix
% definitions will call. Non-object ones just return the value, but the
% object base one will create a dimensionless unitval with the value given
% and the names given. However, we might want to have an indicator of a
% prefix as a flag for the name combining.
%
% TODO: implement more operator overloads: ldivide, mldivide, mpower, lt,
% gt, le, gr, ne, eq, ctranspose, transpose, subsindex. Add a way to call
% up standard compound unit objects, such as 'power' so you might assert a
% unitval qualifies as such a quantity with
% sameDimensions(uval,unitval('power')).

classdef unitval < double

    properties
        
        % If we put the dims into an array, it would be less clear, but
        % certain operations would be easier. You could do ~any(dims) to
        % check for dimensionless and do matrix operations when combining
        % values rather than looping over each dim field. Since these will
        % be private, the implementation should not matter. The constructor
        % can simply use a switch to translate the dimensioni strings into
        % the array positions.
        
        % Need to decide how arrays of unitvals should work. Right now,
        % each member in an array can be different, but if they had to eb
        % the same, we could store the array in the value field, but then
        % MATLAB could still construct arrays of these?
        
        length = 0;      % Length (si = meter)
        mass = 0;        % Mass (si = kilogram)
        time = 0;        % Time (si = second)
        current = 0;     % Electric current (si = Ampere)
        luminance = 0;   % Luminance (si = Candela)
        amount = 0;      % Amount of a substance (si = Moles)
        temperature = 0; % Temperature (si = Kelvin)
        angle_plane = 0; % Plane angle (si = radian)
        angle_solid = 0; % Solid angle (si = steradian)
        info = 0;        % Information (bit)
        name = '';       % Unit name (if simple, given or auto-composed)
        symbol = '';     % Unit symbol (for simple units)
    
    end

    properties (Constant = true)
        
        dimensions = {'length','mass','time','current','luminance','amount', ...  % List of property names that store unit dimensions
                      'temperature','angle_plane','angle_solid','info'};
    end

    methods (Static)
    
        function assert (a, b, onFail)
        
            %% Assert that two values have the same unit dimensions
            % If a and b are unitval objects, they must have the same unit
            % dimensions. If one is a unitval, then it must be unitless to
            % succeed. If both are not unitvals, then it succeeds. If the
            % assertion fails, an error is produced, unless the warn option
            % is used.
            
            errorOnFail = (nargin < 3 || ~strcmpi(onFail,'warn'));
                
            if isa(a,'unitval') && isa(b,'unitval')
                
                if ~sameDimensions(a, b)
                    
                    msg = 'Values do not have the same units dimensions.';
                    if errorOnFail
                        error(msg);
                    else
                        warning(msg);
                    end
                    
                end
                    
            elseif isa(a,'unitval')
                
                if ~isunitless(a)
                    
                    msg = 'Second value has no units';
                    if errorOnFail
                        error(msg);
                    else
                        warning(msg);
                    end
                    
                end
                
            elseif isa(b,'unitval')
                
                if ~isunitless(b)
                
                    msg = 'First value has no units';
                    if errorOnFail
                        error(msg);
                    else
                        warning(msg);
                    end
                end
                
            end
            
        end
        
    end
    
    methods
        
        function obj = unitval (val, varargin)

            % UNITVAL  Class constructor
            %
            % Create a unitval object from a double:
            %
            %   u = unitval(num)
            %
            % Create a unitval object with no units and an empty value:
            %
            %   u = unitval
            %
            % Create a unitval object from a double with the unit
            % dimensions given:
            %
            %   u = unitval(num, dimension, power, dimension, power, ...)
            %
            % Create a unitval object from a double but with the same dims
            % as another unitval object:
            %
            %   u = unitval(num, unitval_object)
            %
            % If num is instead a unitval object, then its dimensions are
            % compared to those of unitval_object, and an error is signaled
            % if they are not the same.
            %
            % Set the unit's name and/or symbol:
            %
            %   u = unitval(..., 'name', string, 'symbol', string)
            %
            % Dimensions are:
            %
            % 'length','mass','time','current','luminance','amount',
            % 'temperature','angle_plane','angle_solid','info'. This can be
            % obtained as a cell array from the property .dimensions.
            %
            % For example, 9.81 m/s^2, would be: 
            %  unitval(9.81,'length',1,'time',-2)

            if nargin == 0
                
                val = [];

            end

            obj = obj@double(val); % Store double val in superclass
            
            if isa(val, 'unitval') % copy object

                obj = val;

            end
            
            if ~isempty(varargin) && isa(varargin{1},'unitval') 
                    
                if isa(val,'unitval') % unitval(unitval_object_to_copy, unitval_object_template)
                        
                    if ~sameDimensions(val, varargin{1})

                        error('Copy constructor template units do not match unitval being copied');
                    end
                        
                else % unitval(double, unitval_object_template)
            
                    % Making a new unitval with same dimensions as an old
                    % one, but different value.

                    old = varargin{1};
                    dims = unitval.dimensions;
                    for ii = 1:length(dims) %#ok<CPROP>

                        obj.(dims{ii}) = old.(dims{ii});

                    end

                    obj.name = old.name;
                    obj.symbol = old.symbol;

                end
                
                % Set any other properties given as additional arguments
                
                for ii = 2:2:length(varargin) %#ok<CPROP>

                    obj.(lower(varargin{ii})) = varargin{ii+1};

                end
                
            else % Normal constructor: new_unitval = unitval(val, dims, ...)
                
                for ii = 1:2:length(varargin) %#ok<CPROP>

                    obj.(lower(varargin{ii})) = varargin{ii+1};

                end
                
            end

        end
       
        function disp (obj)
            
            % DISP  Display unitval object value with unit dimensions.
            
            if ~isempty(obj.symbol) && ~isempty(units(obj.symbol))
                
                disp(obj.in(obj.symbol));
                disp(['(' obj.symbol ')']);
                
            else
                
                disp(double(obj))
                disp(obj.dimensionString)
                
            end
            
        end
        
        function sref = subsref(obj, s)
            
            % SUBSREF  Subscript reference
        
            switch s(1).type
                
                case '()' % Paren indexed
                    
                    sub = builtin('subsref', double(obj), s);
                    sref = unitval(sub, obj);
                    
                case '.'
                    
                     sref = builtin('subsref', obj, s);
                     
                otherwise
                    
                    error('Not a supported subscripted reference')
            end
        end
        
        function obj = subsasgn(obj, s, val)
            
            % SUBSASGN  Subscript assignment
        
            if isa(val,'unitval') && ~sameDimensions(obj, val)
                
                error('unitval:subsasgn','Different unit dimensionality on right hand side for subscripted assignment.');
                
            end
            
            switch s(1).type
                
                case '()' % Paren indexed
                    
                    sub = builtin('subsasgn',double(obj), s, double(val));
                    obj = unitval(sub, obj);
                    
                case '.'
                    
                     obj = builtin('subsasgn',obj, s, val);
                     
                case '{}'
                    
                    error('unitval:subsasgn', 'Not a supported subscripted assignment');
                    
                otherwise
                    
                    error('Not a supported subscripted reference')
            end
        end
        
        function ind = subsindex(obj)
            % Convert the object a to double format to be used
            % as an index in an indexing expression
           ind = double(obj);
        end
        
        function newobj = horzcat(varargin)

            % HORZCAT  Horizontal concatenation
        
            % Check that all have same unit dimensionality
            if ~sameDimensions(varargin{:})
                error('Not all unitval objects have the same unit dimensionality');
            end
            % cellfun calls double on all object to get superclass part. 
            d1 = cellfun(@double, varargin, 'UniformOutput',false);
            data = horzcat(d1{:});
            newobj = unitval(data, varargin{1}(1));
        end
      
        function newobj = vertcat(varargin)
            
            % VERTCAT  Vertical concatenation

            % Check that all have same unit dimensionality
            if ~sameDimensions(varargin{:})
                error('Not all unitval objects have the same unit dimensionality');
            end
            % cellfun calls double on all object to get superclass part. 
            d1 = cellfun(@double, varargin, 'UniformOutput',false);
            data = vertcat(d1{:});
            newobj = unitval(data, varargin{1}(1));
        end
      
        function u = isunitless(p)

            % ISUNITLESS  Test if a unitval object is a unitless quantity

            dims = unitval.dimensions;
            u = true;

            for ii = 1:length(dims) %#ok<CPROP>
                u = u && (p.(dims{ii}) == 0);
            end
            if numel(p) > 1
                u = u || all(double(p) == 0);
            end
        
        end
        
        function v = in(obj, unit)
            
            % IN  Convert unitval to units specified as a double without units.
            % If unit is not specified, then it is converted based on the name.
            
            if nargin < 2
                
                if ~isempty(obj.symbol)
                
                    u = units(obj.symbol);
                    
                    if isempty(u)
                        
                        error('Unknown unit name: %s', obj.symbol);
                        
                    end
                    
                    v = obj / u;
                    
                else
                    
                    error('Unit to convert to not given and unitval has no name.');
                
                end
                
            elseif ischar(unit)
                
                v = obj / units(unit);
                
            elseif isa(unit,'unitval')
                
                v = obj / unit;
                if ~isunitless(v)
                    error('Attempt to convert to units with a different units dimensionality');
                end
                
            else
                
                error('Units to convert to must be a units expression string or a unitval object');
                
            end
            
            if ~isunitless(v)
                error('Attempt to convert a unitval to a unit of different dimensionality')
            end
            
            v = double(v);
            
        end
        
        function r = not (p)
            
            %% not  Implement ~p for unitvals.
            %
            % See also: unitval/and

            r = ~double(p);
            
        end
        
        function r = sqrt(p)
        
            % SQRT Square root
            
            r = unitval(sqrt(double(p)), p);
            dims = unitval.dimensions;
            N = length(dims); %#ok<CPROP>
            for jj = 1:N
                r.(dims{jj}) = r.(dims{jj}) / 2;
            end

        end

        function r = abs(p)
            
            r = unitval(abs(double(p)), p);
        end
        
        % function r = eps(p)
        %     
        %     r = unitval(eps(double(p)), p);
        % end
        
        function r = sum(p, varargin)
            
            r = unitval(sum(double(p), varargin{:}), p);
        end
       
        function [r, ix] = sort(p, varargin)
            
            [s, ix] = sort(double(p), varargin{:});
            r = unitval(s, p);
        end
        
    end
    
end
