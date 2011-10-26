classdef unitval

    properties
        
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
