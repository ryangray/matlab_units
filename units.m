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
% units('system', sysname) can also accept a path name of a valid units
% base folder. This would probably be one previously gotten from 
%
%  sysname = units('system');
%
% See also: unitsSymbols, unitsPlot, unit2str, unitval, unitsSameDimensions

function varargout = units (varargin)

tempunits = {'degK','degR','degC','degF'};

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
                % Get out to reliably detect current units system
                cwd = pwd;
                cd('..');
            end
            oldsys = fileparts(which('unit_SYSTEM'));
            if ~strcmp(oldsys,si)
                warning('Current directory is the units directory. You shouldn''t use units from here.');
            end

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
                        
                    case {'object','unitval'}
                        
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
            
            % Eval a units expression, handling special cases or conversions
            
            if strcmpi(varargin{1},'string') || strcmpi(varargin{1},'function')
                
                if nargin == 1

                    varargout{1} = ''; % this will pass an isempty() test but also be a string

                else

                    val = varargin{2};

                    if ischar(val) || iscellstr(val)
                        
                        varargout{1} = val;
                    elseif isa(val,'function_handle')
                        varargout{1} = func2str(val);
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

else
    
    error('Bad type for first argument: %s', class(varargin{1}));
    
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

% Single letters
% We don't have single letter functions

ue = regexprep(ue,'\<A\>','ampere');
ue = regexprep(ue,'\<C\>','coulomb');
ue = regexprep(ue,'\<F\>','farad');
ue = regexprep(ue,'\<g\>','gram');
ue = regexprep(ue,'\<H\>','henry');
ue = regexprep(ue,'\<J\>','joule');
ue = regexprep(ue,'\<K\>','degK');
ue = regexprep(ue,'\<[lL]\>','liter');
ue = regexprep(ue,'\<m\>','meter');
ue = regexprep(ue,'\<N\>','newton');
ue = regexprep(ue,'\<s\>','second');
ue = regexprep(ue,'\<T\>','tesla');
ue = regexprep(ue,'\<V\>','volt');
ue = regexprep(ue,'\<W\>','watt');
ue = regexprep(ue,'\<c\>','c0');

% Existing function dodges

ue = regexprep(ue,'\<cd\>','candela');
ue = regexprep(ue,'\<sec\>','second');
ue = regexprep(ue,'\<min\>','minute'); 
ue = regexprep(ue,'\<psi\>','psia');
ue = regexprep(ue,'\<pascal\>','pascals');
ue = regexprep(ue,'\<bar\>','bars');
ue = regexprep(ue,'\<knot\>','knots');

% Special

ue = regexprep(ue,'\<logical\>','unitless');
ue = regexprep(ue,'\<int\>','unitless');
ue = regexprep(ue,'\<include\>','');
ue = regexprep(ue,'\<function\>','');
ue = regexprep(ue,'\<%\>','percent');
ue = regexprep(ue,'\<in\>','inch');
ue = regexprep(ue,'\<([a-zA-Z_]+)([23])\>','$1^$2'); % e.g., cm2 -> cm^2 or m3 -> m^3
