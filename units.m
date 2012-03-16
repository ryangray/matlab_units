% Evaluate units expression, show or switch units base, or show help.
% Usage: units              % Prints the name of the units system in use
%        units('base')      % Prints the base unit values in use
%          or: units base
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
%        units install
%        units(units_expression) % evaluates the units expression string
%                                  ignoring local variables that might mask
%                                  units functions as well as allowing 'sec'

function varargout = units (varargin)

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
            
        case {'install'}
            
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
                
                [pathstr,name,ext,versn] = fileparts(files(ii).name);
                fprintf(fid,'%s%s%s\n','  <tocitem>', name,'</tocitem>');

            end

            fprintf(fid,'%s\n','</tocitem></toc>');
            fclose(fid);

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
            
            bases = {'unit_AMOUNT','unit_ANGLE_PLANE','unit_ANGLE_SOLID','unit_CURRENT', ...
                     'unit_INFORMATION','unit_LENGTH','unit_LUMINANCE','unit_MASS', ...
                     'unit_TEMPERATURE','unit_TIME'};

            for i = 1:length(bases)

                fprintf('%s = %f\n', bases{i}, str2num(bases{i})); %#ok<ST2NM>

            end

        otherwise
            
            % Eval a units expression that may contain 'sec' for seconds
            % (since 'sec' would otherwise evaluate to the secant funtion),
            % or other special cases.
            
            %ue = lower(varargin{1}); % In the future, we may not do this to have case-sensitive units.
            ue = varargin{1};
            
            ue = units_aliases(ue);
            s = warning('off','MATLAB:dispatcher:InexactMatch'); % Older warning message ID
            warning('off','MATLAB:dispatcher:InexactCaseMatch'); % Newer warning message ID
            varargout{1} = str2num(ue); %#ok<ST2NM> % Need str2num (rather than str2double) to evaluate units functions, but lighter than eval.
            warning(s);

    end

end

function ue = units_aliases(ue)

ue = regexprep(ue,'\\mu','micro*'); % so you can use the TeX \mu in a units string for micro so it will print nice too. Do this substitution before others that operate on whole words.
ue = regexprep(ue,'\\Omega\>','ohms');
ue = regexprep(ue,'C\\circ\>','Cdeg');
ue = regexprep(ue,'F\\circ\>','Fdeg');
ue = regexprep(ue,'R\\circ\>','Rdeg');
ue = regexprep(ue,'K\>','Kdeg');

% Alias uppercase things for now.
% Should switch this to rename files to uppercase and alias lowercase names
% to those.

ue = regexprep(ue,'W\>','watts');
ue = regexprep(ue,'Watts\>','watts');
ue = regexprep(ue,'kJ\>','kj');
ue = regexprep(ue,'J\>','joules');
ue = regexprep(ue,'Joules\>','joules');
ue = regexprep(ue,'Hz\>','hz');

%ue = lower(ue);

ue = regexprep(ue,'\\circ\>','deg');
ue = regexprep(ue,'\<s\>','second');
ue = regexprep(ue,'\<sec\>','second');
ue = regexprep(ue,'\<m\>','meter');
ue = regexprep(ue,'\<w\>','watt');
ue = regexprep(ue,'\<min\>','minute');
ue = regexprep(ue,'\<logical\>','unitless');
ue = regexprep(ue,'\<int\>','unitless');
ue = regexprep(ue,'\<string\>','');
