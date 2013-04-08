%% Evaluate units expression, show or switch units base, or show help.
%% Usage
%  units              % Prints the name of the units system in use
%  units('base')      % Prints the base unit values in use
%  units('list')      % Lists all the units m functions
%  units('help') or units('doc')   % Opens the help document for units
%  units('system')              % return path to units base system folder
%  units('system', base_folder) % change units base system
%  oldsys = units('system', base_folder) % change units base system and
%                                        % return the previous one 
%  units install      % Add units folder and SI base folder to the path
%
%  units(units_expression) % evaluates the units expression string ignoring
%                            ignoring local variables and performing some
%                            special translations like sec -> second.
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
% See also: unitsSymbols

function varargout = units (varargin)

tempunits = {'degK','degR','degC','degF'};

if isempty(varargin)

    if nargout == 0
        
        unit_SYSTEM

    else
        
        varargout{1} = unit_SYSTEM;
        
    end
    
elseif ischar(varargin{1})
    
    switch lower(varargin{1})
        
        case {'help','doc'}

            web(which('units_product_page.html'),'-helpbrowser')

        case 'setpath'
            
            base = fileparts(mfilename('fullpath'));
            addpath(base,'-END')
            addpath(fullfile(base,'si'),'-END')
            fprintf('The pathtool should open with the units and units/si folders added at the end.\n');
            fprintf('You should save the new path for future use.\n');
            pathtool
            
        case 'install'
            
            base = fileparts(mfilename('fullpath'));
            addpath(base,'-END')
            addpath(fullfile(base,'si'),'-END')
            fprintf('The pathtool should open with the units and units/si folders added at the end.\n');
            fprintf('You should save the new path for future use.\n');
            fprintf('\nYou should now also click on the MATLAB Start button and choose:\n');
            fprintf('  Desktop Tools -> View Start Button Configuration Files...\n');
            fprintf('Then click "Refresh Start Button", then click "Close". This should add or\n');
            fprintf('update the Units toolbox entry in the help browser. Right now, that just has the\n');
            fprintf('help document and a list of the units.\n');
            fprintf('Type: "units help" for the overview documentation.\n');
            fprintf('Some unit functions have other info in their function help text. Try "help lbm".\n');
            pathtool
            
            % Generate helptoc.xml

            docPath = base;
            tocfile = fullfile(docPath, 'helptoc.xml');

            fid = fopen(tocfile,'wt');
            fprintf(fid,'%s\n','<?xml version=''1.0'' encoding=''ISO-8859-1'' ?>');
            fprintf(fid,'%s\n','<toc version="1.0">');
            fprintf(fid,'%s\n','<tocitem target="units_product_page.html">Units Toolbox');

            files = dir(fullfile(base,'*.m'));

            for ii = 1:length(files)

                % TODO: possibly make the text here from the first line of
                % the file after changing to new header convention of:
                %    %% unit_name = value
                
                [~,name] = fileparts(files(ii).name);
                fprintf(fid,'%s%s%s\n','  <tocitem>', name,'</tocitem>');

            end

            fprintf(fid,'%s\n','</tocitem></toc>');
            fclose(fid);

        case {'list','ls'}
            
            pathstr = fileparts(which(mfilename));

            if nargout > 0
                
                varargout{1} = ls(fullfile(pathstr,'*.m'));

            else
                
                ls(fullfile(pathstr,'*.m'));

            end

        case 'system'
            
            if length(varargin) > 1
                
                % get old base path
                
                oldpathstr = fileparts(which('unit_SYSTEM'));

                % Check if given system is just a name or a path

                pathstr = fileparts(varargin{2});

                if isempty(pathstr)

                    % Assume is a sibling folder of the old units base
                    % folder

                    pathstr = fileparts(oldpathstr);

                    usePath = fullfile(pathstr,varargin{2});

                else % anything else, user gives a path for it

                    usePath = varargin{2};

                end

                % Verify it at least has an identifier

                if ~exist(fullfile(usePath,'unit_SYSTEM.m'), 'file')

                    if ~exist(usePath,'dir')
                        if isempty(which('unit_SYSTEM'))
                            warning('The base unit folder doesn''t appear to be on the path. Run "units setpath" to restore to si first.');
                        end
                        error('Units system folder %s does not exist.', usePath);
                    else
                        error('Units system folder %s does not apear to be valid.', usePath);
                    end

                end

                % Get si base bath
                si = fullfile(fileparts(which(mfilename)), 'si');
                
                rmpath(oldpathstr);       % Remove the old one to avoid problems
                addpath(usePath, '-END'); % Add the new one
                addpath(si,'-END');       % Add the core si base after that.

                % If output desired, we return the previous base system path
                
                if nargout > 0
                    varargout{1} = oldpathstr;
                end

            else % report current base system folder
                
                pathstr = fileparts(which('unit_SYSTEM'));

                if nargout == 0
                    fprintf('%s\n', pathstr);
                else
                    varargout{1} = pathstr;
                end
                
            end
            
        case 'base'
            
            if nargin == 1
                
                bases = {'MASS','LENGTH','TIME','TEMPERATURE', ...
                         'AMOUNT','LUMINANCE', 'CURRENT', ...
                         'ANGLE_PLANE','ANGLE_SOLID','INFORMATION'};

                for i = 1:length(bases)

                    val = feval(['unit_' bases{i}]);
                    info = feval(['unit_' bases{i} '_info']);
                    fprintf('%-12s: %s (%s) = %g\n', bases{i}, info.name, info.symbol, double(val));

                end

            else
                
                switch lower(varargin{2})
                    
                    case 'obj'
            
                        error('Will switch to unitval object based units in future');
                        
                    case {'double','normal'}
                        
                        error('Will switch to non-object based units in future');
                end
            end
            
        otherwise
            
            % Eval a units expression that may contain 'sec' for seconds
            % (since 'sec' would otherwise evaluate to the secant funtion),
            % or other special cases.
            
            if strcmpi(varargin{1},'string')
                
                if nargin == 1

                    varargout{1} = ''; % this will pass an isempty() test but also be a string

                else

                    val = varargin{2};

                    if ischar(val) || iscellstr(val)
                        
                        varargout{1} = val;
                    else
                        varargout{1} = mat2str(val);

                    end
                end
                
            else
                
                ue = units_aliases(varargin{1});
                s = warning('off','MATLAB:dispatcher:InexactMatch'); % Older warning message ID
                warning('off','MATLAB:dispatcher:InexactCaseMatch'); % Newer warning message ID
                uval = str2num(ue); %#ok<ST2NM> % Need str2num (rather than str2double) to evaluate units functions, but lighter than eval.
                warning(s);

                if nargin == 1 || isempty(uval)

                    varargout{1} = uval;

                elseif ismember(ue, tempunits)

                    % Handle temperature conversions for single units with
                    % value as second arg.
                    varargout{1} = feval(ue, varargin{2:end});

                else

                    val = varargin{2};

                    if nargin > 2 && strcmpi(varargin{3},'to')

                        varargout{1} = val / uval;
                    else
                        varargout{1} = val * uval;
                    end
                end
            end            
    end

end

function ue = units_aliases(ue)

% These translate various strings taken in a units context

% TeX aliases so you can use these in a units string and in a label.
% Do these substitutions before others that operate on whole words.

ue = regexprep(ue,'\\mu','micro*'); % \mu
ue = regexprep(ue,'\\Omega\>','ohms'); % \Omega
ue = regexprep(ue,'\{\\circ\}','\\circ'); % {\circ} -> \circ for the following
ue = regexprep(ue,'\\circ([CFRK])\>','deg$1'); % \circC, \circF, etc.
ue = regexprep(ue,'\<([CFRK])\\circ\>','$1deg'); % C\circ, etc.
ue = regexprep(ue,'\<\\circ\>','deg'); % \circ

% Case aliases
% Will probably add alias functions with case now that MATLAB is sensitive
% to it for M files.

ue = regexprep(ue,'\<Watts\>','watts');
ue = regexprep(ue,'\<kJ\>','kj');
ue = regexprep(ue,'\<kW\>','kw');
ue = regexprep(ue,'\<Joules\>','joules');
ue = regexprep(ue,'\<Hz\>','hz');
ue = regexprep(ue,'\<L\>','liters');
ue = regexprep(ue,'\<Pa\>','pa');
ue = regexprep(ue,'\<kPa\>','kpa');

% Single letters

ue = regexprep(ue,'\<J\>','joules');
ue = regexprep(ue,'\<K\>','degK');
ue = regexprep(ue,'\<W\>','watts');
ue = regexprep(ue,'\<s\>','second');
ue = regexprep(ue,'\<m\>','meter');
ue = regexprep(ue,'\<g\>','gram');

% Existing function dodges

ue = regexprep(ue,'\<sec\>','second');
ue = regexprep(ue,'\<min\>','minute'); 
ue = regexprep(ue,'\<psi\>','psia');
ue = regexprep(ue,'\<pascals*\>','pa');

% Special

ue = regexprep(ue,'\<logical\>','unitless');
ue = regexprep(ue,'\<int\>','unitless');
ue = regexprep(ue,'\<include\>','');
ue = regexprep(ue,'\<%\>','percent');
ue = regexprep(ue,'\<in\>','inch');
