%% Units class
%
% Implemented as a base unit module for the existing units system. This
% allows it to use all the existing unit definitions and to be switched in
% and out.
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
%
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
% gt, le, gr, ne, eq, ctranspose, transpose, horzcat, vertcat, subsref,
% subassign, subsindex. Add means to call up standard compound unit
% objects, such as 'power' so you might assert a unitval qualifies as such
% a quantity with sameDimensions(uval,unitval('power')).

classdef unitval

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
        
        value = [];
        length = 0;
        mass = 0;
        time = 0;
        current = 0;
        luminance = 0;
        amount = 0;
        tempurature = 0;
        angle_plane = 0;
        angle_solid = 0;
        info = 0;
        name = '';
        symbol = '';
    
    end

    properties (Constant = true)
        
        dimensions = {'length','mass','time','current','luminance','amount', ...
                      'tempurature','angle_plane','angle_solid','info'};
    end

    methods
        
        function obj = unitval (val, varargin)

            % unitval class constructor.
            %
            %   u = unitval(num) creates a unitval object from the number a with no units dimensions
            %   u = unitval      creates a unitval object with no units and an empty value
            %   u = unitval(uv)  creates a unitval object as a copy of the uv unitval object
            %   u = unitval(num, dimension, power, dimension, power, ...)
            %                    creates a unitval object of the number
            %                    with the unit dimensions given.
            %   u = unitval(..., 'name', string)
            %
            % Dimensions are:
            %
            % 'length','mass','time','current','luminance','amount',
            % 'temperature','angle_plane','angle_solid','info'.
            %
            % For example, 9.81 m/s^2, would be: 
            %  unitval(9.81,'length',1,'time',-2)

            if nargin > 0

                if isa(val, 'unitval') % copy object

                    obj = val;

                else

                    % Set dimensions and name
                    
                    for ii = 1:2:length(varargin)

                        obj.(lower(varargin{ii})) = varargin{ii+1};

                    end
                
                    if numel(val) > 1
                    
                        % Copy for each value
                        vals = num2cell(val);
                        obj = repmat(obj,size(val));
                        [obj.value] = vals{:};

                    else

                        obj.value = val;

                    end
                
                end

            end
        
        end
        
    end
    
end
