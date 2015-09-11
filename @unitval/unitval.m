%% unitval A units class to support the units library
%
% This isn't designed to be used directly, but through the units system as
% a base unit module for the existing units system. This allows it to use
% all the existing unit definitions and to be switched in and out. It
% subclasses the MATLAB double class, so ordinary functions will operate on
% the base double class and return doubles in most cases.
%
% The reason you can't use this class on its own easily is that although
% you can make a unitval with the contructor, the utility really comes from
% all the unit definition M files that combine the primitives. Otherwise,
% you have to do all of that yourself if the base units are not unitval
% objects.
%
%% Conversion
% There is the in() method for conversion that will do the division and assert
% the result is unitless. However, since unitval objects are derived from
% double, you can just use them in most places, so this works:
%  plot(x/km, y/(watts/cm^2))
%
%% Unitless/dimensionless
% Creating a unitval with no dimensions makes a unitless value:
%  unitval(x)
% Dividing a value by another with the same dimensions also creates one:
%  x = 3*km; disp(x/km)
%
%% Prefixes
% The prefix definitions call the base unit function 'unit_MAKE'. The
% non-object version just returns the value, but the object one will create
% a dimensionless unitval with the value given and the names given. The
% multiply object methods try to combine these with the base units. This
% works okay. Eventually, we can have most unit definitions calling
% unit_MAKE to set their names that aren't just derived from a prefix on a
% base unit. For example: 
%  newton = unit_MAKE(kg*meter/second^2,'Newton','N');
% For the non-object version, the first arg just gets assigned to the
% output, but for the object version, the kg*meter/second^2 expression has
% already generated a unitval object, and so the object version of
% unit_MAKE re-assigns the name and symbol properties. So, then kilo*newton
% produces a unitval with the name 'kiloNewton' and symbol 'kN'.
%
%% Comparing unit dimensionality
% You can use MATLAB's assert to assert that unitval objects have certain
% units:
%  assert(sameUnits(a, b))
% However, this isn't transparent to non-object units code since sameUnits
% is a unitval method. Calling sameUnits with a double will not resolve to
% the unitval method. For this purpose, we have the unitsSameDimenstions
% function in the units folder that you can use to work with double or
% unitval units.

% TODO: Can't extend the double() method to work on structs since they are
% not unitval objects. Instead, make a static class method for recursing
% through a struct to turn all unitval fields to doubles.
%
% reshape() is converting unitvals to double. In R2015a (possibly earlier)
% it is converting it to unitless but does not seem to be calling the
% constructor. This seems to be making its own copy and only copying the
% data from the double superclass.

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
        current = 0;     % Electric current (si = ampere)
        luminance = 0;   % Luminance (si = candela)
        amount = 0;      % Amount of a substance (si = moles)
        temperature = 0; % Temperature (si = kelvin)
        info = 0;        % Information (bit)
        name = '';       % Unit name (if simple, given or auto-composed)
        symbol = '';     % Unit symbol (for simple units)
    
    end

    properties (Constant = true)
        
        dimensions = {'length','mass','time','current','luminance','amount', ...  % List of property names that store unit dimensions
                      'temperature','info'};
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
            % Create a unitval object with units taken from the given string:
            %
            %   u = unitval(num, unitstring)
            %
            % The string must contain a valid units expression. This 
            % requires that the unitval units be in current use so that the 
            % units expression creates a unitval object. The result is then 
            % just equivalent to: num * units(unitstring)
            %
            % Set the unit's name and/or symbol:
            %
            %   u = unitval(..., 'name', string, 'symbol', string)
            %
            % Dimensions are:
            %
            % 'length','mass','time','current','luminance','amount',
            % 'temperature','info'. This can be obtained as a cell array
            % from the property .dimensions.
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
            
            if numel(varargin) == 1 && isa(varargin{1},'unitval') 
                    
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
                
            elseif numel(varargin) == 1 && ischar(varargin{1}) % unitval(value, unitstring)
                
                obj = feval('units', varargin{1}, obj);
                
            else % Normal constructor: new_unitval = unitval(val, dims, ...)
                
                for ii = 1:2:length(varargin) %#ok<CPROP>

                    obj.(lower(varargin{ii})) = varargin{ii+1};

                end
                
            end

        end
       
        function disp (obj)
            
            % DISP  Display unitval object value with unit dimensions.
            
            if ~isempty(double(obj))
                
                if ~isempty(obj.symbol) && ~isempty(units(obj.symbol))

                    disp(convert(obj,obj.symbol));
                    disp(['(' obj.symbol ')']);

                else

                    disp(double(obj))
                    disp(obj.dimensionString)

                end

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
        
            if isa(val,'unitval') && ~isempty(obj) && ~sameDimensions(obj, val)
                
                error('unitval:subsasgn','Different unit dimensionality on right hand side for subscripted assignment.');
                
            end
            
            switch s(1).type
                
                case '()' % Paren indexed
                    
                    sub = builtin('subsasgn',double(obj), s, double(val));
                    if isempty(obj)
                        obj = unitval(sub, val);
                    else
                        obj = unitval(sub, obj);
                    end
                    
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
            if isa(varargin{1},'unitval')
                newobj = unitval(data, varargin{1}(1));
            else
                newobj = data;
            end
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
            if isa(varargin{1},'unitval')
                newobj = unitval(data, varargin{1}(1));
            else
                newobj = data;
            end
        end
      
        function u = isunitless(p)

            % ISUNITLESS  Test if a unitval object is a unitless quantity

            dims = unitval.dimensions;
            u = true;

            for ii = 1:length(dims) %#ok<CPROP>
                u = u && (p.(dims{ii}) == 0);
            end
            
            u = u || all(reshape(double(p),[],1) == 0);
                
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
        
    end % methods
    
end
