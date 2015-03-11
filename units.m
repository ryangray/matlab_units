%% Evaluate units expression, show or switch units base, or show help.
%
%% Usage
%  units              % Prints the name of the units system in use
%  units list         % Lists all the units m functions
%  units help         % Opens the help document for units
%  units base         % Return the path to the current units system base
%  units base info    % Prints the base unit values in use
%  units base list    % List available units system bases
%  units base xxxx    % Set units system base to xxxx (si, english, cgs, etc.)
%  units class        % Show the value class for units in use (double or unitval)
%  units class double % Set the units data class to double (non-object).
%  units class object % Set the units data class to unitval (object units).
%  units install      % Add units folder to the path (run from units folder)
%
%  units(units_expression) % evaluates the units expression string ignoring
%                            ignoring local variables and performing some
%                            special translations like s and sec -> second.
%
%  units(units_expression, value)
%
% Same as value*units(units_expression) except if the units are exactly one
% of: degC, degK, degF or degR (or a TeX expression eqquivalent '\circF',
% etc), then it is equivalent to calling the unit function with the value
% as an argument to correctly convert the temperature to the current units.
% For example, units('degF', 32) is the same as degF(32). This form can be
% useful when the units are not known.
%
%  units(units_expression, value, 'to')
%
% This works similarly, except it converts the value to the units given. It
% is equivalent to value/units(units_expression), except for temperature,
% where it is like adding the 'to' parameter to the units function, for
% example: units('degC',0) is equivalent to: degC(0,'to'), converting the
% temperature of 0 in current units to degC.
%
%  units(units_expression, value, 'tostring')
%
% This is the same as 'to', but also makes a string of the converted value
% with the units appended.
%
%  units(units_expression, value, 'from')
%
% This is the same as units(units_expression, value).
%
% units('system', sysname) can also accept a path name of a valid units
% base folder. This would probably be one previously gotten from 
%
%  sysname = units('system');
%
% See also: unitsSymbols, unitsPlot, unit2str, unitval, unitsSameDimensions

function varargout = units (varargin)

if isempty(varargin)

    si = fileparts(mfilename('fullpath'));

    inUnitsDir = strcmp(pwd, si);
    if inUnitsDir
        % Get out to reliably detect current units system
        cwd = pwd;
        cd('..');
        oldsys = fileparts(which('unit_SYSTEM'));
        if ~strcmp(oldsys,si)
            warning('Current directory is the units directory. You shouldn''t use units from here.');
        end
    end
    
    if exist('unit_SYSTEM.m','file')
        
        if nargout == 0

            unit_SYSTEM

        else

            varargout{1} = unit_SYSTEM;

        end

    else
        
        warning('Units don''t appear to be installed. You should run "units install" first.');
    end
    
    if inUnitsDir
        % Restore previous pwd
        cd(cwd);
    end

elseif ischar(varargin{1})
    
    switch lower(varargin{1})
        
        case {'help','doc'}

            web(which('units_product_page.html'),'-helpbrowser')

        case 'install'
            
            si = fileparts(mfilename('fullpath'));
            addpath(si,'-END')
            fprintf('The pathtool should open with the units folder added at the end.\n');
            fprintf('You should save the new path for future use.\n');
            fprintf('You can use "units base xxxx" to change the units system base if you like.\n');
            fprintf('You can use "units base list" to see a list of valid ones.\n');
            fprintf('Type: "units help" for the overview documentation.\n');
            fprintf('Some unit functions have other info in their function help text. Try "help lbm".\n');
            pathtool
            
            % Generate helptoc.xml

            docPath = si;
            tocfile = fullfile(docPath, 'helptoc.xml');
            fprintf('Generating %s ...', tocfile);

            fid = fopen(tocfile,'wt');
            fprintf(fid,'%s\n','<?xml version=''1.0'' encoding=''ISO-8859-1'' ?>');
            fprintf(fid,'%s\n','<toc version="1.0">');
            fprintf(fid,'%s\n','<tocitem target="units_product_page.html">Units Toolbox');

            files1 = dir(fullfile(si,'*.m'));
            files2 = dir(fullfile(si,'unit_*.m'));
            files = setdiff({files1.name}, {files2.name});

            for ii = 1:length(files)

                % TODO: possibly make the text here from the first line of
                % the file after changing to new header convention of:
                %    %% unit_name = value
                
                [~,name] = fileparts(files{ii});
                fprintf(fid,'%s%s%s\n','  <tocitem>', name,'</tocitem>');

            end

            fprintf(fid,'%s\n','</tocitem></toc>');
            fclose(fid);
            fprintf('\nDone.\n');

        case {'list','ls'}
            
            si = fileparts(mfilename('fullpath'));

            if nargout > 0
                
                varargout{1} = ls(fullfile(si,'*.m'));

            else
                
                ls(fullfile(si,'*.m'));

            end

        case {'system','base'}
            
            % get old base path

            si = fileparts(mfilename('fullpath'));

            inUnitsDir = strcmp(pwd, si);
            if inUnitsDir
                warning('Current directory is the units directory. You shouldn''t use units from here.');
                % Get out to reliably detect current units system
                cwd = pwd;
                cd('..');
            end
            oldsys = fileparts(which('unit_SYSTEM'));

            if inUnitsDir
                % Restore previous pwd
                cd(cwd);
            end
            if isempty(oldsys)
                error('Units don''t appear to be installed. Run "units install".');
            end

            if length(varargin) > 1
                
                switch lower(varargin{2})
                    
                    case 'list'
                    
                        % List valid bases

                        D = dir(si);
                        D = D([D.isdir]);

                        fprintf('Available unit system bases:\n\n    si\n');

                        for id = 1:length(D)

                            if D(id).name(1) ~= '.' && exist(fullfile(si,D(id).name,'unit_SYSTEM.m'),'file')

                                fprintf('    %s\n', D(id).name);
                            end
                        end

                    case 'info'
                        
                        bases = {'MASS','LENGTH','TIME','TEMPERATURE', ...
                                 'AMOUNT','LUMINANCE', 'CURRENT', ...
                                 'ANGLE_PLANE','ANGLE_SOLID','INFORMATION'};

                        for i = 1:length(bases)

                            val = feval(['unit_' bases{i}]);
                            info = feval(['unit_' bases{i} '_info']);
                            fprintf('%-12s: %s (%s) = %g\n', bases{i}, info.name, info.symbol, double(val));

                        end

                    otherwise % Changing base system
                    
                        if ~strcmpi(varargin{2},'si')

                            % Check if given system is just a name or a path

                            pathstr = fileparts(varargin{2});

                            if isempty(pathstr)

                                % Assume is a subfolder of the units base folder

                                usePath = fullfile(si,varargin{2});

                            else % anything else, user gives a path for it

                                usePath = varargin{2};

                            end

                            % Verify it at least has an identifier

                            if ~exist(fullfile(usePath,'unit_SYSTEM.m'), 'file')

                                if ~exist(usePath,'dir')
                                    error('Units system folder %s does not exist.', usePath);
                                else
                                    error('Units system folder %s does not apear to be valid.', usePath);
                                end

                            end

                            rmpath(oldsys);       % Remove the old one
                            addpath(usePath, '-END'); % Add the new one
                            addpath(si,'-END');       % Add the core si base after that.

                        else

                            rmpath(oldsys);       % Remove the old one
                            addpath(si,'-END');       % Add the core si base.
                        end

                        if nargin > 2

                            % unit class option

                            [~] = units('class',varargin{3});
                        end

                        % If output desired, we return the previous base system path

                        if nargout > 0
                            
                            varargout{1} = oldsys;
                            
                        elseif inUnitsDir
                            
                            warning('Current directory is the units directory. You shouldn''t use units from here.');
                            cd('..');
                            unit_SYSTEM
                            cd(cwd);
                        else
                            unit_SYSTEM
                        end

                end % switch
                
            else % report current base system folder
                
                if nargout == 0
                    fprintf('%s\n', oldsys);
                else
                    varargout{1} = oldsys;
                end
                
            end
            
        case 'class'
            
            si = fileparts(mfilename('fullpath'));
            % We repeat this here rather than doing it on every call to
            % units() so as to not do it if only evaluating units.
            inUnitsDir = strcmp(pwd, si);
            if inUnitsDir
                % Get out to reliably detect current units system
                cwd = pwd;
                cd('..');
                warning('Current directory is the units directory. You shouldn''t use units from here.');
            end
            oldsys = fileparts(which('unit_MAKE'));
            if inUnitsDir
                % Restore previous pwd
                cd(cwd);
            end
            if isempty(oldsys)
                error('Units don''t appear to be installed. Run "units install".');
            end
            oldclass = class(unit_TIME);

            if nargin == 1
                
                if nargout == 0
                    
                    disp(oldclass);
                else
                    varargout{1} = oldclass;
                end
                
            else
                
                switch lower(varargin{2})
                    
                    case 'double'

                        rmpath(oldsys);
                        addpath(si,'-END');
                        
                    case {'obj','object','unitval'}
                        
                        if ~exist('unitval','class')
                            error('unitval class not found');
                        else
                            fobj = fullfile(si,'siobj');
                            mak  = fullfile(fobj,'unit_MAKE.m');
                            if ~exist(fobj,'dir') || ~exist(mak,'file')
                                error('Cannot find %s', mak);
                            end
                        end
                        rmpath(oldsys);
                        addpath(fobj, '-END');
                        addpath(si,'-END');
                        
                    otherwise
                        
                        error('Unknown units class: %s', varargin{2});
                        
                end
                
                if inUnitsDir
                    cd('..');
                end
                if nargout == 0
                    unit_SYSTEM
                else
                    varargout{1} = class(unit_TIME);
                end
                if inUnitsDir
                    cd(cwd);
                end
            end
            
        otherwise
            
            % Old-style unit eval or conversion

            switch nargin
                
                case 1
                    
                    varargout{1} = unit(varargin{1});
                    
                case 2

                    varargout{1} = unit(varargin{2}, varargin{1});

                case 3
                    
                    if ischar(varargin{3})

                        switch lower(varargin{3})
                            
                            case 'to'

                                varargout{1} = convert(varargin{2}, varargin{1});
                        
                            case 'tostring'
                                
                                varargout{1} = [num2str(convert(varargin{2}, varargin{1})) ' ' unitsSymbols(varargin{1})];
                                
                            case 'from'
                                
                                varargout{1} = unit(varargin{2}, varargin{1});
                                
                            otherwise
                                
                                error('Unknown conversion option: %s', varargin{3});
                        end
                        
                    else
                        
                        error('Invalid value for 3rd parameter.');
                        
                    end
                    
                otherwise
                    
                    error('Invalid usage.');
                    
            end

    end % switch

else
    
    varargout{1} = unit(varargin{1}, varargin{2});
    
end
