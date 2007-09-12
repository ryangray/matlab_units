% Units
% Usage: units              % Prints the name of the units system in use
%        units('base')      % Prints the base unit values in use
%        units('list')      % Lists all the units m functions
%          or: units list
%        units('help') or 
%            units('doc')   % Opens the help document for units
%          or: units doc
%        units('system')              % return path to units base system folder
%        units('system', base_folder) % change units base system
%        oldsys = units('system', base_folder) % change units base system
%                                              % and return the previous one 
%                                              (for later restoration)
%        units(units_expression) % evaluates the units expression string
%                                  ignoring local variables that might mask
%                                  units functions as well as allowing 'sec'

function varargout = units (varargin)

if nargin == 0

    if nargout == 0
        
        unit_SYSTEM

    else
        
        varargout{1} = unit_SYSTEM;
        
    end
    
else
    
    switch lower(varargin{1})
        
        case {'help','doc'}
            
            if ispc
                
                system(which('units.html'));
                
            elseif strcmp(computer, 'MAC')
                
                system(['open ' which('units.html')]);
                
            else
                
                units('list');
                
            end
            
        case {'list','ls'}
            
            [pathstr,name,ext,versn] = fileparts(which(mfilename));

            if nargout > 0
                
                varargout{1} = ls(fullfile(pathstr,['*.m' versn]));

            else
                
                ls(fullfile(pathstr,['*.m' versn]));

            end

        case 'system'
            
            if length(varargin) > 1
                
                % get old base path
                
                [oldpathstr,name,ext,versn] = fileparts(which('unit_SYSTEM'));

                % Check if given system is just a name or a path

                [pathstr,name,ext,versn] = fileparts(varargin{2});

                if isempty(pathstr)

                    % Assume is a subfolder of main units folder

                    [pathstr,name,ext,versn] = fileparts(which('meter'));

                    usePath = fullfile(pathstr,varargin{2});

                else % anything else, user gives a path for it

                    usePath = varargin{2};

                end

                % Verify it at least has an identifier

                if ~exist(fullfile(usePath,'unit_SYSTEM.m'), 'file')

                    warning('Units system folder %s does not apear to be valid.', usePath);

                end

                % Move specified base folder to the top of the path

                path(usePath, path);

                % If output desired, we return the previous base system path
                
                if nargout > 0
                    varargout{1} = oldpathstr;
                end

            else % report current base system folder
                
                [pathstr,name,ext,versn] = fileparts(which('unit_SYSTEM'));

                if nargout == 0
                    fprintf('%s\n', pathstr);
                else
                    varargout{1} = pathstr;
                end
                
            end
            
        case 'base'
            
            bases = {'unit_AMOUNT','unit_ANGLE_PLANE','unit_ANGLE_SOLID','unit_CURRENT', ...
                     'unit_INFORMATION','unit_LENGTH','unit_LUMINANCE','unit_MASS', ...
                     'unit_TEMPERATURE','unit_TIME'};

            for i = 1:length(bases)

                fprintf('%s = %f\n', bases{i}, str2num(bases{i}));

            end
       
        otherwise
            
            % Eval a units expression that may contain 'sec' for seconds
            % since 'sec' would otherwise evaluate to the secant funtion.
            
            ue = varargin{1};
            
            ue = units_alias('s','second', ue);
            ue = units_alias('sec','second', ue);
            ue = units_alias('m','meter', ue);
            ue = units_alias('w','watt', ue);

            s = warning('off','MATLAB:dispatcher:InexactMatch');
            varargout{1} = str2num(ue);
            warning(s);

    end
    
end

function ue = units_alias(alias, meaning, ue)

if strcmpi(ue,alias) % only alias
    ue = meaning;
else
    
    done = false;
    
    while ~done
        
        done = true;

        % Alias at start followed by an operator /, * or ^
    
        [s e t] = regexpi(ue, ['^(' alias ')[/\*\^]']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

        % Alias at end preceded by an operator / or *

        [s e t] = regexpi(ue, ['[/\*](' alias ')$']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

        % Alias in the middle preceded by an operator / or * and followed by an
        % operator /, * or ^

        [s e t] = regexpi(ue, ['[/\*](' alias ')[/\*\^]']);
        for i = length(t):-1:1
            done = false;
            ue = [ue(1:t{i}(1)-1) meaning ue(t{i}(2)+1:end)];
        end

    end
    
end
